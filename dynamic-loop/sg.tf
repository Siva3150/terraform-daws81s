resource "aws_security_group" "allow_ssh_terraform" {
  name        = "dynamic-loop" #allow_ssh is already there in my account"allow_tls"
  description = "Allow port no 22 for ssh access"
  
  # usually we allow everything in egress
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  # usually we allow everything in egress
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
    from_port       = ingress.value["from_port"]
    to_port         = ingress.value["to_port"]
    protocol        = ingress.value["protocol"]
    cidr_blocks     = ingress.value.cidr_blocks 
  }
}



    tags = {
        Name = "allow_sshh"
    }
}