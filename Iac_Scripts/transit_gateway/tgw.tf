resource "aws_ec2_transit_gateway" "general" {
  description = "master-tgw"
  tags = {
    Name   = "MASTER-TGW"
    Region = var.region
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "first-vpc" {
  subnet_ids         = [aws_subnet.public.id]
  transit_gateway_id = aws_ec2_transit_gateway.general.id
  vpc_id             = aws_vpc.first.id
  tags = {
    Name   = "first-vpc-attachement"
    Region = var.region
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "second-vpc" {
  subnet_ids         = [aws_subnet.second-public-subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.general.id
  vpc_id             = aws_vpc.second.id
  tags = {
    Name   = "second-vpc-attachment"
    Region = var.region
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "third-vpc" {
  subnet_ids         = [aws_subnet.third-public-subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.general.id
  vpc_id             = aws_vpc.third.id
  tags = {
    Name   = "third-vpc-attachment"
    Region = var.region
  }
}
