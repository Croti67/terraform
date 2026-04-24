variable "virginia_cidr" {
  type        = string
  description = "cidr block for the virginia vpc"
  sensitive = true
  
}

/* variable "subnet_public" {
  type        = string
  description = "cidr block for the subnet"
 
  
}

variable "subnet_private" {
  type        = string
  description = "cidr block for the subnet"
  
} */

variable "subnets" {
  type        = list(string)
  description = "AWS region to deploy resources"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
}


variable "ingress_rules" {
  type        = string
  description = "cidr for ingress rules"
}

variable "egress_rules" {
  type        = string
  description = "cidr for egress rules"
}

variable "enable_monitoring" {
  default = false
  
}