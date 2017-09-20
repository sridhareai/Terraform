// Pass the variables in seperate file

// solution stack used for this assignment

variable "solution_stack" {
  default = "64bit Amazon Linux 2017.03 v2.5.1 running Python 3.4"
}
    
variable "eb_environment_name" {
  default = "dtccterrassignmentenv"
}
variable "ebversion" {
  default = "dtccversion"
}
variable "ebapplication_name" {
  default = "dtccapplication"
}

//name of the bucket which gets created in s3
variable "eb_s3_bucket" {
  default = "elasticbeanstalk-terraform-dtcc"
}

//file needs to placed in the bucket under folder
variable "eb_s3_bucket_zip_key" {
  default = "beanstalkdtcc/pyterra.zip"
}

//source of the file to upload while runtime
variable "eb_s3_bucket_zip_source" {
  default = "pyterra.zip"
}

variable "region" {
  default = "us-west-2"
}




