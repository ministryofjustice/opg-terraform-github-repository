provider "github" {
  token = var.github_token
  owner = "ministryofjustice"
}

variable "github_token" {
  type        = string
  description = "Github Token"
}
