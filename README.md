# opg-terraform-github-repository
Standard OPG GitHub Repository Module: Managed by opg-org-infra &amp; Terraform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 4.26.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_circleci"></a> [circleci](#provider\_circleci) | 0.5.0 |
| <a name="provider_github"></a> [github](#provider\_github) | 4.26.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [circleci_project.project](https://registry.terraform.io/providers/TomTucka/circleci/latest/docs/resources/project) | resource |
| [github_actions_secret.repository_secret](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/resources/actions_secret) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/resources/branch_default) | resource |
| [github_branch_protection_v3.repository_main](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/resources/branch_protection_v3) | resource |
| [github_repository.repository](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/resources/repository) | resource |
| [github_team_repository.admin_team_access](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/resources/team_repository) | resource |
| [github_team_repository.developer_access](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/resources/team_repository) | resource |
| [github_team_repository.opg_access](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/resources/team_repository) | resource |
| [github_team.opg](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/data-sources/team) | data source |
| [github_team.webops](https://registry.terraform.io/providers/integrations/github/4.26.1/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_team_only"></a> [admin\_team\_only](#input\_admin\_team\_only) | Disable developer team for this repository | `bool` | `false` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Allow Merge Commits, defualts to true | `bool` | `true` | no |
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | Allow auto-merging on pull-requests, defualts to false | `bool` | `false` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Allow Rebase Commits, defualts to true | `bool` | `true` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Allow Squash Commits, defualts to true | `bool` | `true` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | Archives the repository if set to true | `bool` | `false` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | Meaningful only during create; set to true to produce an initial commit in the repository. | `bool` | `true` | no |
| <a name="input_branch_protection_enabled"></a> [branch\_protection\_enabled](#input\_branch\_protection\_enabled) | Boolean, setting this to false will disable branch protection | `bool` | `true` | no |
| <a name="input_circleci_env_vars"></a> [circleci\_env\_vars](#input\_circleci\_env\_vars) | A map of environment variables to pass to CircleCI | `map(any)` | `{}` | no |
| <a name="input_create_circleci_project"></a> [create\_circleci\_project](#input\_create\_circleci\_project) | Create a CircleCI project for a repository | `bool` | `true` | no |
| <a name="input_default_branch_name"></a> [default\_branch\_name](#input\_default\_branch\_name) | Default branch name and the branch name with protection applied to it | `string` | `"main"` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Automatically delete head branch after a pull request is merged. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Repository description. Leave blank for default of: Development repository | `string` | `"Development repository"` | no |
| <a name="input_developer_team"></a> [developer\_team](#input\_developer\_team) | Team ID that developers belong to | `string` | `""` | no |
| <a name="input_dismiss_stale_reviews"></a> [dismiss\_stale\_reviews](#input\_dismiss\_stale\_reviews) | Dismiss approved reviews automatically when a new commit is pushed. Defaults to true. | `bool` | `true` | no |
| <a name="input_enforce_admins"></a> [enforce\_admins](#input\_enforce\_admins) | Boolean, setting this to true enforces status checks for repository administrators | `bool` | `true` | no |
| <a name="input_github_secrets"></a> [github\_secrets](#input\_github\_secrets) | A map of secrets to pass to GitHub | `map(any)` | `{}` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | Turns on/off github issues | `bool` | `true` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | Turns on/off github projects | `bool` | `false` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | Turns on/off the github wiki | `bool` | `false` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | Home page URL for the Git repo | `string` | `""` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | Define as a template repository | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the repository | `string` | n/a | yes |
| <a name="input_pages"></a> [pages](#input\_pages) | The repository's GitHub Pages configuration. (Default: {}) | `any` | `null` | no |
| <a name="input_require_ci_pass"></a> [require\_ci\_pass](#input\_require\_ci\_pass) | Require all CI checks listed in status\_checks to pass | `bool` | `true` | no |
| <a name="input_require_code_owner_reviews"></a> [require\_code\_owner\_reviews](#input\_require\_code\_owner\_reviews) | Require an approved review in pull requests including files with a designated code owner. Defaults to true | `bool` | `false` | no |
| <a name="input_required_approving_review_count"></a> [required\_approving\_review\_count](#input\_required\_approving\_review\_count) | Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 1-6. Defaults to 1 | `number` | `1` | no |
| <a name="input_status_checks"></a> [status\_checks](#input\_status\_checks) | A list of required passing CI checks. | `list(any)` | `[]` | no |
| <a name="input_template"></a> [template](#input\_template) | Template repository to use. (Default: {}) | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | A list of topics. | `list(any)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | Visibility of the repository. | `string` | `"private"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | Enable security alerts for vulnerable dependencies. Defaults to True | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
