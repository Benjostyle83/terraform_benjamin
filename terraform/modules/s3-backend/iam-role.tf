resource "aws_iam_role" "benjamin_s3_backend" {
  name = format("%s-%s-%s-s3-backend-role", var.common_tags["Environment"], var.common_tags["Project"], var.common_tags["Owner"])

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Principal = { Service = "s3.amazonaws.com" },
        Effect    = "Allow",
        Sid       = ""
      }
    ]
  })

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-s3-backend-role", var.common_tags["Environment"], var.common_tags["Project"], var.common_tags["Owner"])
  })
}








