locals {
    zone_id = "Z09912121MS725XSKH1TG"
    domain_name = "sivadevops.fun"
    instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
    # count.index will not work in locals


}