output "instance_eip_public_ip"{
  value = aws_eip.this.*.public_ip
}

output "private_key" {
  value     = tls_private_key.this.id
  sensitive = true
}