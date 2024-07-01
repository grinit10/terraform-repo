variable "client_secret" {
  type = string
  sensitive = true
}

variable "client_id" {
  type = string
  sensitive = false
}

variable "tenant_id" {
  type = string
  sensitive = false
}

variable "subscription_id" {
  type = string
  sensitive = false
}

variable "environment" {
  type = string
  sensitive = false
}
