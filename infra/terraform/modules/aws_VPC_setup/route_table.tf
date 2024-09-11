# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.aws_test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_ig.id
  }

  tags = {
    Name = "${var.env}-public-rt"
  }
}

# NAT Gateway Route Table
resource "aws_route_table" "nat_gateway_rt" {
  vpc_id = aws_vpc.aws_test_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.aws_nat_gateway.id
  }

  tags = {
    Name = "${var.env}-nat-rt"
  }
}

# Route Table Associations for Public and Private Subnets
resource "aws_route_table_association" "public_subnet_assoc" {
  for_each      = var.public_subnet_conf
  subnet_id     = aws_subnet.aws_public_subnet[each.key].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_assoc" {
  for_each      = var.private_subnet_conf
  subnet_id     = aws_subnet.aws_private_subnet[each.key].id
  route_table_id = aws_route_table.nat_gateway_rt.id
}
