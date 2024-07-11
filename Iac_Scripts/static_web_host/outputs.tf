output "website_url" {
  description = "URL of the website"
  value       = "http://${aws_s3_bucket_website_configuration.hosting_bucket_website_configuration.website_endpoint}"
}
