output "instance_public_ip" {
  value = aws_instance.web.*.public_ip
}

output "vault-aws-lease-id" {
  value = data.vault_aws_access_credentials.aws_creds.lease_id
}

output "vault-aws-lease-duration" {
  value = data.vault_aws_access_credentials.aws_creds.lease_duration
}
