output "db_endopoit" {
  value = aws_db_instance.myrds.endpoint
}

output "db_zonid" {
  value = aws_db_instance.myrds.hosted_zone_id
}

output "db_assigned" {
  value = aws_db_instance.myrds.allocated_storage
}

output "db_availzone" {
  value = aws_db_instance.myrds.availability_zone
}
output "db_secugp" {
  value = aws_db_instance.myrds.vpc_security_group_ids
}
