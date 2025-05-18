variable "bucket_name_prefix" {
  type        = string
  description = "Prefix for the S3 bucket name"
}

variable "region" {
  type        = string
  description = "AWS region for the bucket"
}

variable "random_suffix" {
  type        = string
  description = "Random suffix to ensure bucket name uniqueness"
}

variable "lifecycle_days" {
  type        = number
  default     = 90
  description = "Number of days before transitioning to Glacier"
}

variable "lifecycle_storage_class" {
  type        = string
  default     = "GLACIER"
  description = "Storage class to transition objects to"
}
