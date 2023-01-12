output "bucket_arn" {
  description = "The url for the created bucket"
  value       = try(aws_s3_bucket.bucket.arn, null)
}