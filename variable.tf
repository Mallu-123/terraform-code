variable "region" {
    default = "us-east-1"
}
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "az" {
    default = ["us-east-1a", "us-east-1b"]  
}
variable "mh-pub_cidr" {
    default = [ "10.0.0.0/18","10.0.64.0/18" ]
}
variable "mh-prv_cidr"{
default = [ "10.0.128.0/18", "10.0.192.0/18" ]
}
variable "mhrt1_cidr" {
    default = "0.0.0.0/0"
}
variable "mhrt2_cidr" {
    default = "0.0.0.0/0"
}
variable "ingress_cidr" {
    default =  ["10.0.0.0/16"]
}