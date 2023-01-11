resource "aws_sqs_queue" "sqs" {

  message_retention_seconds         = var.message_retention_seconds
  name                              = "${var.queue_name}-${var.environment}"
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  tags                              = var.tags
}

data "aws_caller_identity" "get_accountid" {}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.sqs.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "sqs_queue",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.get_accountid.account_id}:user/${var.user}"
      },      
      "Action": "SQS:*",
      "Resource": "${aws_sqs_queue.sqs.arn}"
    }
  ]
}
POLICY
}