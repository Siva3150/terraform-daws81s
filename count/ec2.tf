resource "aws_instance" "terraform" {
    count = 3
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = merge(
      var.common_tags, 
      {
        Name = var.instance_names[count.index]
      }
    )
}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh" #allow_ssh is already there in my account"allow_tls"
  description = "Allow port no 22 for ssh access"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"] #allow from everyone
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


    tags = merge(
      var.common_tags,
      {
        Name = "allow_sshh"

      }
    )
        
}
