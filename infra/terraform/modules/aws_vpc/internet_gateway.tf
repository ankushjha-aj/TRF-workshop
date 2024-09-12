resource "aws_internet_gateway" "aws_ig" {
  vpc_id = aws_vpc.aws_test_vpc.id
  tags = {
    Name = "${var.org_name}-${var.app_name}-${var.env}-ig"
  }
}
