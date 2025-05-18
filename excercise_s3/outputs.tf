output "repository_url" {
  value       = github_repository.lab_repo.html_url
  description = "URL of the created repository"
}

output "bucket_arns" {
  value = {
    "${var.regions[0]}" = aws_s3_bucket.s3_us_east_1.arn,
    "${var.regions[1]}" = aws_s3_bucket.s3_us_west_2.arn
  }
}

output "bucket_regions" {
  value = {
    "${aws_s3_bucket.s3_us_east_1.id}" = var.regions[0]
    "${aws_s3_bucket.s3_us_west_2.id}" = var.regions[1]
  }
}
