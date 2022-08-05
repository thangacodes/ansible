resource "aws_ec2_transit_gateway_peering_attachment" "accept-mumbai-tgw" {
  peer_account_id         = aws_ec2_transit_gateway.mumbai-tgw.owner_id
  peer_region             = var.region
  peer_transit_gateway_id = aws_ec2_transit_gateway.mumbai-tgw.id
  transit_gateway_id      = aws_ec2_transit_gateway.virginia-tgw.id

  tags = {
    Name = "TGW Peering Requestor"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "request-virginia-tgw" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.mumbai-vpc.id
  provider                      = aws.prod
  tags = {
    Name = "Virginia-to-mumbai-cross-account attachment"
  }
}
