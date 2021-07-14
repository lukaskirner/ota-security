# S3 role --> gets attached to gateway
resource "aws_iam_policy" "ota_s3_policy" {
  name        = "ota_s3-policy"
  description = "Policy for allowing all S3 Actions"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Action": [
            "s3:GetObject"
        ],
        "Resource": ["arn:aws:s3:::${aws_s3_bucket.firmware.id}/*"]
        }
    ]
}
EOF
}

# Gateway role
resource "aws_iam_role" "ota_api_gateyway_role" {
  name               = "ota-api-gateyway-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
} 
  EOF
}

resource "aws_iam_role_policy_attachment" "ota_s3_policy_attach" {
  role       = aws_iam_role.ota_api_gateyway_role.name
  policy_arn = aws_iam_policy.ota_s3_policy.arn
}