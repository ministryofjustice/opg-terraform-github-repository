# Github Repository Settings
variable "name" {
  type        = string
  description = "Name of the repository"
}

variable "description" {
  type        = string
  default     = "Development repository"
  description = "Repository description. Leave blank for default of: Development repository"
}

variable "homepage_url" {
  default     = ""
  description = "Home page URL for the Git repo"
}

variable "visibility" {
  type        = string
  default     = "private"
  description = "Visibility of the repository."
}

variable "has_issues" {
  type        = bool
  default     = true
  description = "Turns on/off github issues"
}

variable "has_projects" {
  type        = bool
  default     = false
  description = "Turns on/off github projects"
}

variable "has_wiki" {
  type        = bool
  default     = false
  description = "Turns on/off the github wiki"
}

variable "delete_branch_on_merge" {
  type        = bool
  default     = false
  description = "Automatically delete head branch after a pull request is merged."
}

variable "auto_init" {
  type        = bool
  default     = true
  description = "Meaningful only during create; set to true to produce an initial commit in the repository."
}

variable "archived" {
  type        = bool
  default     = false
  description = "Archives the repository if set to true"
}

# Github Branch Protection
variable "branch_protection_enabled" {
  type        = bool
  default     = true
  description = "Boolean, setting this to false will disable branch protection"
}

variable "enforce_admins" {
  type        = bool
  default     = true
  description = "Boolean, setting this to true enforces status checks for repository administrators"
}

variable "require_ci_pass" {
  type        = bool
  default     = true
  description = "Require all CI checks listed in status_checks to pass"
}

variable "status_checks" {
  type        = list(any)
  default     = []
  description = "A list of required passing CI checks."
}

variable "require_signed_commits" {
  type        = bool
  default     = true
  description = "setting this to true requires all commits to be signed with GPG"
}

# Pull Request Reviews
variable "dismiss_stale_reviews" {
  type        = bool
  default     = true
  description = "Dismiss approved reviews automatically when a new commit is pushed. Defaults to true."
}

variable "require_code_owner_reviews" {
  type        = bool
  default     = false
  description = " Require an approved review in pull requests including files with a designated code owner. Defaults to true"
}

variable "required_approving_review_count" {
  type        = number
  default     = 1
  description = "Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 1-6. Defaults to 1"
}

variable "admin_team_only" {
  type        = bool
  description = "Disable developer team for this repository"
  default     = false
}

variable "developer_team" {
  type        = string
  description = "Team ID that developers belong to"
  default     = ""
}


variable "default_branch_name" {
  type        = string
  description = "Default branch name and the branch name with protection applied to it"
  default     = "main"
}

variable "pages" {
  description = "The repository's GitHub Pages configuration. (Default: {})"
  type        = any
  default     = null
}

variable "vulnerability_alerts" {
  description = "Enable security alerts for vulnerable dependencies. Defaults to True"
  default     = true
}

variable "github_secrets" {
  type        = map(any)
  description = "A map of secrets to pass to GitHub"
  default     = {}
}

variable "template" {
  description = "Template repository to use. (Default: {})"
  type = object({
    owner      = string
    repository = string
  })
  default = null
}

variable "allow_rebase_merge" {
  description = "Allow Rebase Commits, defualts to true"
  default     = true
  type        = bool
}

variable "allow_squash_merge" {
  description = "Allow Squash Commits, defualts to true"
  default     = true
  type        = bool
}

variable "allow_merge_commit" {
  description = "Allow Merge Commits, defualts to true"
  default     = true
  type        = bool
}


variable "allow_auto_merge" {
  description = "Allow auto-merging on pull-requests"
  default     = false
  type        = bool
}


variable "is_template" {
  description = "Define as a template repository"
  default     = false
  type        = bool
}

variable "topics" {
  type        = list(any)
  default     = []
  description = "A list of topics."
}






# ===== Github Ruleset Variables =====
variable "ruleset_enabled" {
  description = "Whether the ruleset should be created"
  type        = bool
  default     = true
}

variable "repository_name" {
  description = "The name of the GitHub repository"
  type        = string
}

variable "branch_default" {
  description = "The default branch name to apply the ruleset to"
  type        = string
  default     = "~DEFAULT_BRANCH"
}

variable "bypass_enabled" {
  description = "Enable bypass rules"
  type        = bool
  default     = false
}

variable "bypass_actor_id" {
  description = "ID of the actor that can bypass the ruleset"
  type        = number
  default     = 1
}

variable "bypass_actor_type" {
  description = "Type of actor that can bypass the ruleset"
  type        = string
  default     = "OrganizationAdmin"
}

variable "bypass_mode" {
  description = "When the actor can bypass the ruleset"
  type        = string
  default     = "always"
}

# Branch name pattern
variable "branch_pat_enabled" {
  description = "Enable branch name pattern rule"
  type        = bool
  default     = false
}

variable "branch_pat_operator" {
  type    = string
  default = "starts_with"
}

variable "branch_pat_pattern" {
  type    = string
  default = "feature/"
}

variable "branch_pat_name" {
  type    = string
  default = "Branch pattern rule"
}

variable "branch_pat_negate" {
  type    = bool
  default = false
}

# Commit author email pattern
variable "author_pat_enabled" {
  type    = bool
  default = false
}

variable "author_pat_operator" {
  type    = string
  default = "contains"
}

variable "author_pat_pattern" {
  type    = string
  default = "@example.com"
}

variable "author_pat_name" {
  type    = string
  default = "Author email rule"
}

variable "author_pat_negate" {
  type    = bool
  default = false
}

# Commit message pattern
variable "msg_pat_enabled" {
  type    = bool
  default = false
}

variable "msg_pat_operator" {
  type    = string
  default = "regex"
}

variable "msg_pat_pattern" {
  type    = string
  default = "JIRA-[0-9]+"
}

variable "msg_pat_name" {
  type    = string
  default = "Commit message rule"
}

variable "msg_pat_negate" {
  type    = bool
  default = false
}

# Committer email pattern
variable "committer_pat_enabled" {
  type    = bool
  default = false
}

variable "committer_pat_operator" {
  type    = string
  default = "ends_with"
}

variable "committer_pat_pattern" {
  type    = string
  default = "@example.com"
}

variable "committer_pat_name" {
  type    = string
  default = "Committer email rule"
}

variable "committer_pat_negate" {
  type    = bool
  default = false
}

# Tag name pattern
variable "tag_pat_enabled" {
  type    = bool
  default = false
}

variable "tag_pat_operator" {
  type    = string
  default = "starts_with"
}

variable "tag_pat_pattern" {
  type    = string
  default = "v"
}

variable "tag_pat_name" {
  type    = string
  default = "Tag pattern rule"
}

variable "tag_pat_negate" {
  type    = bool
  default = false
}

# Merge queue
variable "merge_queue_enabled" {
  type    = bool
  default = false
}

variable "merge_queue_timeout" {
  type    = number
  default = 60
}

variable "merge_queue_grouping" {
  type    = string
  default = "ALLGREEN"
}

variable "merge_queue_max_build" {
  type    = number
  default = 5
}

variable "merge_queue_max_merge" {
  type    = number
  default = 5
}

variable "merge_queue_method" {
  type    = string
  default = "MERGE"
}

variable "merge_queue_min_merge" {
  type    = number
  default = 1
}

variable "merge_queue_min_wait" {
  type    = number
  default = 5
}

# Pull request checks
variable "pr_check_enabled" {
  type    = bool
  default = false
}

variable "pr_dismiss_stale" {
  type    = bool
  default = false
}

variable "pr_code_owner" {
  type    = bool
  default = false
}

variable "pr_last_push_approval" {
  type    = bool
  default = false
}

variable "pr_review_count" {
  type    = number
  default = 1
}

variable "pr_resolve_threads" {
  type    = bool
  default = false
}

# Required deployments
variable "deployments_enabled" {
  type    = bool
  default = false
}

variable "deploy_envs" {
  type    = list(string)
  default = ["production"]
}

# Required status checks
variable "status_checks_enabled" {
  type    = bool
  default = false
}

variable "status_check_context" {
  type    = string
  default = "ci/test"
}

variable "status_check_integration" {
  type    = number
  default = null
}

variable "status_check_strict" {
  type    = bool
  default = false
}

variable "status_check_skip_on_create" {
  type    = bool
  default = false
}

# Code scanning
variable "code_scan_enabled" {
  type    = bool
  default = false
}

variable "code_scan_alert_thresh" {
  type    = string
  default = "errors"
}

variable "code_scan_sec_alert_thresh" {
  type    = string
  default = "high_or_higher"
}

variable "code_scan_tool" {
  type    = string
  default = "CodeQL"
}

# Boolean flags for rule enforcement
variable "allow_creation" {
  type    = bool
  default = false
}

variable "allow_deletion" {
  type    = bool
  default = false
}

variable "allow_non_ff" {
  type    = bool
  default = true
}

variable "allow_update" {
  type    = bool
  default = true
}

variable "linear_history" {
  type    = bool
  default = false
}

variable "signatures_required" {
  type    = bool
  default = false
}

variable "update_allows_merge" {
  type    = bool
  default = false
}
