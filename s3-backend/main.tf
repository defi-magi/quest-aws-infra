module "remote_state" {
  source                  = "git@github.com:nozaq/terraform-aws-remote-state-s3-backend.git?ref=v1.2.0"
  override_s3_bucket_name = true
  s3_bucket_name          = "quest-terraform-remote-state"
  s3_bucket_name_replica  = "quest-terraform-remote-state"
  enable_replication      = false
  kms_key_description     = "The quests Terraform state KMS key"

  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
}