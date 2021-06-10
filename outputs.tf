# # Outputs

# Chef Server
output "ubuntu_sample_node" {
  value = aws_instance.ubuntu_sample_node.public_ip
}
