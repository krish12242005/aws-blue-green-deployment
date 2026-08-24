output "alb_dns_name" {
  description = "Application Load Balancer DNS"

  value = aws_lb.main.dns_name
}

output "deployment_bucket_name" {
  description = "S3 Deployment Bucket"

  value = aws_s3_bucket.deployment.bucket
}

output "codedeploy_application_name" {
  description = "CodeDeploy Application"

  value = aws_codedeploy_app.blue_green.name
}

output "codedeploy_deployment_group" {
  description = "CodeDeploy Deployment Group"

  value = aws_codedeploy_deployment_group.blue_green.deployment_group_name
}