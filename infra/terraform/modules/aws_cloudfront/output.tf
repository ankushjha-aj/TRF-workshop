# output "s3_bucket_name" {
#   value = aws_s3_bucket.my_bucket.bucket_name
# }

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.my_distribution.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.my_distribution.domain_name
}