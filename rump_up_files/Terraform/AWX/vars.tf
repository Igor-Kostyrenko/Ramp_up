variable "region" {
  description = "Region to deploy"
  default = "us-central1"
}

variable "zone" {
  description = "Zone to deploy"
  default = "us-central1-a"
}

variable "project" {
  description = "Project Id"
  default = "triple-skein-425205-v5"

}

variable "storage_class" {
  description = "Storage class name"
  default     = "premium-rwo"
}

variable "awx_admin_username" {
  description = "AWX admin username"
  default     = "admin"
}

variable "env" {
  description = "The Working environment"
  type        = string
  default = "dev"
}

variable "app" {
  description = "The application name"
  type        = string
  default = "awx"
}
