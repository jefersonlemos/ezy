module "sqs" {
  source = "../modules/sqs"

  user                       = "${var.user}"
  name                       = "${var.queue_name}-${var.environment}"
  message_retention_seconds  = "${var.message_retention_seconds}"
  visibility_timeout_seconds = "${var.visibility_timeout_seconds}"

  tags = {
    Environment = "${var.environment}"
    Name  = "${var.queue_name}"
  }

}

# module "s3" {
#   source = "../modules/s3"

#   vpc_name          = "${var.client_name}"
#   cidr_vpc          = "${var.cidr_vpc}"

# }
