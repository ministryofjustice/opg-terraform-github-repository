terraform {
  required_providers {
    circleci = {
      source = "TomTucka/circleci"
    }
    github = {
      source  = "integrations/github"
      version = ">= 4.26.1"
    }
  }
  required_version = ">= 1.0.0"
}
