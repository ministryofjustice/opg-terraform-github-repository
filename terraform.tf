terraform {
  required_providers {
    circleci = {
      source = "TomTucka/circleci"
    }
    github = {
      source  = "integrations/github"
      version = "4.11.0"
    }
  }
  required_version = ">= 1.0.0"
}
