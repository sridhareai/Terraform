/*  This is main application file which will create an s3 bucket and upload the python server which runs on 8000 and open static html page with "Terraform For the people" 
and creates an AWS elastic bean stalk environment which has application running on solution stack: 64bit Amazon Linux 2017.03 v2.5.1 running Python 3.4*/

// code to create bucket under s3 with the name provided in var file

resource "aws_s3_bucket" "eb_s3_bucket" {
  bucket = "${var.eb_s3_bucket}"
}

// code to upload the zip file under folder in the created bucket of s3
resource "aws_s3_bucket_object" "eb_s3_bucket_zip" {
  bucket = "${aws_s3_bucket.eb_s3_bucket.id}"
  key    = "${var.eb_s3_bucket_zip_key}"
  source = "${var.eb_s3_bucket_zip_source}"
}
resource "aws_elastic_beanstalk_application" "ebapplication_name" {
  name = "${var.ebapplication_name}"
  description = "terra-application"
}

//version label to get updated under environment with application
resource "aws_elastic_beanstalk_application_version" "eb_ver" {
  name        = "${var.ebversion}"  
  application = "${var.ebapplication_name}"
  bucket      = "${aws_s3_bucket.eb_s3_bucket.id}"
  key         = "${aws_s3_bucket_object.eb_s3_bucket_zip.id}"

}

resource "aws_elastic_beanstalk_environment" "eb_env" {
  name                  = "${var.eb_environment_name}"
  application           = "${var.ebapplication_name}"
  solution_stack_name   = "${var.solution_stack}"
  tier                  = "WebServer" 
  version_label         = "${var.ebversion}"
  
}



