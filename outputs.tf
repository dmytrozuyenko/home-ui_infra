output "public_ip" {
  description = "The public IP address"
  value       = try(aws_instance.this[0].public_ip, aws_spot_instance_request.this[0].public_ip, "")
}
