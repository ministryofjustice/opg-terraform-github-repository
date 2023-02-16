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
      cname = try(var.pages.cname, null)
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
      # this is a hack that is needed because of
      # https://github.com/integrations/terraform-provider-github/issues/1037
      branches,
    ]
  }
}

resource "github_branch_default" "default" {
  repository = github_repository.repository.name
  branch     = var.default_branch_name
}

resource "github_branch_protection" "repository_main" {
  count = var.branch_protection_enabled == true ? 1 : 0

  repository_id  = github_repository.repository.node_id
  pattern        = var.default_branch_name
  enforce_admins = var.enforce_admins

  required_status_checks {
    strict   = var.require_ci_pass
    contexts = var.require_ci_pass == true ? var.status_checks : null
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.dismiss_stale_reviews
    require_code_owner_reviews      = var.require_code_owner_reviews
    required_approving_review_count = var.required_approving_review_count
  }

  depends_on = [github_repository.repository]
}

resource "github_actions_secret" "repository_secret" {
  for_each = var.github_secrets

  repository      = github_repository.repository.name
  secret_name     = each.key
  plaintext_value = each.value


}
