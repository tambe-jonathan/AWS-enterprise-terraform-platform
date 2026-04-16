output "s3_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  description = "DynamoDB table used for state locking"
  value       = aws_dynamodb_table.terraform_locks.name
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.terraform_state.arn
}
