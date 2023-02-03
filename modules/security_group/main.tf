resource "aws_security_group" "VPC" {
  name        = "VPC"
  description = "Allow TLS inbound traffic"
  vpc_id      =  var.vpc_id
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = [ "${var.vpc_cidr}" ]
#ipv6_cidr_blocks = [aws_vpc.main.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "mh-secure"
  }
}
output "security_m" {
  value = aws_security_group.VPC.id
  
}
