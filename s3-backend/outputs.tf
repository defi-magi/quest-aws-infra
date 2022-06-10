output "kms_key" {
  description = "The KMS customer master key to encrypt state buckets."
  value       = module.remote_state.kms_key.key_id
}

output "state_bucket" {
  description = "The S3 bucket to store the remote state file."
  value       = module.remote_state.state_bucket.bucket
}

output "dynamo_db_table" {
  description = "The DynamoDB table that is used for locking TF state"
  value       = module.remote_state.dynamodb_table.name
}