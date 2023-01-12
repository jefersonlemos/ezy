variable "bucket_name" {
  description = "This is the human-readable name of the bucket. If omitted, Terraform will assign a random name"
  type        = string
}
variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
}