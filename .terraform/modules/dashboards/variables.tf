variable "account_id" {
  type = number
}

variable "name_dashboard" {
  type = string
}

variable "permission" {
  type    = string
  default = "public_read_only"
   validation {
    condition = can(regex("^([p][u][b][l]|[i][c][_][r][e][a][d][_][o][n][l][y]|[p][r][i][v][a][t][e]|[p][u][b][l][i][c][_][r][e][a][d][_][w][r][i][t][e])$", var.permission))
    error_message     = "O valor pode ser public_read_only, private, public_read_write"
  }
}

variable "app_name" {
  type = string
}

variable "another_query" {}


