## module vpc-variable.tf

variable "vpc_cidr" {
    description = "the cidr vpc block"
  type = string
}
variable "subnet_count" {
    type= number
  description = "the number of subnets"
}
variable "availbility_zones" {
  type = list(string)
}
variable "Env" {
    description = "the type of environment"
  type = string
}
