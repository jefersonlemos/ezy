output "queue_arn" {
  description = "The ARN for the created Amazon SQS queue"
  value       = try(module.sqs.queue_arn, null)
}

output "bucket_arn" {
  description = "The ARN for the created Amazon S3 Bucket"
  value       = try(module.s3.bucket_arn, null)
}