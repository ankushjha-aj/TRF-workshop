output "vpc_id" {
  value = aws_vpc.aws_test_vpc.id
}

# output "public_subnet_ids" {
#   value = aws_subnet.aws_public_subnet[*].id
# }

# output "private_subnet_ids" {
#   value = aws_subnet.aws_private_subnet[*].id
# }

output "public_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.aws_public_subnet : key => subnet.id
  }
}

output "private_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.aws_private_subnet : key => subnet.id
  }
}

output "internet_gateway_id" {
  value = aws_internet_gateway.aws_ig.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.aws_nat_gateway.id
}

#  The ID of the allocated Elastic IP address.
output "eip_allocation_id" {
  value = aws_eip.eip_nat_gateway.allocation_id
}
