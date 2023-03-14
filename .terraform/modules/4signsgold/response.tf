### RESPONSE TIME

resource "newrelic_alert_condition" "response" {
  count     = var.response_alerts_enable == true ? 1 : 0
  name      = "response"
  policy_id = var.policy_channel
  type      = "apm_app_metric"
  entities  = [var.apm_entity]

  condition_scope = "application"
  metric          = "response_time_web"

  term {
    duration      = var.duration_response_time
    operator      = var.operator_response_time
    priority      = var.priority_response_time
    threshold     = var.threshold_response_time
    time_function = var.time_function_response_time
  }
}
