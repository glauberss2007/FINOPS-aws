provider "aws" {
  region = "us-west-2" # Replace with your desired region
}

# Creating an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "unique-bucket-name" # Replace with your unique bucket name
  acl    = "private" # Configure desired permissions (private, public-read, etc.)
}

# Configuring the Cost and Usage Report
resource "aws_cur_report_definition" "example_report" {
  report_name           = "example-cost-usage-report" # Your report name
  time_unit             = "HOURLY" # Report time unit (HOURLY, DAILY, MONTHLY)
  format                = "PARQUET" # Report format (PARQUET, ORC, CSV)
  compression           = "GZIP" # Compression type (GZIP, ZIP)
  additional_schema_elements = ["RESOURCES"]
  s3_bucket             = aws_s3_bucket.example_bucket.id # Your S3 bucket ID
  s3_prefix             = "reports/" # Prefix for report files
}
