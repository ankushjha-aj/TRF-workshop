# EC2:------------------------------
resource "aws_instance" "instance" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_type
  key_name      = aws_key_pair.my_key_pair.key_name
  # subnet_id     = var.public_subnet_id["public_subnet_1"]
  tags = {
    Name = "${var.org_name}-${var.app_name}-${terraform.workspace}-ec2"
  }
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("${path.module}/test-pub.pub")
}
