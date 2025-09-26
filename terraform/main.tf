resource "aws_instance" "k3s" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  associate_public_ip_address = true

  user_data = file("${path.module}/user_data.sh")

  tags = { Name = "k3s-server" }
}