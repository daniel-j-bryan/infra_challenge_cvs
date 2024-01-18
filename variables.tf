variable "root_password" {
  description = "SQL root password"
  type        = string
  default     = "bad_pswd"
  sensitive   = true
}

/* variable "sensitive_variable" {
  description = "sensitive_variable"
  type        = string
  default     = "default_sensitive_variable"
  sensitive   = true
}

variable "IN_sensitive_variable" {
  description = "IN_sensitive_variable"
  type        = string
  default     = "default_IN_sensitive_variable"
  sensitive   = false
} */