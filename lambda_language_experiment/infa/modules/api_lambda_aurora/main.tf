locals {
  lambda_name = "lambda-${var.method_type}-${var.route_key}"
  # dynamo_name     = var.dynamo_name
  iam_policy_name = "policy-api-lambda-${var.route_key}"
}

# output "aws_dynamodb_table" {
#   value = aws_dynamodb_table.basic-dynamodb-table
# }

output "api_lambda" {
  value = module.api_lambda
}

module "api_lambda" {
  source         = "../common/base_api_lambda"
  api_id         = var.api_id
  api_source_arn = var.api_source_arn
  route_key      = var.route_key
  method_type    = var.method_type
  source_dir     = var.source_dir
}

##### Aurora

