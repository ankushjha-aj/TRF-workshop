# Elastic IP for NAT Gateway
resource "aws_eip" "eip_nat_gateway" {
  domain = "vpc"
  tags = {
    Name = "${var.org_name}-${var.app_name}-${var.env}-eip"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "aws_nat_gateway" {
  allocation_id = aws_eip.eip_nat_gateway.id
  subnet_id     = aws_subnet.aws_public_subnet["public_subnet_1"].id
  tags = {
    Name = "${var.org_name}-${var.app_name}-${var.env}-nat-gateway"
  }
}
