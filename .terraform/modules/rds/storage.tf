### AVERAGE

resource "newrelic_nrql_alert_condition" "storage_average" {

  for_each = {
    for monitoring, observability in local.rds_alerts_01 : monitoring => observability
    if observability.enable == true
  }

  policy_id                      = var.policy_channel
  type                           = "static"
  name                           = "storage_average-${each.value.type_rds}"
  description                    = "storage_average-${each.value.type_rds}"
  enabled                        = var.storage_alerts_enable
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  expiration_duration            = each.value.expiration_duration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  aggregation_window             = each.value.aggregation_window

  nrql {
    query = "SELECT average(`aws.rds.FreeStorageSpace`) FROM Metric FACET `${each.value.type_rds}` WHERE `${each.value.type_rds}` = '${each.value.name}'"
  }


  lifecycle {
    ignore_changes = [
      aggregation_delay,
      aggregation_method
    ]
  }


  critical {
    operator              = var.operator_storage_average
    threshold             = var.threshold_storage_average
    threshold_duration    = var.storage_average_duration
    threshold_occurrences = var.time_function_storage_average
  }

}