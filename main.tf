terraform {
  required_version = ">= 0.12"
}

/**
 * The IAM User.
 */
resource "aws_iam_user" "main" {
  name        = "${var.project.name_prefix}-${var.name}"
  tags        = var.project.tags
}

/**
 * Generating access keys for that User.
 */
resource "aws_iam_access_key" "main" {
  user = aws_iam_user.main.name
}

/**
 * Attaching IAM policies to the User.
 */
resource "aws_iam_user_policy" "main" {
  count = length(var.policies)

  user = aws_iam_user.main.name
  name = keys(var.policies)[count.index]
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [values(var.policies)[count.index]]
  })
}
