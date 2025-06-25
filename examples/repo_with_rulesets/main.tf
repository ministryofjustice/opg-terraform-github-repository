terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
  required_version = "1.11.4"
}

provider "github" {
  token = var.github_token
  owner = "ministryofjustice"
}

variable "github_token" {
  type        = string
  description = "Github Token"
}

data "github_team" "opg" {
  slug = "opg"
}

module "test_repo" {
  source                      = "git@github.com:ministryofjustice/opg-terraform-github-repository.git?ref=v3.1.8"
  name                        = "opg-example"
  description                 = "Example repo including rulesets"
  visibility                  = "public"
  default_branch_name         = "main"
  developer_team              = data.github_team.opg.id
  require_ci_pass             = false
  has_issues                  = true
  has_wiki                    = false
  delete_branch_on_merge      = true
  branch_protection_enabled   = false
  pr_branch_ruleset_enabled   = true
  main_branch_ruleset_enabled = true
  status_checks_enabled       = true
  status_check_context        = "end of workflow"
}
