terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.15.0"
    }
  }
  required_version = ">= 1.0.11"
}


provider "newrelic" {
  account_id = var.new_relic_account
  api_key    = var.new_relic_key
  region     = var.new_relic_region
}