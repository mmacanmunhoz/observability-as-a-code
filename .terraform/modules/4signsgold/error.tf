### ERROR RATE

resource "newrelic_alert_condition" "error" {
  count     = var.error_alerts_enable == true ? 1 : 0
  name      = "error"
  policy_id = var.policy_channel
  type      = "apm_app_metric"
  entities  = [var.apm_entity]

  condition_scope = "application"
  metric          = "each.value.metric"

  term {
    duration      = var.duration_error_rate
    operator      = var.operator_error_rate
    priority      = var.priority_error_rate
    threshold     = var.threshold_error_rate
    time_function = var.time_function_error_rate
  }
}
