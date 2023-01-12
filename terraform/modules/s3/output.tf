# output "bucket_url" {
#   description = "The url for the created bucket"
#   value       = try(aws_s3_bucket.bucket., null)
# }