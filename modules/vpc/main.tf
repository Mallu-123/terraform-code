    resource "aws_vpc" "mh" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "vpc-1"
  }
}

 resource "aws_subnet" "mh-pub1" {
  vpc_id     = aws_vpc.mh.id
  cidr_block = var.mh-pub_cidr[0]

  tags = {
    Name = "mh-pub1"
  }
}
resource "aws_subnet" "mh-pub2" {
  vpc_id     = aws_vpc.mh.id
  cidr_block = var.mh-pub_cidr[1]

  tags = {
    Name = "mh-pub2"
  }
}
resource "aws_subnet" "mh-prv1" {
  vpc_id     = aws_vpc.mh.id
  cidr_block = var.mh-prv_cidr[0]

  tags = {
    Name = "mh-prv2"
  }
}
resource "aws_subnet" "mh-prv2" {
  vpc_id     = aws_vpc.mh.id
  cidr_block = var.mh-prv_cidr[1]

  tags = {
    Name = "mh-prv2"
  }
}
resource "aws_internet_gateway" "mh-igw" {
  vpc_id = aws_vpc.mh.id

  tags = {
    Name = "mh-igw"
  }
}


resource "aws_eip" "mh_eip" {
  provider = aws
  vpc      = "true"

  tags = {
    Name  = "mh-eip"
    }
    }
    
    resource "aws_nat_gateway" "mh-nat" {
  allocation_id = aws_eip.mh_eip.id
  subnet_id     = aws_subnet.mh-pub2.id

  tags = {
    Name = "mh-nat"
  }
  }
  resource "aws_route_table" "mhrt1" {
  vpc_id = aws_vpc.mh.id

  route {
    cidr_block = var.mhrt1_cidr
    gateway_id = aws_internet_gateway.mh-igw.id
  }

  tags = {
    Name = "mhrt1"
  }
}
resource "aws_route_table" "mhrt2" {
  vpc_id = aws_vpc.mh.id

  route {
    cidr_block = var.mhrt2_cidr
    gateway_id = aws_nat_gateway.mh-nat.id
  }

  tags = {
    Name = "mhrt2"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.mh-pub1.id
  route_table_id = aws_route_table.mhrt1.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.mh-pub2.id
  route_table_id = aws_route_table.mhrt1.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.mh-prv1.id
  route_table_id = aws_route_table.mhrt2.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.mh-prv2.id
  route_table_id = aws_route_table.mhrt2.id
}

output "vpc_id" {
 value = aws_vpc.mh.id
}
output "pub1" {
  value =  aws_subnet.mh-pub1.id
  
}
output "prv1" {
  value = aws_subnet.mh-prv1.id
  
}