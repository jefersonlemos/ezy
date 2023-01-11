variable "environment" {
  type = string
  description = "Define the environment name"
}

variable "user" {
  description = "The user who's creating the queue."
  type = string
}

variable "app_name" {
  description = "The app name"
  type        = string
}

variable "queue_name" {
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name"
  type        = string
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)"
  type        = number
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)"
  type        = number
}