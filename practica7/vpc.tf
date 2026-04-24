resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags_all = {
    Name = "vpc-virginia"
  }
}

resource "aws_subnet" "subnet_virginia_private" {
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = var.subnets[0]
  availability_zone = "us-east-1a"
 
  
}

resource "aws_subnet" "subnet_virginia_public" {
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = var.subnets[1]
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "ig_vpc_virginia"
  }
}

resource "aws_route_table" "public_rt_vpc_virginia" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id

  }


  tags = {
    Name = "public crt_vpc_virginia"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.subnet_virginia_public.id
  route_table_id = aws_route_table.public_rt_vpc_virginia.id
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.ingress_rules
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.egress_rules
  ip_protocol       = "-1" # semantically equivalent to all ports
}

module "mybucket" {
  source = "./modulos/s3"
  bucketname = "bucket-practica7-${local.sufix}"
  
}


  #  module "terraform_state_backend" {
  #    source = "cloudposse/tfstate-backend/aws"
  #    version     = "0.38.1"
  #    namespace  = "ejemplo"
  #    environment = "us-east-1"
  #    stage      = "prod"
  #    name       = "terraformvr3"
  #    attributes = ["state"]

  #    terraform_backend_config_file_path = "."
  #    terraform_backend_config_file_name = "backend.tf"
  #    force_destroy                      = false
  #  }

   