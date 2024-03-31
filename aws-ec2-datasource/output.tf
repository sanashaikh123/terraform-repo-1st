output "ami_id" {
  value = data.aws_ami.ubuntu.id

}
output "sg_id" {
  value = data.aws_security_groups.SecurityGroup

}
output "ec2-ip" {
  value = aws_instance.web.public_ip

}
output "kp_id" {
    value = data.aws_key_pair.kp.id
  
}