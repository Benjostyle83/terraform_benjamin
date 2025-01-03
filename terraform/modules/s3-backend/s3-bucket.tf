
resource "aws_s3_bucket" "backend" {
  bucket = format("%s-%s-tf-backend", var.project, var.environment)

  # Enable versioning on the bucket
  versioning {
    enabled = true
  }

  # Lifecycle rule to manage noncurrent versions
  lifecycle_rule {
    id      = "retain-versions"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }

  tags = merge(var.common_tags, {
    Name = format("%s-%s-tf-backend", var.project, var.environment)
  })
}

# New resource for server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "backend_encryption" {
  bucket = aws_s3_bucket.backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"  # or use "aws:kms" for KMS-managed keys
    }
  }
}


