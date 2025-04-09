variable "project" {}
variable "ami_id" {}
variable "key_name" {}
variable "public_subnet_ids" {
  type = list(string)
}
