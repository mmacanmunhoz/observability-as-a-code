 terraform {
   required_providers {
     newrelic = {
       source = "newrelic/newrelic"
       version = "~> 3.15.0"
     }
   }
 }

resource "newrelic_alert_channel" "this" {
  name = var.alert_policy_name
  type = "opsgenie"

  config {
    api_key = var.ops_engine_api_key
    region  = var.ops_engine_region
  }
}

resource "newrelic_alert_policy" "this" {
  name                = var.alert_policy_name
  incident_preference = "PER_CONDITION"


  channel_ids = [newrelic_alert_channel.this.id]
}