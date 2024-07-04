# Resource for creating Internet Gateway
resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.org_name}-${var.app_name}-${var.env}-ig"
  }
}