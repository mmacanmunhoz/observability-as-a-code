### ANOTHER VARIABLES

variable "policy_channel" {
  type        = string
  description = "Channel new relic to send alerts"
}

variable "rds_name" {
  type        = string
  description = "Name of rds cluster"
}

variable "rds_name_instance" {
  type        = string
  description = "Name of rds instance"
  default     = ""
}

### FEATURE FLAGS

variable "memory_alerts_enable" {
  type        = bool
  default     = true
  description = "Enable alerts for rds memory"
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.memory_alerts_enable))
    error_message     = "O valor tem que estar entre true or false"
  }
}

variable "storage_alerts_enable" {
  type        = bool
  default     = true
  description = "Enable alerts for rds memory"
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.storage_alerts_enable))
    error_message     = "O valor tem que estar entre true or false"
  }
}

variable "network_alerts_enable" {
  type        = bool
  default     = true
  description = "Enable alerts for rds network"
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.network_alerts_enable))
    error_message     = "O valor tem que estar entre true or false"
  }
}

variable "cpu_alerts_enable" {
  type        = bool
  default     = true
  description = "Enable alerts for cpu"
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.cpu_alerts_enable))
    error_message     = "O valor tem que estar entre true or false"
  }
}

variable "enable_for_cluster" {
  type        = bool
  default     = true
  description = "Enable alerts for this cluster"
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.enable_for_cluster))
    error_message     = "O valor tem que estar entre true or false"
  }
}

variable "enable_for_instance" {
  type        = bool
  default     = true
  description = "Enable alerts for this cluster"
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.enable_for_instance))
    error_message     = "O valor tem que estar entre true or false"
  }
}

### DURATION

variable "cpu_average_duration" {
  type = number
  validation {
    condition = var.cpu_average_duration >= 5 && var.cpu_average_duration <= 300
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

variable "cpu_saturation_duration" {
  type = number
  validation {
    condition = var.cpu_saturation_duration >= 5 && var.cpu_saturation_duration <= 300
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

variable "memory_saturation_duration" {
  type = number
  validation {
    condition = var.memory_saturation_duration >= 5 && var.memory_saturation_duration <= 300
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

variable "memory_average_duration" {
  type = number
  validation {
    condition = var.memory_average_duration >= 5 && var.memory_average_duration <= 300
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

variable "network_average_duration" {
  type = number
  validation {
    condition = var.network_average_duration >= 5 && var.network_average_duration <= 300
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

variable "storage_average_duration" {
  type = number
  validation {
    condition = var.storage_average_duration >= 5 && var.storage_average_duration <= 300
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

### THRESHOLD

variable "threshold_storage_average" {
  type = number
}

variable "threshold_network_average" {
  type = number
}

variable "threshold_cpu_average" {
  type = number
}

variable "threshold_cpu_saturation" {
  type = number
}

variable "threshold_memory_average" {
  type = number
}

variable "threshold_memory_saturation" {
  type = number
}

### TIME FUNCTION

variable "time_function_storage_average" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_storage_average))
    error_message     = "O valor tem que estar entre all ou any"
  }
}

variable "time_function_network_average" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_network_average))
    error_message     = "O valor tem que estar entre all ou any"
  }
}

variable "time_function_cpu_average" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_cpu_average))
    error_message     = "O valor tem que estar entre all ou any"
  }
}

variable "time_function_cpu_saturation" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_cpu_saturation))
    error_message     = "O"
  }
}

variable "time_function_memory_average" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_memory_average))
    error_message     = "O valor tem que estar entre all ou any"
  }
}

variable "time_function_memory_saturation" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_memory_saturation))
    error_message     = "O valor tem que estar entre all ou any"
  }
}

### OPERATOR

variable "operator_storage_average" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_storage_average))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

variable "operator_network_average" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_network_average))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

variable "operator_cpu_average" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_cpu_average))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

variable "operator_cpu_saturation" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_cpu_saturation))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

variable "operator_memory_average" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_memory_average))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

variable "operator_memory_saturation" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_memory_saturation))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}