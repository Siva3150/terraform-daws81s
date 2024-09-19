resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = data.aws_ami.ami_info.id
    instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = merge(
        var.common_tags,
        {

        Name = var.instance_names[count.index]
        }
    )
       
}



resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_sshh"
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

# if prod create t3.medium, otherwise create t3.micro
resource "aws_instance" "elasticsearch" {

    ami = data.aws_ami.ami_info.id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = "terraform"
    }
}