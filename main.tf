provider "aws" {
region = var.region
}
module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    az = var.az
    mh-pub_cidr = var.mh-pub_cidr
    mh-prv_cidr = var.mh-prv_cidr
    mhrt1_cidr  = var.mhrt1_cidr
    mhrt2_cidr  = var.mhrt2_cidr
}
module "security_group" {
  source = "./modules/security_group"
  vpc_cidr = var.vpc_cidr
  vpc_id = module.vpc.vpc_id
}
module "instance" {
  source = "./modules/instance"
  pub1 = module.vpc.pub1
  prv1 = module.vpc.prv1
  security_m = module.security_group.security_m
}




