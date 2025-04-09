resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = element(var.public_subnet_ids, 0)
  key_name      = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.project}-bastion"
  }
}
