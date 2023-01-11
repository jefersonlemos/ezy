output "queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = try(module.sqs.queue_url, null)
}