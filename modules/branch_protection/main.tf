resource "github_repository_ruleset" "repository_main" {
  name        = var.ruleset_name
  repository  = var.repository
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
    creation                      = var.allow_creation
    deletion                      = var.allow_deletion
    non_fast_forward              = var.allow_non_ff
    update                        = var.allow_update
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
