terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.27"
    }
  }
  required_version = ">= 1.0.0"
}
