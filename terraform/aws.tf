#--- specify the default provider and access details
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

# --- datasource for information pertaining to the vpc we are deploying to.
data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}


# --- datasource for all "available" aws availability zones
data "aws_availability_zones" "available" {}


