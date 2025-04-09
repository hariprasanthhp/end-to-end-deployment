variable "project" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "db_username" {}
variable "db_password" {}
variable "security_group_id" {}
variable "name" {}