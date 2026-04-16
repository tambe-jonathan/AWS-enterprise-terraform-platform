variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}
variable "bucket_name" {
  type = string
}
variable "table_name" {
  description = "DynamoDB table name for state locking"
  type        = string
}
