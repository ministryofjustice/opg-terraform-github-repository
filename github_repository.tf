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

module "main_branch_protection_ruleset" {
  count                       = main_branch_ruleset_enabled ? 1 : 0
  source                      = "./modules/branch_protection"
  ruleset_name                = "main"
  repository                  = github_repository.repository.name
  branch_default              = var.branch_default
  bypass_enabled              = var.bypass_enabled
  bypass_actor_id             = var.bypass_actor_id
  bypass_actor_type           = var.bypass_actor_type
  bypass_mode                 = var.bypass_mode
  branch_pat_enabled          = var.branch_pat_enabled
  branch_pat_operator         = var.branch_pat_operator
  branch_pat_pattern          = var.branch_pat_pattern
  branch_pat_name             = var.branch_pat_name
  branch_pat_negate           = var.branch_pat_negate
  author_pat_enabled          = var.author_pat_enabled
  author_pat_operator         = var.author_pat_operator
  author_pat_pattern          = var.author_pat_pattern
  author_pat_name             = var.author_pat_name
  author_pat_negate           = var.author_pat_negate
  msg_pat_enabled             = var.msg_pat_enabled
  msg_pat_operator            = var.msg_pat_operator
  msg_pat_pattern             = var.msg_pat_pattern
  msg_pat_name                = var.msg_pat_name
  msg_pat_negate              = var.msg_pat_negate
  committer_pat_enabled       = var.committer_pat_enabled
  committer_pat_operator      = var.committer_pat_operator
  committer_pat_pattern       = var.committer_pat_pattern
  committer_pat_name          = var.committer_pat_name
  committer_pat_negate        = var.committer_pat_negate
  tag_pat_enabled             = var.tag_pat_enabled
  tag_pat_operator            = var.tag_pat_operator
  tag_pat_pattern             = var.tag_pat_pattern
  tag_pat_name                = var.tag_pat_name
  tag_pat_negate              = var.tag_pat_negate
  merge_queue_enabled         = var.merge_queue_enabled
  merge_queue_timeout         = var.merge_queue_timeout
  merge_queue_grouping        = var.merge_queue_grouping
  merge_queue_max_build       = var.merge_queue_max_build
  merge_queue_max_merge       = var.merge_queue_max_merge
  merge_queue_method          = var.merge_queue_method
  merge_queue_min_merge       = var.merge_queue_min_merge
  merge_queue_min_wait        = var.merge_queue_min_wait
  pr_check_enabled            = var.pr_check_enabled
  pr_dismiss_stale            = var.pr_dismiss_stale
  pr_code_owner               = var.pr_code_owner
  pr_last_push_approval       = var.pr_last_push_approval
  pr_review_count             = var.pr_review_count
  pr_resolve_threads          = var.pr_resolve_threads
  deployments_enabled         = var.deployments_enabled
  deploy_envs                 = var.deploy_envs
  status_checks_enabled       = var.status_checks_enabled
  status_check_context        = var.status_check_context
  status_check_integration    = var.status_check_integration
  status_check_strict         = var.status_check_strict
  status_check_skip_on_create = var.status_check_skip_on_create
  code_scan_enabled           = var.code_scan_enabled
  code_scan_alert_thresh      = var.code_scan_alert_thresh
  code_scan_sec_alert_thresh  = var.code_scan_sec_alert_thresh
  code_scan_tool              = var.code_scan_tool
  allow_creation              = var.allow_creation
  allow_deletion              = var.allow_deletion
  allow_non_ff                = var.allow_non_ff
  allow_update                = var.allow_update
  linear_history              = var.linear_history
  signatures_required         = var.signatures_required
  update_allows_merge         = var.update_allows_merge
}

module "all_branch_protection_ruleset" {
  count               = all_branch_ruleset_enabled ? 1 : 0
  source              = "./modules/branch_protection"
  ruleset_name        = "all_branches"
  repository          = github_repository.repository.name
  branch_default      = "~ALL"
  signatures_required = var.signatures_required
}
