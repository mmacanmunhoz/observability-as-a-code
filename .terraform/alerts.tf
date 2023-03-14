### ALERTS

module "alerts_application" {
  source = "./modules/4signsgold"

  for_each = {
    for monitoring, observability in local.goldsign : monitoring => observability
    if observability.enable_for_this_channel == true
  }

  depends_on = [module.ops_engine_alert_channel, module.slack_alert_channel]

  ### NEW RELIC CONFIGURATION
  policy_channel = each.value.channel
  apm_entity     = data.newrelic_entity.app.application_id

  ### APDEX
  duration_apdex      = each.value.duration_apdex
  operator_apdex      = each.value.operator_apdex
  priority_apdex      = each.value.priority_apdex
  threshold_apdex     = each.value.threshold_apdex
  time_function_apdex = each.value.time_function_apdex

  ### ERROR RATE
  duration_error_rate      = each.value.duration_error_rate
  operator_error_rate      = each.value.operator_error_rate
  priority_error_rate      = each.value.priority_error_rate
  threshold_error_rate     = each.value.threshold_error_rate
  time_function_error_rate = each.value.time_function_error_rate

  ### THROUGHPUT
  duration_throughput      = each.value.duration_throughput
  operator_throughput      = each.value.operator_throughput
  priority_throughput      = each.value.priority_throughput
  threshold_throughput     = each.value.threshold_throughput
  time_function_throughput = each.value.time_function_throughput

  ### RESPONSE TIME
  duration_response_time      = each.value.duration_response_time
  operator_response_time      = each.value.operator_response_time
  priority_response_time      = each.value.priority_response_time
  threshold_response_time     = each.value.threshold_response_time
  time_function_response_time = each.value.time_function_response_time

}

module "alerts_rds" {
  source = "./modules/rds"

  for_each = {
    for monitoring, rds in local.rds_alerts : monitoring => rds
    if rds.enable_for_this_channel == true
  }

  depends_on = [module.ops_engine_alert_channel, module.slack_alert_channel]

  ### NEW RELIC CONFIGURATION
  policy_channel    = each.value.channel
  rds_name          = "keycloak-prd-aurora-cluster"
  rds_name_instance = "keycloak-prd-01"

  ### CPU AVERAGE
  cpu_average_duration      = each.value.cpu_average_duration
  threshold_cpu_average     = each.value.threshold_cpu_average
  time_function_cpu_average = each.value.time_function_cpu_average
  operator_cpu_average      = each.value.operator_cpu_average

  ### CPU SATURATION
  cpu_saturation_duration      = each.value.cpu_saturation_duration
  threshold_cpu_saturation     = each.value.threshold_cpu_saturation
  operator_cpu_saturation      = each.value.operator_cpu_saturation
  time_function_cpu_saturation = each.value.time_function_cpu_saturation

  ### MEMORY AVERAGE
  memory_average_duration      = each.value.memory_average_duration
  time_function_memory_average = each.value.time_function_memory_average
  threshold_memory_average     = each.value.threshold_memory_average
  operator_memory_average      = each.value.operator_memory_average

  ### MEMORY SATURATION
  memory_saturation_duration      = each.value.memory_saturation_duration
  threshold_memory_saturation     = each.value.threshold_memory_saturation
  time_function_memory_saturation = each.value.time_function_memory_saturation
  operator_memory_saturation      = each.value.operator_memory_saturation

  ### NETWORK AVERAGE
  network_average_duration      = each.value.network_average_duration
  operator_network_average      = each.value.operator_network_average
  threshold_network_average     = each.value.threshold_network_average
  time_function_network_average = each.value.time_function_network_average

  ### STORAGE AVERAGE
  storage_average_duration      = each.value.storage_average_duration
  threshold_storage_average     = each.value.threshold_storage_average
  time_function_storage_average = each.value.time_function_storage_average
  operator_storage_average      = each.value.operator_storage_average
}

