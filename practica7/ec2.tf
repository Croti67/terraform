variable "instancias" {   
  type        = set(string)
  description = "number of instances to create"  
  default = [ "apache",  "mysql", "jumpserver" ]


}


  # resource "aws_instance" "instancia_publica" {
  # for_each = var.instancias
  # ami                     = "ami-01b14b7ad41e17ba4"
  # instance_type           = "t3.micro"
  # subnet_id = aws_subnet.subnet_virginia_public.id
  # key_name = data.aws_key_pair.deployer.key_name
  # vpc_security_group_ids = [aws_security_group.allow_tls.id ] 
  # user_data = <<-EOF
  #             #!/bin/bash
  #             echo "Hola mundo" > /home/ec2-user/holamundo.txt

  # EOF

  # tags = {
  #   Name = monitoreo2
  #   environment = "dev"
  #   cloud = "aws"
  #   iac = "terraform"

  # }
  # provisioner "local-exec" {
  #   command = "echo instancia_publica $(aws_instance.instancia_publica.public_ip) >> ip_publica.txt"

  #  }

  #  provisioner "local-exec" {
  #   when = destroy
  #   command = "echo instancia_publica $(aws_instance.instancia_publica.public_ip) destruida >> ip_publica.txt"
  #  }

  #  provisioner "remote-exec" {
  #   inline = [ 
  #     "echo 'hola mundo' > ~/holamundo.txt"
  #    ]  
    
  #   connection {
  #     type = "ssh"
  #     host = self.public_ip
  #     user = "ec2-user"
  #     private_key = file("mykey.pem")


  #    }

  # }
# }

