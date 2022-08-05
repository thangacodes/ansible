resource "aws_ec2_transit_gateway" "mumbai-tgw" {
  description = "This is for creating TGW"
  tags = {
    Name     = "Mumbai-MASTER-TGW"
    Location = var.region
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "mumbai-vpc" {
  subnet_ids         = [aws_subnet.mumbai-private.id]
  transit_gateway_id = aws_ec2_transit_gateway.mumbai-tgw.id
  vpc_id             = aws_vpc.mumbai-vpc.id
}

resource "aws_ec2_transit_gateway_connect" "mumbai-attachment" {
  transport_attachment_id = aws_ec2_transit_gateway_vpc_attachment.mumbai-vpc.id
  transit_gateway_id      = aws_ec2_transit_gateway.mumbai-tgw.id
}

resource "aws_ec2_transit_gateway" "virginia-tgw" {
  description = "This is to create virginia TGW"
  provider    = aws.prod
  tags = {
    Name     = "VIRGINIA-MASTER-TGW"
    Location = "US-EAST-1"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "virginia-vpc" {
  subnet_ids         = [aws_subnet.virginia-private.id]
  transit_gateway_id = aws_ec2_transit_gateway.virginia-tgw.id
  vpc_id             = aws_vpc.useast-vpc.id
  provider           = aws.prod
}

resource "aws_ec2_transit_gateway_connect" "virginia-attachment" {
  transport_attachment_id = aws_ec2_transit_gateway_vpc_attachment.virginia-vpc.id
  transit_gateway_id      = aws_ec2_transit_gateway.virginia-tgw.id
  provider                = aws.prod
}
