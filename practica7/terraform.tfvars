virginia_cidr = "10.10.0.0/16"


/* subnet_public = "10.10.1.0/24"
subnet_private = "10.10.0.0/24" */

subnets = [ "10.10.0.0/24", "10.10.1.0/24" ]

tags = {
  "name" = "prueba"
  "environment" = "dev"
  cloud = "aws"
  iac = "terraform"
}

ingress_rules = "0.0.0.0/0"
egress_rules = "0.0.0.0/0"
  