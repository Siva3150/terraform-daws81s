resource "aws_instance" "terraform" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = "terraform"
    }
}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = var.sg_name #allow_ssh is already there in my account"allow_tls"
  description = var.sg_description

  ingress {
    from_port       = var.from_port
    to_port         = var.to_port
    protocol        = var.protocol
    cidr_blocks     = var.cidr_blocks #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  # usually we allow everything in egress
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }


    tags = var.tags
}