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
  default     = false
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

variable "create_circleci_project" {
  type        = bool
  description = "Create a CircleCI project for a repository"
  default     = true
}

variable "circleci_env_vars" {
  type        = map(any)
  description = "A map of environment variables to pass to CircleCI"
  default     = {}
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
}

variable "allow_squash_merge" {
  description = "Allow Squash Commits, defualts to true"
  default     = true
}

variable "allow_merge_commit" {
  description = "Allow Merge Commits, defualts to true"
  default     = true
}

variable "is_template" {
  description = "Define as a template repository"
  default     = false
}

variable "topics" {
  type        = list(any)
  default     = []
  description = "A list of topics."
}

variable "service_teams" {
  type        = list(any)
  default     = []
  description = "A list of teams that own this repository."
}


variable "dependent_repositories" {
  type        = list(any)
  default     = []
  description = "A list of repositories that rely on this repository."
}
