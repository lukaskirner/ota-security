resource "aws_s3_bucket" "firmware" {
  bucket = "firmware-${replace(var.domain, ".", "-")}"
  acl    = "private"
  force_destroy = true

  tags = {
    Name        = "OTA-Example Firmware bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "mutal_tls" {
  bucket = "mutal-tls-store-${replace(var.domain, ".", "-")}"
  acl    = "private"
  force_destroy = true

  tags = {
    Name        = "OTA-Example Mutal TLS storage"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.mutal_tls.id
  key    = "truststore.pem"
  source = "../keys/truststore.pem"
}
