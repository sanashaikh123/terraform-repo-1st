resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = "tf_instance"
  }

}

output "public_ip" {
    value = aws_instance.web.public_ip
  
}
output "ami_id" {
    value = aws_instance.web.ami
  
}