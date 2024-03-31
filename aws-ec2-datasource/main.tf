#create key pair
# resource "aws_key_pair" "pub_kp" {
#   key_name   = "pub_kp"
#   public_key = file("${path.module}/id_rsa.pub")

# }
#create sg
# resource "aws_security_group" "tf_sg" {
#   name        = "tf_sg"
#   description = "sg created by terraform"
#   dynamic "ingress" {
#     for_each = [22, 80, 443]
#     iterator = port
#     content {
#       description = "allow ports"
#       from_port   = port.value
#       to_port     = port.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }

#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

# }

#create ec2 instance

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = data.aws_key_pair.kp.id
  vpc_security_group_ids = data.aws_security_groups.SecurityGroup.ids
  user_data              = file("install.sh")
  tags = {
    Name = "tf_instance"
  }

}

