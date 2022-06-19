################################################################################
# Resources
################################################################################
module "ecs" {
  source = "terraform-aws-module/ecs/aws"

  name = "test-ecs"

  container_insights = false
  capacity_providers = ["FARGATE_SPOT"]

  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE_SPOT"
    }
  ]

  tags = {
    Created = "Teeraform"
    Owner   = "DevOps"
  }
}

################################################################################
# OUTPUTS
################################################################################
output "ecs" {
  value = { for k, v in module.ecs : k => v }
}

