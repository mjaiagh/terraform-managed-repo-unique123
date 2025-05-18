resource "random_id" "bucket_suffix" {
  count       = length(var.regions)
  byte_length = 4
  #remove if not needed to create every time
  keepers = {
    timestamp = timestamp()  
  }
}

resource "aws_s3_bucket" "s3_us_east_1" {
  provider = aws.us-east-1
  bucket   = "${var.bucket_name_prefix}-${var.regions[0]}-${random_id.bucket_suffix[0].hex}"
  force_destroy = true
  tags = {
    Name = "bucket-us-east-1"
  }
}

resource "aws_s3_bucket_versioning" "aws_s3_bucket_versioning_1" {
  provider = aws.us-east-1
  bucket   = aws_s3_bucket.s3_us_east_1.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_us_east_1" {
  bucket   = aws_s3_bucket.s3_us_east_1.id
  provider = aws.us-east-1
  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}


resource "aws_s3_bucket" "s3_us_west_2" {
  provider      = aws.us-west-2
  bucket        = "${var.bucket_name_prefix}-${var.regions[1]}-${random_id.bucket_suffix[1].hex}"
  force_destroy = true

  tags = {
    Name = "bucket-us-west-2"
  }

}

resource "aws_s3_bucket_lifecycle_configuration" "aws_s3_bucket_lifecycle_configuration_2" {
  provider   = aws.us-west-2
  bucket     = aws_s3_bucket.s3_us_west_2.id
  depends_on = [aws_s3_bucket.s3_us_west_2]

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}


resource "aws_s3_bucket_versioning" "aws_s3_bucket_versioning_2" {
  provider   = aws.us-west-2
  bucket     = aws_s3_bucket.s3_us_west_2.id
  depends_on = [aws_s3_bucket.s3_us_west_2]

  versioning_configuration {
    status = "Enabled"
  }
}

