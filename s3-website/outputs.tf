output "website_endpoint" {
  value = aws_s3_bucket.website_bucket.website_domain
}
output "website_bucket_id" {
  value = aws_s3_bucket.website_bucket.id
}
