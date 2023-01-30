data "aws_ami" "linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_availability_zones" "availability_zones" {
  state = "available"
}

data "aws_ssm_parameter" "public_key" {
  name = "BjgomesPublicKey"
}