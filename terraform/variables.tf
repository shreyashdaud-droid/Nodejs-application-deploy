variable "aws_region" {
  default = "ap-south-1" # Mumbai region
}
variable "ec2_instance_id" {
  description = "The ID of your existing self-hosted EC2 instance"
  type        = string
}
