# modules/s3/variables.tf
variable "bucketname" {
  type = string
  description = "the name of s3 bucket"
}
variable "Env" {
  description = "the type of environment"
  type= string
}
variable "aws_s3_bucket_region" {
    type = string
  description = "the aws region"
}
