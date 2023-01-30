resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.availability_zones.names[1]
  cidr_block = var.subnet1_cidr_block
  map_public_ip_on_launch = true
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "name" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# comment
resource "aws_instance" "main" {
  ami           = data.aws_ami.linux2.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id
}

