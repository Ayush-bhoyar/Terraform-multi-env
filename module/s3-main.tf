## Module: S3
# modules/s3/main.tf
resource "aws_s3_bucket" "infra-s3" {
  bucket = var.bucketname

  tags = {
    Name = "${var.Env}-s3bucket"
  }
}
