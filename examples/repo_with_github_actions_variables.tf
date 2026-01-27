module "test_repo" {
  source                    = "git@github.com:ministryofjustice/opg-terraform-github-repository.git?ref=v3.1.8"
  name                      = "opg-example"
  description               = "Example repo including rulesets"
  branch_protection_enabled = false
  default_branch_name       = "main"
  delete_branch_on_merge    = true
  developer_team            = data.github_team.opg.id
  github_actions_variables = {
    "EXAMPLE_VAR" = "example_value"
  }
  has_issues                  = true
  has_wiki                    = false
  main_branch_ruleset_enabled = true
  pr_branch_ruleset_enabled   = true
  require_ci_pass             = false
  status_check_context        = "end of workflow"
  status_checks_enabled       = true
  visibility                  = "public"
}
