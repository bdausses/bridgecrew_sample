###############
# AWS variables
###############
# Region
variable "region" {
  default = "us-east-1"
}

# Key Name - The name of your key at AWS.
variable "key_name" {}

# Instance Key - The local copy of your key file.
variable "instance_key" {
  default = "~/.ssh/id_rsa"
}
