# S3 backend
This module is used to create an S3 Terraform backend for the quest project.

## Generated Documentation
<!-- BEGIN_TF_DOCS -->

# Providers

No providers.
# Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.2.2 |
| aws | = 4.18.0 |
# Modules

| Name | Source | Version |
|------|--------|---------|
| remote_state | git@github.com:nozaq/terraform-aws-remote-state-s3-backend.git | v1.2.0 |
# Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| common_tags | Key/value tags that will be applied to the resources. | `map(any)` | `null` |
| region | The AWS region in which resources are set up. | `string` | `"us-east-1"` |
| replica_region | The AWS region to which the state bucket is replicated. | `string` | `"us-west-1"` |
# Outputs

| Name | Description |
|------|-------------|
| dynamo_db_table | The DynamoDB table that is used for locking TF state |
| kms_key | The KMS customer master key to encrypt state buckets. |
| state_bucket | The S3 bucket to store the remote state file. |
# Resources

No resources.

<!-- END_TF_DOCS -->