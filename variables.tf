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
  description = "Allow Rebase Commits"
  default     = true
  type        = bool
}

variable "allow_squash_merge" {
  description = "Allow Squash Commits"
  default     = true
  type        = bool
}

variable "allow_merge_commit" {
  description = "Allow Merge Commits"
  default     = true
  type        = bool
}


variable "allow_auto_merge" {
  description = "Allow auto-merging on pull requests"
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
variable "main_branch_ruleset_enabled" {
  description = "Whether the main branch ruleset should be created"
  type        = bool
  default     = false
}

variable "pr_branch_ruleset_enabled" {
  description = "Whether the PR branch ruleset should be created"
  type        = bool
  default     = false
}

variable "branch_default" {
  description = "The default branch name to apply the ruleset to"
  type        = string
  default     = "~DEFAULT_BRANCH"
}

# ===== Bypass Rules =====
variable "bypass_enabled" {
  description = "Enable bypass rules"
  type        = bool
  default     = false
}

variable "bypass_actor_id" {
  description = "ID of the actor that can bypass the ruleset"
  type        = number
  default     = 0
}

variable "bypass_actor_type" {
  description = "Type of actor that can bypass the ruleset"
  type        = string
  default     = "OrganizationAdmin"
}

variable "bypass_mode" {
  description = "When the actor can bypass the ruleset (e.g. always, pull_request, etc.)"
  type        = string
  default     = "always"
}

# ===== Branch name to accept or exclude pattern =====
variable "branch_pat_enabled" {
  description = "Enable branch name pattern rule"
  type        = bool
  default     = false
}

variable "branch_pat_operator" {
  description = "Operator to apply on the branch name (e.g. starts_with, ends_with, contains, regex)"
  type        = string
  default     = "starts_with"
}

variable "branch_pat_pattern" {
  description = "Pattern to match the branch name against"
  type        = string
  default     = "feature/"
}

variable "branch_pat_name" {
  description = "Name of the branch pattern rule"
  type        = string
  default     = "Branch pattern rule"
}

variable "branch_pat_negate" {
  description = "Whether to negate the branch pattern match"
  type        = bool
  default     = false
}

# ====== Commit author to accept or exclude email pattern ======
variable "author_pat_enabled" {
  description = "Enable commit author email pattern rule"
  type        = bool
  default     = false
}

variable "author_pat_operator" {
  description = "Operator to apply on the author email (e.g. contains, starts_with, ends_with, regex)"
  type        = string
  default     = "contains"
}

variable "author_pat_pattern" {
  description = "Pattern to match the author email against"
  type        = string
  default     = "@example.com"
}

variable "author_pat_name" {
  description = "Name of the author pattern rule"
  type        = string
  default     = "Author email rule"
}

variable "author_pat_negate" {
  description = "Whether to negate the author pattern match"
  type        = bool
  default     = false
}

# ===== Commit to accept or exclude message pattern =====
variable "msg_pat_enabled" {
  description = "Enable commit message pattern rule"
  type        = bool
  default     = false
}

variable "msg_pat_operator" {
  description = "Operator to apply on the commit message (e.g. regex, contains, starts_with)"
  type        = string
  default     = "regex"
}

variable "msg_pat_pattern" {
  description = "Pattern to match the commit message against"
  type        = string
  default     = "JIRA-[0-9]+"
}

variable "msg_pat_name" {
  description = "Name of the commit message pattern rule"
  type        = string
  default     = "Commit message rule"
}

variable "msg_pat_negate" {
  description = "Whether to negate the commit message pattern match"
  type        = bool
  default     = false
}

# ===== Committer to accept or exclude email pattern =====
variable "committer_pat_enabled" {
  description = "Enable committer email pattern rule"
  type        = bool
  default     = false
}

variable "committer_pat_operator" {
  description = "Operator to apply on the committer email (e.g. contains, ends_with, regex)"
  type        = string
  default     = "ends_with"
}

variable "committer_pat_pattern" {
  description = "Pattern to match the committer email against"
  type        = string
  default     = "@example.com"
}

variable "committer_pat_name" {
  description = "Name of the committer pattern rule"
  type        = string
  default     = "Committer email rule"
}

variable "committer_pat_negate" {
  description = "Whether to negate the committer pattern match"
  type        = bool
  default     = false
}

# ===== Tag name to accept or exclude pattern =====
variable "tag_pat_enabled" {
  description = "Enable tag name pattern rule"
  type        = bool
  default     = false
}

variable "tag_pat_operator" {
  description = "Operator to apply on the tag name (e.g. starts_with, regex)"
  type        = string
  default     = "starts_with"
}

variable "tag_pat_pattern" {
  description = "Pattern to match the tag name against"
  type        = string
  default     = "v"
}

variable "tag_pat_name" {
  description = "Name of the tag pattern rule"
  type        = string
  default     = "Tag pattern rule"
}

variable "tag_pat_negate" {
  description = "Whether to negate the tag pattern match"
  type        = bool
  default     = false
}

# ===== Merge queue related options =====
variable "merge_queue_enabled" {
  description = "Enable merge queue rules"
  type        = bool
  default     = false
}

variable "merge_queue_timeout" {
  description = "Timeout for merge queue operations in minutes"
  type        = number
  default     = 60
}

variable "merge_queue_grouping" {
  description = "Grouping strategy for merge queue (e.g. ALLGREEN, HEADGREEN)"
  type        = string
  default     = "ALLGREEN"
}

variable "merge_queue_max_build" {
  description = "Maximum number of concurrent builds in the merge queue"
  type        = number
  default     = 5
}

variable "merge_queue_max_merge" {
  description = "Maximum number of concurrent merges in the merge queue"
  type        = number
  default     = 5
}

variable "merge_queue_method" {
  description = "Merge method used by the merge queue (e.g. MERGE, SQUASH, REBASE)"
  type        = string
  default     = "MERGE"
}

variable "merge_queue_min_merge" {
  description = "Minimum number of successful merges required before proceeding"
  type        = number
  default     = 1
}

variable "merge_queue_min_wait" {
  description = "Minimum wait time in minutes between merge queue runs"
  type        = number
  default     = 5
}

# ===== Require a pull request checks =====
variable "pr_check_enabled" {
  description = "Enable pull request check requirements"
  type        = bool
  default     = true
}

variable "pr_dismiss_stale" {
  description = "Dismiss stale reviews when new commits are pushed"
  type        = bool
  default     = true
}

variable "pr_code_owner" {
  description = "Require code owner approval"
  type        = bool
  default     = true
}

variable "pr_last_push_approval" {
  description = "Require review approval after the most recent push"
  type        = bool
  default     = true
}

variable "pr_review_count" {
  description = "Number of required approving reviews"
  type        = number
  default     = 1
}

variable "pr_resolve_threads" {
  description = "Require all review threads to be resolved before merging"
  type        = bool
  default     = false
}

# ===== Required deployments =====
variable "deployments_enabled" {
  description = "Enable required deployment rules"
  type        = bool
  default     = false
}

variable "deploy_envs" {
  description = "List of deployment environments that must be successfully deployed to"
  type        = list(string)
  default     = ["production"]
}

# ===== Required status checks =====
variable "status_checks_enabled" {
  description = "Enable required status check rules"
  type        = bool
  default     = true
}

variable "status_check_context" {
  description = "Name of the status check context to require"
  type        = string
  default     = ""
}

variable "status_check_integration" {
  description = "ID of the integration associated with the status check"
  type        = number
  default     = null
}

variable "status_check_strict" {
  description = "Require status checks to pass on the most recent commit"
  type        = bool
  default     = true
}

variable "status_check_skip_on_create" {
  description = "Skip enforcement of status checks on branch creation"
  type        = bool
  default     = false
}

# ===== Code scanning =====
variable "code_scan_enabled" {
  description = "Enable required code scanning tools"
  type        = bool
  default     = false
}

variable "code_scan_alert_thresh" {
  description = "Alert severity threshold for blocking code scans (e.g. none, errors, all)"
  type        = string
  default     = "errors"
}

variable "code_scan_sec_alert_thresh" {
  description = "Security alert severity threshold (e.g. critical, high_or_higher, medium_or_higher)"
  type        = string
  default     = "high_or_higher"
}

variable "code_scan_tool" {
  description = "The name of the code scanning tool (e.g. CodeQL)"
  type        = string
  default     = "CodeQL"
}

# ===== Boolean flags for rule enforcement =====
variable "allow_non_ff" {
  description = "Allow non-fast-forward merges"
  type        = bool
  default     = true
}

variable "restrict_deletion" {
  description = "Restrict branch deletion to bypass"
  type        = bool
  default     = false
}

variable "restrict_update" {
  description = "Restrict branch updates to bypass"
  type        = bool
  default     = false
}

variable "restrict_creation" {
  description = "Restrict branch creation to bypass"
  type        = bool
  default     = false
}

variable "linear_history" {
  description = "Require a linear commit history"
  type        = bool
  default     = false
}

variable "signatures_required" {
  description = "Require signed commits"
  type        = bool
  default     = true
}

variable "update_allows_merge" {
  description = "Allow merging changes via update"
  type        = bool
  default     = false
}
