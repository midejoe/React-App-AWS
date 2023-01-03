
######################
###    AZ          ###
######################

data "aws_availability_zones" "available_zones" {}



########################
###    Data source   ###
########################

/*data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}*/

########################
###    Ec2 Instance  ###
########################


resource "aws_instance" "ec2_instance" {
  #ami                    = data.aws_ami.amazon_linux_2.id
  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.micro"
  subnet_id              = aws_default_subnet.default_az1.id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  key_name               = "new"
  # user_data              =  file("tech-website.sh")

  tags = {
    Name = "web server"
  }
}





