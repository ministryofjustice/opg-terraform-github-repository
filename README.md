## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.repository_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection.repository_main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_ruleset.repository_all](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) | resource |
| [github_repository_ruleset.repository_main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) | resource |
| [github_team_repository.admin_team_access](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.developer_access](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.opg_access](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team.opg](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |
| [github_team.webops](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_team_only"></a> [admin\_team\_only](#input\_admin\_team\_only) | Disable developer team for this repository | `bool` | `false` | no |
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | Allow auto-merging on pull requests | `bool` | `false` | no |
| <a name="input_allow_creation"></a> [allow\_creation](#input\_allow\_creation) | Allow branch creation | `bool` | `false` | no |
| <a name="input_allow_deletion"></a> [allow\_deletion](#input\_allow\_deletion) | Allow branch deletion | `bool` | `false` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Allow Merge Commits | `bool` | `true` | no |
| <a name="input_allow_non_ff"></a> [allow\_non\_ff](#input\_allow\_non\_ff) | Allow non-fast-forward merges | `bool` | `true` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Allow Rebase Commits | `bool` | `true` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Allow Squash Commits | `bool` | `true` | no |
| <a name="input_allow_update"></a> [allow\_update](#input\_allow\_update) | Allow branch updates | `bool` | `true` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | Archives the repository if set to true | `bool` | `false` | no |
| <a name="input_author_pat_enabled"></a> [author\_pat\_enabled](#input\_author\_pat\_enabled) | Enable commit author email pattern rule | `bool` | `false` | no |
| <a name="input_author_pat_name"></a> [author\_pat\_name](#input\_author\_pat\_name) | Name of the author pattern rule | `string` | `"Author email rule"` | no |
| <a name="input_author_pat_negate"></a> [author\_pat\_negate](#input\_author\_pat\_negate) | Whether to negate the author pattern match | `bool` | `false` | no |
| <a name="input_author_pat_operator"></a> [author\_pat\_operator](#input\_author\_pat\_operator) | Operator to apply on the author email (e.g. contains, starts\_with, ends\_with, regex) | `string` | `"contains"` | no |
| <a name="input_author_pat_pattern"></a> [author\_pat\_pattern](#input\_author\_pat\_pattern) | Pattern to match the author email against | `string` | `"@example.com"` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | Meaningful only during create; set to true to produce an initial commit in the repository. | `bool` | `true` | no |
| <a name="input_branch_default"></a> [branch\_default](#input\_branch\_default) | The default branch name to apply the ruleset to | `string` | `"~DEFAULT_BRANCH"` | no |
| <a name="input_branch_pat_enabled"></a> [branch\_pat\_enabled](#input\_branch\_pat\_enabled) | Enable branch name pattern rule | `bool` | `false` | no |
| <a name="input_branch_pat_name"></a> [branch\_pat\_name](#input\_branch\_pat\_name) | Name of the branch pattern rule | `string` | `"Branch pattern rule"` | no |
| <a name="input_branch_pat_negate"></a> [branch\_pat\_negate](#input\_branch\_pat\_negate) | Whether to negate the branch pattern match | `bool` | `false` | no |
| <a name="input_branch_pat_operator"></a> [branch\_pat\_operator](#input\_branch\_pat\_operator) | Operator to apply on the branch name (e.g. starts\_with, ends\_with, contains, regex) | `string` | `"starts_with"` | no |
| <a name="input_branch_pat_pattern"></a> [branch\_pat\_pattern](#input\_branch\_pat\_pattern) | Pattern to match the branch name against | `string` | `"feature/"` | no |
| <a name="input_branch_protection_enabled"></a> [branch\_protection\_enabled](#input\_branch\_protection\_enabled) | Boolean, setting this to false will disable branch protection | `bool` | `true` | no |
| <a name="input_bypass_actor_id"></a> [bypass\_actor\_id](#input\_bypass\_actor\_id) | ID of the actor that can bypass the ruleset | `number` | `0` | no |
| <a name="input_bypass_actor_type"></a> [bypass\_actor\_type](#input\_bypass\_actor\_type) | Type of actor that can bypass the ruleset | `string` | `"OrganizationAdmin"` | no |
| <a name="input_bypass_enabled"></a> [bypass\_enabled](#input\_bypass\_enabled) | Enable bypass rules | `bool` | `false` | no |
| <a name="input_bypass_mode"></a> [bypass\_mode](#input\_bypass\_mode) | When the actor can bypass the ruleset (e.g. always, pull\_request, etc.) | `string` | `"always"` | no |
| <a name="input_code_scan_alert_thresh"></a> [code\_scan\_alert\_thresh](#input\_code\_scan\_alert\_thresh) | Alert severity threshold for blocking code scans (e.g. none, errors, all) | `string` | `"errors"` | no |
| <a name="input_code_scan_enabled"></a> [code\_scan\_enabled](#input\_code\_scan\_enabled) | Enable required code scanning tools | `bool` | `false` | no |
| <a name="input_code_scan_sec_alert_thresh"></a> [code\_scan\_sec\_alert\_thresh](#input\_code\_scan\_sec\_alert\_thresh) | Security alert severity threshold (e.g. critical, high\_or\_higher, medium\_or\_higher) | `string` | `"high_or_higher"` | no |
| <a name="input_code_scan_tool"></a> [code\_scan\_tool](#input\_code\_scan\_tool) | The name of the code scanning tool (e.g. CodeQL) | `string` | `"CodeQL"` | no |
| <a name="input_committer_pat_enabled"></a> [committer\_pat\_enabled](#input\_committer\_pat\_enabled) | Enable committer email pattern rule | `bool` | `false` | no |
| <a name="input_committer_pat_name"></a> [committer\_pat\_name](#input\_committer\_pat\_name) | Name of the committer pattern rule | `string` | `"Committer email rule"` | no |
| <a name="input_committer_pat_negate"></a> [committer\_pat\_negate](#input\_committer\_pat\_negate) | Whether to negate the committer pattern match | `bool` | `false` | no |
| <a name="input_committer_pat_operator"></a> [committer\_pat\_operator](#input\_committer\_pat\_operator) | Operator to apply on the committer email (e.g. contains, ends\_with, regex) | `string` | `"ends_with"` | no |
| <a name="input_committer_pat_pattern"></a> [committer\_pat\_pattern](#input\_committer\_pat\_pattern) | Pattern to match the committer email against | `string` | `"@example.com"` | no |
| <a name="input_default_branch_name"></a> [default\_branch\_name](#input\_default\_branch\_name) | Default branch name and the branch name with protection applied to it | `string` | `"main"` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Automatically delete head branch after a pull request is merged. | `bool` | `false` | no |
| <a name="input_deploy_envs"></a> [deploy\_envs](#input\_deploy\_envs) | List of deployment environments that must be successfully deployed to | `list(string)` | <pre>[<br/>  "production"<br/>]</pre> | no |
| <a name="input_deployments_enabled"></a> [deployments\_enabled](#input\_deployments\_enabled) | Enable required deployment rules | `bool` | `false` | no |
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
| <a name="input_linear_history"></a> [linear\_history](#input\_linear\_history) | Require a linear commit history | `bool` | `false` | no |
| <a name="input_main_branch_ruleset_enabled"></a> [main\_branch\_ruleset\_enabled](#input\_main\_branch\_ruleset\_enabled) | Whether the main branch ruleset should be created | `bool` | `false` | no |
| <a name="input_merge_queue_enabled"></a> [merge\_queue\_enabled](#input\_merge\_queue\_enabled) | Enable merge queue rules | `bool` | `false` | no |
| <a name="input_merge_queue_grouping"></a> [merge\_queue\_grouping](#input\_merge\_queue\_grouping) | Grouping strategy for merge queue (e.g. ALLGREEN, HEADGREEN) | `string` | `"ALLGREEN"` | no |
| <a name="input_merge_queue_max_build"></a> [merge\_queue\_max\_build](#input\_merge\_queue\_max\_build) | Maximum number of concurrent builds in the merge queue | `number` | `5` | no |
| <a name="input_merge_queue_max_merge"></a> [merge\_queue\_max\_merge](#input\_merge\_queue\_max\_merge) | Maximum number of concurrent merges in the merge queue | `number` | `5` | no |
| <a name="input_merge_queue_method"></a> [merge\_queue\_method](#input\_merge\_queue\_method) | Merge method used by the merge queue (e.g. MERGE, SQUASH, REBASE) | `string` | `"MERGE"` | no |
| <a name="input_merge_queue_min_merge"></a> [merge\_queue\_min\_merge](#input\_merge\_queue\_min\_merge) | Minimum number of successful merges required before proceeding | `number` | `1` | no |
| <a name="input_merge_queue_min_wait"></a> [merge\_queue\_min\_wait](#input\_merge\_queue\_min\_wait) | Minimum wait time in minutes between merge queue runs | `number` | `5` | no |
| <a name="input_merge_queue_timeout"></a> [merge\_queue\_timeout](#input\_merge\_queue\_timeout) | Timeout for merge queue operations in minutes | `number` | `60` | no |
| <a name="input_msg_pat_enabled"></a> [msg\_pat\_enabled](#input\_msg\_pat\_enabled) | Enable commit message pattern rule | `bool` | `false` | no |
| <a name="input_msg_pat_name"></a> [msg\_pat\_name](#input\_msg\_pat\_name) | Name of the commit message pattern rule | `string` | `"Commit message rule"` | no |
| <a name="input_msg_pat_negate"></a> [msg\_pat\_negate](#input\_msg\_pat\_negate) | Whether to negate the commit message pattern match | `bool` | `false` | no |
| <a name="input_msg_pat_operator"></a> [msg\_pat\_operator](#input\_msg\_pat\_operator) | Operator to apply on the commit message (e.g. regex, contains, starts\_with) | `string` | `"regex"` | no |
| <a name="input_msg_pat_pattern"></a> [msg\_pat\_pattern](#input\_msg\_pat\_pattern) | Pattern to match the commit message against | `string` | `"JIRA-[0-9]+"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the repository | `string` | n/a | yes |
| <a name="input_pages"></a> [pages](#input\_pages) | The repository's GitHub Pages configuration. (Default: {}) | `any` | `null` | no |
| <a name="input_pr_branch_ruleset_enabled"></a> [pr\_branch\_ruleset\_enabled](#input\_pr\_branch\_ruleset\_enabled) | Whether the PR branch ruleset should be created | `bool` | `false` | no |
| <a name="input_pr_check_enabled"></a> [pr\_check\_enabled](#input\_pr\_check\_enabled) | Enable pull request check requirements | `bool` | `true` | no |
| <a name="input_pr_code_owner"></a> [pr\_code\_owner](#input\_pr\_code\_owner) | Require code owner approval | `bool` | `true` | no |
| <a name="input_pr_dismiss_stale"></a> [pr\_dismiss\_stale](#input\_pr\_dismiss\_stale) | Dismiss stale reviews when new commits are pushed | `bool` | `true` | no |
| <a name="input_pr_last_push_approval"></a> [pr\_last\_push\_approval](#input\_pr\_last\_push\_approval) | Require review approval after the most recent push | `bool` | `true` | no |
| <a name="input_pr_resolve_threads"></a> [pr\_resolve\_threads](#input\_pr\_resolve\_threads) | Require all review threads to be resolved before merging | `bool` | `false` | no |
| <a name="input_pr_review_count"></a> [pr\_review\_count](#input\_pr\_review\_count) | Number of required approving reviews | `number` | `1` | no |
| <a name="input_require_ci_pass"></a> [require\_ci\_pass](#input\_require\_ci\_pass) | Require all CI checks listed in status\_checks to pass | `bool` | `true` | no |
| <a name="input_require_code_owner_reviews"></a> [require\_code\_owner\_reviews](#input\_require\_code\_owner\_reviews) | Require an approved review in pull requests including files with a designated code owner. Defaults to true | `bool` | `false` | no |
| <a name="input_require_signed_commits"></a> [require\_signed\_commits](#input\_require\_signed\_commits) | setting this to true requires all commits to be signed with GPG | `bool` | `true` | no |
| <a name="input_required_approving_review_count"></a> [required\_approving\_review\_count](#input\_required\_approving\_review\_count) | Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 1-6. Defaults to 1 | `number` | `1` | no |
| <a name="input_signatures_required"></a> [signatures\_required](#input\_signatures\_required) | Require signed commits | `bool` | `true` | no |
| <a name="input_status_check_context"></a> [status\_check\_context](#input\_status\_check\_context) | Name of the status check context to require | `string` | `""` | no |
| <a name="input_status_check_integration"></a> [status\_check\_integration](#input\_status\_check\_integration) | ID of the integration associated with the status check | `number` | `null` | no |
| <a name="input_status_check_skip_on_create"></a> [status\_check\_skip\_on\_create](#input\_status\_check\_skip\_on\_create) | Skip enforcement of status checks on branch creation | `bool` | `false` | no |
| <a name="input_status_check_strict"></a> [status\_check\_strict](#input\_status\_check\_strict) | Require status checks to pass on the most recent commit | `bool` | `true` | no |
| <a name="input_status_checks"></a> [status\_checks](#input\_status\_checks) | A list of required passing CI checks. | `list(any)` | `[]` | no |
| <a name="input_status_checks_enabled"></a> [status\_checks\_enabled](#input\_status\_checks\_enabled) | Enable required status check rules | `bool` | `true` | no |
| <a name="input_tag_pat_enabled"></a> [tag\_pat\_enabled](#input\_tag\_pat\_enabled) | Enable tag name pattern rule | `bool` | `false` | no |
| <a name="input_tag_pat_name"></a> [tag\_pat\_name](#input\_tag\_pat\_name) | Name of the tag pattern rule | `string` | `"Tag pattern rule"` | no |
| <a name="input_tag_pat_negate"></a> [tag\_pat\_negate](#input\_tag\_pat\_negate) | Whether to negate the tag pattern match | `bool` | `false` | no |
| <a name="input_tag_pat_operator"></a> [tag\_pat\_operator](#input\_tag\_pat\_operator) | Operator to apply on the tag name (e.g. starts\_with, regex) | `string` | `"starts_with"` | no |
| <a name="input_tag_pat_pattern"></a> [tag\_pat\_pattern](#input\_tag\_pat\_pattern) | Pattern to match the tag name against | `string` | `"v"` | no |
| <a name="input_template"></a> [template](#input\_template) | Template repository to use. (Default: {}) | <pre>object({<br/>    owner      = string<br/>    repository = string<br/>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | A list of topics. | `list(any)` | `[]` | no |
| <a name="input_update_allows_merge"></a> [update\_allows\_merge](#input\_update\_allows\_merge) | Allow merging changes via update | `bool` | `false` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | Visibility of the repository. | `string` | `"private"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | Enable security alerts for vulnerable dependencies. Defaults to True | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
