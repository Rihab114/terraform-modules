# making two website buckets
module "s3-website" {
  source      = "./s3-website"
  bucket_name = "delete-later-some-unique-bucket-name"
}
module "s3-website-2" {
  source      = "./s3-website"
  bucket_name = "delete-later-some-unique-bucket-name-again"
}
# making bucket objects
# you can see how we're using the module's output variables here
resource "aws_s3_object" "index-1" {
  bucket       = module.s3-website.website_bucket_id
  key          = "index.html"
  content      = "<html><head><title>it works</title></head><body><h1>Believe it or not I'm walking on air.</h1></body></html>"
  content_type = "text/html"
}
resource "aws_s3_object" "index-2" {
  bucket       = module.s3-website-2.website_bucket_id
  key          = "index.html"
  content      = "<html><head><title>this one works too</title></head><body><h1>I never thought i could feel so free-ee-ee!</h1></body></html>"
  content_type = "text/html"
}
# output website endpoints
# outputs from the module namespace
output "delete-1-endpoint" {
  value = module.s3-website.website_endpoint
}
output "delete-2-endpoint" {
  value = module.s3-website-2.website_endpoint
}
