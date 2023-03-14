### OPSENGINE CHANNEL

module "ops_engine_alert_channel" {
  source             = "./modules/opsengine"
  alert_policy_name  = "poc-application"
  ops_engine_api_key = var.ops_engine_api_key
  api_key            = var.new_relic_key
  account_id         = var.new_relic_account
}

### SLACK CHANNEL

module "slack_alert_channel" {
  source            = "./modules/slack"
  alert_policy_name = "poc-application-slack"
  alert_channel     = "poc-newrelic"
  url_slack         = ""
  channel_slack     = "poc-newrelic"
}



