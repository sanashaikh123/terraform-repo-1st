data "aws_security_groups" "SecurityGroup" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]

  }
  
    # tags = {
    #   owner = "sana"
    # }
  
}
data "aws_ami" "ubuntu"{
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240301"]
    }
    filter {
      name = "root-device-type"
      values = ["ebs"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
}

data "aws_key_pair" "kp"{
    filter {
      name = "tag:owner"
      values = ["sana"]
    }
}