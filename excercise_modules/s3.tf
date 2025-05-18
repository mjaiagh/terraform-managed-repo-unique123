resource "random_id" "bucket_suffix" {
  count       = length(var.regions)
  byte_length = 6
  keepers = {
    force_regenerate = timestamp()
  }
}

module "s3_us_east_1" {
  source             = "./modules/s3"
  bucket_name_prefix = var.bucket_name_prefix
  region             = var.regions[0]
  random_suffix      = random_id.bucket_suffix[0].hex
}

module "s3_us_west_2" {
  source = "./modules/s3"
  providers = {
    aws = aws.us-west-2
  }
  bucket_name_prefix = var.bucket_name_prefix
  region             = var.regions[1]
  random_suffix      = random_id.bucket_suffix[1].hex
  lifecycle_days     = 30
}
