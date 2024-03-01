output "name" {
    value = "Hi, I am ${var.name} and my age is ${var.age}"
}
output "ec2" {
    value = "EC2 available AMI is ${var.ami} in ${var.region} region"
  
}