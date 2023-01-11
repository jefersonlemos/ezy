output "queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.sqs.id, null)
}

output "queue_arn" {
  description = "The ARN of the SQS queue"
  value       = try(aws_sqs_queue.sqs.arn, null)
}

output "queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.sqs.url, null)
}

output "queue_name" {
  description = "The name of the SQS queue"
  value       = try(aws_sqs_queue.sqs.name, null)
}