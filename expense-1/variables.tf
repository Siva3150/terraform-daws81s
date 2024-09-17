variable "instance_names" {
    type = list(string)
    default = ["frontend", "backend", "mysql"]
 }

 variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = "true"
    }
 }

 variable "zone_id" {
    default = "Z06930922N9BU7VR1YEID"
}

variable "domain_name" {
    default = "sivadevops.fun"
}