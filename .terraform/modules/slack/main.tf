resource "newrelic_alert_channel" "this" {
  name  = var.alert_channel
  type  = "slack"

  config {
    url     = var.url_slack
    channel = var.channel_slack
  }
}


resource "newrelic_alert_policy" "this" {
  name                = var.alert_policy_name
  incident_preference = "PER_CONDITION"


  channel_ids = [newrelic_alert_channel.this.id]
}


