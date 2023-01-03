######################
###    default VPC ###
######################

resource "aws_default_vpc" "default_vpc" {

  tags = {
    Name = "vpc_01"
  }
}