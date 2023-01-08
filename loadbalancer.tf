# Define the load balancer 
resource "aws_elb" "elb" {
  name            = "node-elb"
  security_groups = [aws_security_group.alb_security_group.id]
  subnets         = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
  listener {
    instance_port     = 3000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:3000/"
    interval            = 30
  }

  instances                   = [aws_instance.ec2_instance.id, aws_instance.ec2_instance2.id]
  tags = {
    key                 = "Name"
    value               = "my-elb"
    propagate_at_launch = true
  }
}