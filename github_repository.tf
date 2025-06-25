resource "github_repository" "repository" {
  name = var.name

  allow_merge_commit     = var.allow_merge_commit
  allow_auto_merge       = var.allow_auto_merge
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  archived               = var.archived
  auto_init              = var.auto_init
  description            = "${var.description}: Managed by opg-org-infra & Terraform"
  delete_branch_on_merge = var.delete_branch_on_merge
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  has_downloads          = false
  homepage_url           = var.homepage_url
  is_template            = var.is_template
  visibility             = var.visibility
  vulnerability_alerts   = var.vulnerability_alerts
  topics                 = var.topics

  dynamic "pages" {
    for_each = var.pages != null ? [true] : []

    content {
      source {
        branch = var.pages.branch
        path   = try(var.pages.path, "/")
      }
      build_type = try(var.pages.build_type, "legacy")
      cname      = try(var.pages.cname, null)
    }
  }

  dynamic "template" {
    for_each = var.template == null ? [] : [var.template]

    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }

  # this is a terrible hack that is needed because of
  # https://github.com/terraform-providers/terraform-provider-github/issues/155
  # NOTE: that we only do this on the repo and still care about it when looking
  # at branch protection
  lifecycle {
    ignore_changes = [
      auto_init,
    ]
  }
}

resource "github_branch_default" "default" {
  repository = github_repository.repository.name
  branch     = var.default_branch_name
}

resource "github_branch_protection" "repository_main" {
  count = var.branch_protection_enabled == true ? 1 : 0

  repository_id  = github_repository.repository.name
  pattern        = var.default_branch_name
  enforce_admins = var.enforce_admins

  required_status_checks {
    strict   = var.require_ci_pass
    contexts = var.status_checks
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.dismiss_stale_reviews
    require_code_owner_reviews      = var.require_code_owner_reviews
    required_approving_review_count = var.required_approving_review_count
  }

  require_signed_commits = var.require_signed_commits

  depends_on = [github_repository.repository]
}

resource "github_actions_secret" "repository_secret" {
  for_each = var.github_secrets

  repository      = github_repository.repository.name
  secret_name     = each.key
  plaintext_value = each.value
}

resource "github_repository_ruleset" "repository_main" {
  count       = var.main_branch_ruleset_enabled ? 1 : 0
  name        = "main_branch"
  repository  = github_repository.repository.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = [var.branch_default]
      exclude = []
    }
  }

  dynamic "bypass_actors" {
    for_each = var.bypass_enabled ? [1] : []
    content {
      actor_id    = var.bypass_actor_id
      actor_type  = var.bypass_actor_type
      bypass_mode = var.bypass_mode
    }
  }

  rules {
    creation                      = var.restrict_creation
    deletion                      = var.restrict_deletion
    non_fast_forward              = var.prevent_force_push
    update                        = var.restrict_update
    required_linear_history       = var.linear_history
    required_signatures           = var.signatures_required
    update_allows_fetch_and_merge = var.update_allows_merge

    # Restrictions on branch name
    dynamic "branch_name_pattern" {
      for_each = var.branch_pat_enabled ? [1] : []
      content {
        operator = var.branch_pat_operator
        pattern  = var.branch_pat_pattern
        name     = var.branch_pat_name
        negate   = var.branch_pat_negate
      }
    }

    # Restrictions on author email pattern
    dynamic "commit_author_email_pattern" {
      for_each = var.author_pat_enabled ? [1] : []
      content {
        operator = var.author_pat_operator
        pattern  = var.author_pat_pattern
        name     = var.author_pat_name
        negate   = var.author_pat_negate
      }
    }

    # Restrictions on commit message pattern
    dynamic "commit_message_pattern" {
      for_each = var.msg_pat_enabled ? [1] : []
      content {
        operator = var.msg_pat_operator
        pattern  = var.msg_pat_pattern
        name     = var.msg_pat_name
        negate   = var.msg_pat_negate
      }
    }

    # Restrictions on committer email pattern
    dynamic "committer_email_pattern" {
      for_each = var.committer_pat_enabled ? [1] : []
      content {
        operator = var.committer_pat_operator
        pattern  = var.committer_pat_pattern
        name     = var.committer_pat_name
        negate   = var.committer_pat_negate
      }
    }

    # Restrictions on tag pattern
    dynamic "tag_name_pattern" {
      for_each = var.tag_pat_enabled ? [1] : []
      content {
        operator = var.tag_pat_operator
        pattern  = var.tag_pat_pattern
        name     = var.tag_pat_name
        negate   = var.tag_pat_negate
      }
    }

    # Merge queues - automate the merging of pull requests into a busy branch
    dynamic "merge_queue" {
      for_each = var.merge_queue_enabled ? [1] : []
      content {
        check_response_timeout_minutes    = var.merge_queue_timeout
        grouping_strategy                 = var.merge_queue_grouping
        max_entries_to_build              = var.merge_queue_max_build
        max_entries_to_merge              = var.merge_queue_max_merge
        merge_method                      = var.merge_queue_method
        min_entries_to_merge              = var.merge_queue_min_merge
        min_entries_to_merge_wait_minutes = var.merge_queue_min_wait
      }
    }

    # Require a pull request before merging
    dynamic "pull_request" {
      for_each = var.pr_check_enabled ? [1] : []
      content {
        dismiss_stale_reviews_on_push     = var.pr_dismiss_stale
        require_code_owner_review         = var.pr_code_owner
        require_last_push_approval        = var.pr_last_push_approval
        required_approving_review_count   = var.pr_review_count
        required_review_thread_resolution = var.pr_resolve_threads
      }
    }

    # Deployments that are required to pass
    dynamic "required_deployments" {
      for_each = var.deployments_enabled ? [1] : []
      content {
        required_deployment_environments = var.deploy_envs
      }
    }

    # Status checks that are required
    dynamic "required_status_checks" {
      for_each = var.status_checks_enabled ? [1] : []
      content {
        dynamic "required_check" {
          for_each = [
            {
              context        = var.status_check_context
              integration_id = var.status_check_integration
            }
          ]
          content {
            context        = required_check.value.context
            integration_id = required_check.value.integration_id
          }
        }

        strict_required_status_checks_policy = var.status_check_strict
        do_not_enforce_on_create             = var.status_check_skip_on_create
      }
    }

    # Code scanning tools that are required to be used
    dynamic "required_code_scanning" {
      for_each = var.code_scan_enabled ? [1] : []
      content {
        dynamic "required_code_scanning_tool" {
          for_each = [
            {
              alerts_threshold          = var.code_scan_alert_thresh
              security_alerts_threshold = var.code_scan_sec_alert_thresh
              tool                      = var.code_scan_tool
            }
          ]
          content {
            alerts_threshold          = required_code_scanning_tool.value.alerts_threshold
            security_alerts_threshold = required_code_scanning_tool.value.security_alerts_threshold
            tool                      = required_code_scanning_tool.value.tool
          }
        }
      }
    }
  }
}

resource "github_repository_ruleset" "repository_all" {
  count       = var.pr_branch_ruleset_enabled ? 1 : 0
  name        = "pull_request_branches"
  repository  = github_repository.repository.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~ALL"]
      exclude = [var.branch_default]
    }
  }
  rules {
    required_signatures = var.signatures_required
  }
}
