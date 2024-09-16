variable "instance_names" {
    type = list(string)
    default = ["frontend", "backend", "sql"]
}

variable "common_tags" {
    type = map 
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}