variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "description"
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = "true"
    }
 }

# variable "domain_name" {
#   default = "sivadevops.fun"
# }

# variable "zone_id" {
#   default = "Z09912121MS725XSKH1TG"
# }

variable "environment" {
  default = "prod"
}