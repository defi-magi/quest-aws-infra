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


variable "replica_region" {
  description = "The AWS region to which the state bucket is replicated."
  type        = string
  default     = "us-west-1"
}