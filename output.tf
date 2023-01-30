output "ami_id" {
  value = data.aws_ami.linux2.id
}

output "ami_arn" {
  value = data.aws_ami.linux2.arn
}

output "availability_zones" {
  value = data.aws_availability_zones.availability_zones.names
}

output "ssm_parameter" {
  value = data.aws_ssm_parameter.public_key.value
  sensitive = true
}