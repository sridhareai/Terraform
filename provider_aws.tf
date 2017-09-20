
# Specify the provider and access details will take from credentials file of your local and make sure the profile to be default
provider "aws" {
  shared_credentials_file = "./credentials"
  profile                 = "default"
  region                  = "${var.region}"
}
