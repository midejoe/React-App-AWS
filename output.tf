########################
###    print ipv4    ###
########################

output "public_ipv4_address" {
  value = aws_instance.ec2_instance.public_ip
}