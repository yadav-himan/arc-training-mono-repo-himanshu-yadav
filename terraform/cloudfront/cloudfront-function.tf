resource "aws_cloudfront_function" "viewer_response" {
  name    = "SecurityHeaders"
  runtime = "cloudfront-js-1.0"
  comment = "CloudFront function for viewer response"
  publish = true
  code    = file("${path.module}/cloudfrontFunction.js")
}