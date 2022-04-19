output "ec2_k3s_ips" {
  value = aws_instance.k3s.*.public_ip
}

output "ec2_master_ips" {
  value = aws_instance.master.*.public_ip
}
