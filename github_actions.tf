resource "github_actions_secret" "repository_secret" {
  for_each = var.github_secrets

  repository      = github_repository.repository.name
  secret_name     = each.key
  plaintext_value = each.value
}

resource "github_actions_repository_permissions" "repository" {
  count           = length(var.allowed_github_actions) > 0 ? 1 : 0
  allowed_actions = "selected"
  allowed_actions_config {
    github_owned_allowed = true
    patterns_allowed     = var.allowed_github_actions
    verified_allowed     = false
  }
  repository = github_repository.repository.name
}
