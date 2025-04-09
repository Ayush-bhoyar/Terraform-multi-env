##module ec2-variable.tf

variable "ami_id" {
    type= string
  description = "the value of ami id"
}
variable "aws_instance_type" {
    type= string
  description = "the type of aws-instance"
}
variable "ec2_count" {
    type= number
  description = "the total no of ec2-instances"
}
variable "subnet_ids" {
  type= list(string)
}
variable "Env" {
    description = "the type of environment"
  type = string
}
