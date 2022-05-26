variable "profile" {
  type    = string
  default = "cloud_user"
}


# variable "region-default" {
#   type = string
#   default = "us-east-1"  
# }
variable "region-default_a" {
  type    = string
  default = "us-east-1"
}

variable "region-default_b" {
  type    = string
  default = "us-west-2"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}