data "aws_iam_policy_document" "bedrock_logs_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = [
        "logs.amazonaws.com",
        "bedrock.amazonaws.com",
        "lambda.amazonaws.com"
      ]
      type        = "Service"
    }
  }
}
