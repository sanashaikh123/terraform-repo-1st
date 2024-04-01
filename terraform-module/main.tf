resource "aws_key_pair" "pub_kp" {
  key_name   = "pub_kp"
  public_key = file("${path.module}/id_rsa.pub")

}
resource "aws_security_group" "tf_sg" {
  name        = "tf_sg"
  description = "sg created by terraform"
  dynamic "ingress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      description = "allow ports"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
module "webserver" {
  source = "./module/webserver"
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.pub_kp.key_name
  sg_id  = aws_security_group.tf_sg.id
  
}
output "ami_id" {
  value = module.webserver.ami_id

}
output "sg_id" {
  value = aws_security_group.tf_sg.id

}
output "ec2-ip" {
  value = module.webserver.public_ip

}