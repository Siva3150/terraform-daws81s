variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f" 
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "tags" {
    type = map #optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "Dev"
        Terraform = "true"
    }
}

variable "sg_name" {
    type = string
    default = "allow_sshh"
}

variable "sg_description" {
    type = string
    default = "Allow port no 22 for ssh access"
}

variable "from_port" {
    type = number
    default = "22"
}

variable "to_port" {
    type = number
    default = "22"
}

variable "protocol" {
    default = "tcp"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}


