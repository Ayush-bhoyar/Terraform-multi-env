### Module: EC2
# modules/ec2/main.tf
resource "aws_instance" "infra-instance" {
  ami                         = var.ami_id
  instance_type               = var.aws_instance_type
  count                       = var.ec2_count
  subnet_id = var.subnet_ids[count.index % length(var.subnet_ids)]
  associate_public_ip_address = true

  tags = {
    Name = "${var.Env}-instance-${count.index}"
  }
}
