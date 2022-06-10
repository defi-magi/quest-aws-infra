variable "common_tags" {
  description = "Key/value tags that will be applied to the resources."
  type        = map(any)
  default     = null
}

variable "region" {
  description = "The AWS region in which resources are set up."
  type        = string
  default     = "us-east-1"
}
