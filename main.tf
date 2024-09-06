resource "aws_iam_role" "configure_bedrock_logs_role" {
  assume_role_policy = data.aws_iam_policy_document.bedrock_logs_assume_role.json
  name               = var.configure_bedrock_lambda_role

  inline_policy {
    name = "bedrock-logs-policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "bedrock:Get*",
            "bedrock:List*",
            "bedrock:PutModelInvocationLoggingConfiguration"
          ],
          Effect = "Allow"
          Resource = "*"
        },
        {
          Action = [
            "logs:*"
          ],
          Effect = "Allow"
          Resource = "arn:aws:logs:*:*:*"
        },
        {
          Action = [
            "iam:PassRole"
          ],
          Effect = "Allow"
          Resource = "arn:aws:iam::*:role/ConfigureBedrockLogsRole"
        }
      ]
    })
  }
}

# Set up Bedrock invoke logging
resource "aws_cloudwatch_log_group" "bedrock_log_group" {
  name = var.log_group_name
}

resource "aws_lambda_function" "configure_bedrock_logs" {
  function_name = var.function_name
  role          = aws_iam_role.configure_bedrock_logs_role.arn
  handler       = var.handler
  runtime       = var.runtime
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
  timeout       = var.timeout
}

resource "aws_lambda_invocation" "invoke_bedrock_logs" {
  function_name = aws_lambda_function.configure_bedrock_logs.function_name
  input = jsonencode({
    LogGroupName = aws_cloudwatch_log_group.bedrock_log_group.name
    RoleArn = aws_iam_role.configure_bedrock_logs_role.arn
  })
}
