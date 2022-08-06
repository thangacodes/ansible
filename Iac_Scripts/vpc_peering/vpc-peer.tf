data "aws_caller_identity" "this" {
  provider = aws.dev
}

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "bombay-peer" {
  vpc_id        = aws_vpc.first.id
  peer_vpc_id   = aws_vpc.second.id
  peer_owner_id = data.aws_caller_identity.this.account_id
  peer_region   = "us-east-1"
  auto_accept   = false

  tags = {
    Side = "bombay-Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "virginia-peer" {
  provider                  = aws.dev
  vpc_peering_connection_id = aws_vpc_peering_connection.bombay-peer.id
  auto_accept               = true
  #Name                      = "Virginia-vpc-peer"

  tags = {
    Side = "Virginia-Accepter"
  }
}
