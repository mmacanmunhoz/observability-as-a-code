### ANOTHER VARIABLES

variable "policy_channel" {
  type        = string
  description = "channel new relic to send alerts"
}

variable "apm_entity" {
  type        = string
  description = "new relic account id"
}

### FEATURE FLAGS

variable "error_alerts_enable" {
  type    = bool
  default = true
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.error_alerts_enable))
    error_message     = "O valor tem que estar entre true or false"
  }
}

variable "response_alerts_enable" {
  type    = bool
  default = true
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.response_alerts_enable))
    error_message     = "O valor tem que estar entre true or false"
  }
}

variable "throughput_alerts_enable" {
  type    = bool
  default = true
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.throughput_alerts_enable))
    error_message     = "O valor tem que estar entre true or false"
  }
}

variable "apdex_alerts_enable" {
  type    = bool
  default = true
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.apdex_alerts_enable))
    error_message     = "O valor tem que estar entre true or false"
  }
}

### DURATION

variable "duration_apdex" {
  type        = number
  description = "duration time alert"
  validation {
    condition = var.duration_apdex >= 5 && var.duration_apdex <= 120
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

variable "duration_response_time" {
  type        = number
  description = "duration time alert"
  validation {
    condition = var.duration_response_time >= 5 && var.duration_response_time <= 120
    error_message     = "O valor tem que estar entre 5 e 120"
  }

}

variable "duration_error_rate" {
  type        = number
  description = "duration time alert"
  validation {
    condition = var.duration_error_rate >= 5 && var.duration_error_rate <= 120
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

variable "duration_throughput" {
  type        = number
  description = "duration time alert"
  validation {
    condition = var.duration_throughput >= 5 && var.duration_throughput <= 120
    error_message     = "O valor tem que estar entre 5 e 120"
  }
}

### OPERATOR

variable "operator_response_time" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_response_time))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

variable "operator_throughput" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_throughput))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

variable "operator_apdex" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_apdex))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

variable "operator_error_rate" {
  type        = string
  description = "condictional to monitoring"
  validation {
    condition = can(regex("^([a][b][o][v][e]|[b][e][l][o][w]|[e][q][u][a][l])$", var.operator_error_rate))
    error_message     = "O valor tem que estar como above(acima), below(abaixo) or equal(igual)"
  }
}

### PRIORITY

variable "priority_response_time" {
  type        = string
  description = "priority to monitoring"
  validation {
    condition = can(regex("^([c][r][i][t][i][c][a][l]|[w][a][r][n][i][n][g])$", var.priority_response_time))
    error_message     = "O valor tem que estar critical or warning"
  }
}

variable "priority_error_rate" {
  type        = string
  description = "priority to monitoring"
  validation {
    condition = can(regex("^([c][r][i][t][i][c][a][l]|[w][a][r][n][i][n][g])$", var.priority_error_rate))
    error_message     = "O valor tem que estar critical or warning"
  }
}

variable "priority_throughput" {
  type        = string
  description = "priority to monitoring"
  validation {
    condition = can(regex("^([c][r][i][t][i][c][a][l]|[w][a][r][n][i][n][g])$", var.priority_throughput))
    error_message     = "O valor tem que estar critical or warning"
  }
}

variable "priority_apdex" {
  type        = string
  description = "priority to monitoring"
  validation {
    condition = can(regex("^([c][r][i][t][i][c][a][l]|[w][a][r][n][i][n][g])$", var.priority_apdex))
    error_message     = "O valor tem que estar critical or warning"
  }
}

### THRESHOLD

variable "threshold_response_time" {
  type        = string
  description = "metric in number to monitoring"
  default     = "10"
  validation {
    condition = var.threshold_response_time <= 10
    error_message     = "Não é saudável um valor maior que 10 ms em response time, valor revalidar"
  }
}

variable "threshold_error_rate" {
  type        = string
  description = "metric in number to monitoring"
  default     = "2"
  validation {
    condition = var.threshold_error_rate <= 10
    error_message     = "Não é saudável um valor maior que 10% em error rate, valor revalidar"
  }
}

variable "threshold_throughput" {
  type        = string
  description = "metric in number to monitoring"
  default     = "1000"
    validation {
    condition = var.threshold_throughput <= 1000
    error_message     = "Não é saudável um valor menor que 1000 em throughput, valor revalidar"
  }
}

variable "threshold_apdex" {
  type        = string
  description = "metric in number to monitoring"
  default     = "1"
  validation {
    condition = var.threshold_apdex >= 0 && var.threshold_apdex <= 1
    error_message     = "Favor informar um valor entre 0 e 1"
  }
}

### TIME FUNCTION

variable "time_function_response_time" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_response_time))
    error_message     = "O valor tem que estar entre all ou any"
  }
}

variable "time_function_error_rate" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_error_rate))
    error_message     = "O valor tem que estar entre all ou any"
  }
}

variable "time_function_throughput" {
  type        = string
  description = "scope time to monitoring"
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_throughput))
    error_message     = "O valor tem que estar entre all ou any"
  }
}

variable "time_function_apdex" {
  type        = string
  description = "scope time to monitoring"
  default     = true
  validation {
    condition = can(regex("^([a][l][l]|[a][n][y])$", var.time_function_apdex))
    error_message     = "O valor tem que estar entre all ou any"
  }
}






