# provider "aws" {
#   profile = var.profile
#   region = var.region-default
#   alias = "region-cloud_user" 
# }

provider "aws" {
  profile = var.profile
  region  = var.region-default_a
  alias   = "region-a"
}

provider "aws" {
  profile = var.profile
  region  = var.region-default_b
  alias   = "region-b"

}