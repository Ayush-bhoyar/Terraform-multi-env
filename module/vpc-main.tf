### Module: VPC
# modules/vpc/main.tf
resource "aws_vpc" "Main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "Subnets" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.Main.id
  availability_zone = var.availbility_zones[count.index % length(var.availbility_zones)]
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.Env}-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Main.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.Main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}

resource "aws_security_group" "Infra-SG" {
  vpc_id = aws_vpc.Main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route_table_association" "RTA" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.Subnets[count.index].id
  route_table_id = aws_route_table.RT.id
}
