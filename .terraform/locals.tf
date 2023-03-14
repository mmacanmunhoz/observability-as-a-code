locals {
  rds_alerts = {
    "slack" = {
      ### ANOTHER VARIABLES
      enable_for_this_channel = true,
      channel                 = module.slack_alert_channel.policy_channel
      ### CPU AVERAGE
      cpu_average_duration      = 300,
      threshold_cpu_average     = 5,
      time_function_cpu_average = "all",
      operator_cpu_average      = "above",
      ### CPU SATURATION
      cpu_saturation_duration      = 300,
      threshold_cpu_saturation     = 5,
      operator_cpu_saturation      = "above",
      time_function_cpu_saturation = "all",
      ### MEMORY AVERAGE
      memory_average_duration      = 300,
      time_function_memory_average = "all",
      threshold_memory_average     = 5,
      operator_memory_average      = "above",
      ### MEMORY SATURATION
      memory_saturation_duration      = 300,
      time_function_memory_saturation = "all",
      threshold_memory_saturation     = 5,
      operator_memory_saturation      = "above",
      ### STORAGE AVERAGE
      storage_average_duration      = 300,
      threshold_storage_average     = 5,
      time_function_storage_average = "all",
      operator_storage_average      = "above",
      ### NETWORK AVERAGE
      network_average_duration      = 300,
      operator_network_average      = "above",
      threshold_network_average     = 5,
      time_function_network_average = "all",
    },
    "opsgenie" = {
      enable_for_this_channel = false,
      channel                 = module.ops_engine_alert_channel.policy_channel
      ### CPU AVERAGE
      cpu_average_duration      = 300,
      threshold_cpu_average     = 5,
      time_function_cpu_average = "all",
      operator_cpu_average      = "above",
      ### CPU SATURATION
      cpu_saturation_duration      = 300,
      threshold_cpu_saturation     = 5,
      operator_cpu_saturation      = "above",
      time_function_cpu_saturation = "all",
      ### MEMORY AVERAGE
      memory_average_duration      = 300,
      time_function_memory_average = "all",
      threshold_memory_average     = 5,
      operator_memory_average      = "above",
      ### MEMORY SATURATION
      memory_saturation_duration      = 300,
      time_function_memory_saturation = "all",
      threshold_memory_saturation     = 5,
      operator_memory_saturation      = "above",
      ### STORAGE AVERAGE
      storage_average_duration      = 300,
      threshold_storage_average     = 5,
      time_function_storage_average = "all",
      operator_storage_average      = "above",
      ### NETWORK AVERAGE
      network_average_duration      = 300,
      operator_network_average      = "above",
      threshold_network_average     = 5,
      time_function_network_average = "all",
    }
  }
  goldsign = {
    "slack" = {
      ### ANOTHER VARIABLES
      enable_for_this_channel = true,
      channel                 = module.slack_alert_channel.policy_channel,
      ### APDEX
      duration_apdex      = 5,
      operator_apdex      = "below",
      priority_apdex      = "critical",
      threshold_apdex     = "0.75",
      time_function_apdex = "any",
      ### ERROR RATE
      duration_error_rate      = 5,
      operator_error_rate      = "above",
      priority_error_rate      = "critical",
      threshold_error_rate     = "2",
      time_function_error_rate = "all",
      ### THROUGHPUT
      duration_throughput      = 5,
      operator_throughput      = "above",
      priority_throughput      = "critical",
      threshold_throughput     = "1000",
      time_function_throughput = "all",
      ### RESPONSE TIME
      duration_response_time      = 5,
      operator_response_time      = "above",
      priority_response_time      = "critical",
      threshold_response_time     = "10",
      time_function_response_time = "all"
    },
    "opsgenie" = {
      ### ANOTHER VARIABLES
      enable_for_this_channel = false,
      channel                 = module.ops_engine_alert_channel.policy_channel,
      ### APDEX
      duration_apdex      = 5,
      operator_apdex      = "below",
      priority_apdex      = "critical",
      threshold_apdex     = "0.75",
      time_function_apdex = "any",
      ### ERROR RATE
      duration_error_rate      = 5,
      operator_error_rate      = "above",
      priority_error_rate      = "critical",
      threshold_error_rate     = "2",
      time_function_error_rate = "all",
      ### THROUGHPUT
      duration_throughput      = 5,
      operator_throughput      = "above",
      priority_throughput      = "critical",
      threshold_throughput     = "1000",
      time_function_throughput = "all",
      ### RESPONSE TIME
      duration_response_time      = 5,
      operator_response_time      = "above",
      priority_response_time      = "critical",
      threshold_response_time     = "10",
      time_function_response_time = "all"

    }
  }
  add_dashboard = {
        # "01" = {
        #   title  = ""
        #   row    = 1
        #   column = 1
        #   width  = 6
        #   height = 3
        #   query  = ""
        # },
  }
}