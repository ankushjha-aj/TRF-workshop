variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "index_file_path" {
  description = "Path to the index.html file"
  type        = string
}

variable "cloudfront_domain_name" {
type = string
}