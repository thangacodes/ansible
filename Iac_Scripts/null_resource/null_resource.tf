resource "null_resource" "enable_region" {
  provisioner "local-exec" {
    command = "aws iam set-security-token-service-preferences --global-endpoint-token-version v2Token"
  }
}
