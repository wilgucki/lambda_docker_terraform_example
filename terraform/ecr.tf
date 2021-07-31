resource "aws_ecr_repository" "lambda_docker" {
  name                 = "lambda_docker"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
