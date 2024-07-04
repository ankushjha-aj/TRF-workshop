# # =============================================================================

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "my-bucket-dev-1" # Change this to a unique bucket name

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_policy" "my_bucket_policy" {
#   bucket = aws_s3_bucket.my_bucket.id

#   policy = jsonencode({

#     "Version" : "2008-10-17",
#     "Id" : "PolicyForCloudFrontPrivateContent",
#     "Statement" : [
#       {
#         "Sid" : "AllowCloudFrontServicePrincipal",
#         "Effect" : "Allow",
#         "Principal" : {
#           "Service" : "cloudfront.amazonaws.com"
#         },
#         "Action" : "s3:GetObject",
#         "Resource" : "arn:aws:s3:::my-bucket-dev-1/*",
#         "Condition" : {
#           "StringEquals" : {
#             "AWS:SourceArn" : "arn:aws:cloudfront::767397793170:distribution/E1BCWALAENPFN8"
#           }
#         }
#       }
#     ]
#   })
# }

# resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
#   comment = "Origin access adentity for S3 bucket"
# }

# resource "aws_cloudfront_distribution" "my_distribution" {
#   origin {
#     domain_name = aws_s3_bucket.my_bucket.bucket_regional_domain_name
#     origin_id   = "myS3Origin"

#     s3_origin_config {
#       origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
#     }
#   }

#   enabled             = true
#   is_ipv6_enabled     = true
#   comment             = "My CloudFront Distribution"
#   default_root_object = "index.html"

#   default_cache_behavior {
#     allowed_methods  = ["GET", "HEAD"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "myS3Origin"

#     forwarded_values {
#       query_string = false
#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "redirect-to-https"
#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#   }

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#   viewer_certificate {
#     cloudfront_default_certificate = true
#   }

#   tags = {
#     Name = "My distribution"
#   }
# }

# output "s3_bucket_name" {
#   value = aws_s3_bucket.my_bucket.bucket
# }

# output "cloudfront_distribution_id" {
#   value = aws_cloudfront_distribution.my_distribution.id
# }

# output "cloudfront_domain_name" {
#   value = aws_cloudfront_distribution.my_distribution.domain_name
# }
