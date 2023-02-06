output "bucket_domain_name" {
  description = "Arn of buckets"
  value       = aws_s3_bucket.farruh_bucket_6538111.*.arn
}