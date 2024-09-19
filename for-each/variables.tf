variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        frontend = "t2.micro"
        backend = "t2.micro"
    }
}

variable "zone_id" {
    default = "Z06930922N9BU7VR1YEID"
}

variable "domain_name" {
    default = "sivadevops.fun"
}