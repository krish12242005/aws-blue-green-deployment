resource "aws_codedeploy_app" "blue_green" {
  name             = "blue-green-deployment"
  compute_platform = "Server"

  tags = {
    Name = "blue-green-deployment"
  }
}

resource "aws_codedeploy_deployment_group" "blue_green" {
  app_name               = aws_codedeploy_app.blue_green.name
  deployment_group_name  = "blue-green-deployment-group"
  service_role_arn       = aws_iam_role.codedeploy.arn
  deployment_config_name = "CodeDeployDefault.AllAtOnce"

  autoscaling_groups = [
    aws_autoscaling_group.blue_green.name
  ]

  deployment_style {
    deployment_type   = "BLUE_GREEN"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  load_balancer_info {
    target_group_info {
      name = aws_lb_target_group.blue.name
    }
  }

  blue_green_deployment_config {

    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    green_fleet_provisioning_option {
      action = "COPY_AUTO_SCALING_GROUP"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "KEEP_ALIVE"
      termination_wait_time_in_minutes = 30
    }
  }

  auto_rollback_configuration {
    enabled = true

    events = [
      "DEPLOYMENT_FAILURE",
      "DEPLOYMENT_STOP_ON_ALARM"
    ]
  }

  depends_on = [
    aws_lb_listener.http
  ]
}