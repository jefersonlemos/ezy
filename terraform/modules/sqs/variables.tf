
variable "environment" {
  type = string
  description = "Define the environment name"
  default = "dev"
}

variable "user" {
  description = "The user who's creating the queue."
  type = string
  default = null
}

variable "queue_name" {
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name"
  type        = string
  default     = null
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)"
  type        = number
  default     = null
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)"
  type        = number
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}