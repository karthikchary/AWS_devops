resource "aws" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_support  true
}