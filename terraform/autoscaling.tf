resource "aws_autoscaling_group" "blue_green" {
  name = "blue-green-asg"

  min_size         = 1
  max_size         = 2
  desired_capacity = 1

  vpc_zone_identifier = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  launch_template {
    id      = aws_launch_template.blue_green.id
    version = "$Latest"
  }

  target_group_arns = [
    aws_lb_target_group.blue.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 120

  tag {
    key                 = "Name"
    value               = "blue-green-asg-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = "aws-blue-green-deployment"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}