output "privsubid" {
  value = [for s in aws_subnet.private : s.id]
}
output "privcidr" {
  value = [for t in aws_subnet.private : t.cidr_block]
}
output "privsubazs" {
  value = [for a in aws_subnet.private : a.availability_zone]
}
