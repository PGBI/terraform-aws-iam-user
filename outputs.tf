output "arn" {
  description = "ARN of the user."
  value       = aws_iam_user.main.arn
}

output "unique_id" {
  description = "The unique ID assigned by AWS."
  value       = aws_iam_user.main.unique_id
}

output "name" {
  description = " The user's name."
  value       = aws_iam_user.main.name
}

output "access_key_secret" {
  description = "The the access key secret generated for the user."
  value       = aws_iam_access_key.main.secret
}

output "access_key_id" {
  description = "The access key ID generated for the user."
  value       = aws_iam_access_key.main.secret
}
