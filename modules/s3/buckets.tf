resource "aws_s3_bucket" "farruh_bucket_6538111" {
  count         = length(var.s3_bucket_names) 
  bucket        = var.s3_bucket_names[count.index]
  force_destroy = true
}

resource "aws_s3_bucket_policy" "public_read_access" {
  count  = length(var.s3_bucket_names) 
  bucket = aws_s3_bucket.farruh_bucket_6538111[count.index].id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
	  "Principal": "*",
      "Action": [ "s3:*" ],
      "Resource": [
        "${aws_s3_bucket.farruh_bucket_6538111[count.index].arn}/*"
      ]
    }
  ]
}
EOF
}