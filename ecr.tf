module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = var.repository_name
  repository_read_write_access_arns = [ var.repository_iam_full ]
  repository_image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"
  repository_image_tag_mutability_exclusion_filter = ['latest']
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 3 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 3
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
