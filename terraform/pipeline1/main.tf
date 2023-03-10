module "sqs" {
  source = "../modules/sqs"

  user                       = "${var.user}"
  queue_name                 = "${var.app_name}-${var.queue_name}-${var.environment}"
  message_retention_seconds  = "${var.message_retention_seconds}"
  visibility_timeout_seconds = "${var.visibility_timeout_seconds}"

  tags = {
    Environment = "${var.environment}"
    Name        = "${var.queue_name}"
  }

}

module "s3" {
  source = "../modules/s3"
  
  bucket_name = "${var.app_name}-${var.bucket_name}-${var.environment}"
  tags = {
      Environment = "${var.environment}"
      Name        = "${var.bucket_name}"
    }
}
