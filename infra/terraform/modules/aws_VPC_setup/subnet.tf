# Public Subnets
resource "aws_subnet" "aws_public_subnet" {
  for_each                = var.public_subnet_conf
  vpc_id                  = aws_vpc.aws_test_vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-${each.key}"
  }
}

# Private Subnets
resource "aws_subnet" "aws_private_subnet" {
  for_each                = var.private_subnet_conf
  vpc_id                  = aws_vpc.aws_test_vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  tags = {
    Name = "${var.env}-${each.key}"
  }
}
