resource "github_actions_secret" "repository_secret" {
  for_each = var.github_secrets

  repository      = github_repository.repository.name
  secret_name     = each.key
  plaintext_value = each.value
}
