# Create a route
resource "aws_route" "rt-peering-route" {
  route_table_id            = aws_route_table.first-pub-rt.id
  destination_cidr_block    = aws_vpc.second.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.bombay-peer.id
}
