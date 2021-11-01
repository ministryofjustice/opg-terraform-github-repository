data "github_team" "webops" {
  slug = "opg-webops"
}

data "github_team" "opg" {
  slug = "opg"
}

resource "github_team_repository" "admin_team_access" {
  team_id    = data.github_team.webops.id
  repository = github_repository.repository.name
  permission = "admin"
}

resource "github_team_repository" "developer_access" {
  count      = var.developer_team == "" ? 0 : 1
  team_id    = var.developer_team
  repository = github_repository.repository.name
  permission = "maintain"
}

resource "github_team_repository" "opg_access" {
  count      = var.developer_team == data.github_team.opg.id ? 0 : 1
  team_id    = data.github_team.opg.id
  repository = github_repository.repository.name
  permission = "push"
}
