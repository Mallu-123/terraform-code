resource "aws_instance" "instance-1" {
  ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
    subnet_id = var.pub1
    security_groups = ["${var.security_m}"]
    
    tags = {
        Name = "instance-1"
    }
}
resource "aws_instance" "instance-2" {
    ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
    subnet_id = var.prv1
    security_groups = ["${var.security_m}"]
    tags = {
        Name = "instance-2"
    }
}

