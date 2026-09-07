resource "aws_s3_bucket" "remote_bucket" {
    bucket = "remote-bucket-nik"

    tags = {
    Name = "remote-bucket"
}
}

