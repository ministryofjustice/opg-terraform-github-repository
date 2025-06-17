# ===== Ruleset specific variables =====
variable "ruleset_name" {
  description = "Name of the ruleset"
  type        = string
  default     = "main"
}

variable "repository" {
  description = "Name of the github repository"
  type        = string
}

# ===== Github Ruleset Variables =====
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
variable "allow_creation" {
  description = "Allow branch creation"
  type        = bool
  default     = false
}

variable "allow_deletion" {
  description = "Allow branch deletion"
  type        = bool
  default     = false
}

variable "allow_non_ff" {
  description = "Allow non-fast-forward merges"
  type        = bool
  default     = true
}

variable "allow_update" {
  description = "Allow branch updates"
  type        = bool
  default     = true
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
