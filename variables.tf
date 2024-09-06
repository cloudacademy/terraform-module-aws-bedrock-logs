variable "configure_bedrock_lambda_role" {
  description = "The name of the IAM role for the Lambda function"
  type        = string
  default     = "ConfigureBedrockLogsRole"
}

variable "log_group_name" {
  description = "The name of the CloudWatch log group"
  type        = string
  default     = "/aws/lab-logs"
}

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "configure-bedrock-logs"
}

variable "handler" {
  description = "The entry point for the Lambda function"
  type        = string
  default     = "index.lambda_handler"
}

variable "runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "s3_bucket" {
  description = "The S3 bucket containing the Lambda function code"
  type        = string
  default     = "clouda-labs-assets"
}

variable "s3_key" {
  description = "The S3 key for the Lambda function code"
  type        = string
  default     = "pdf-chatbot/bedrock_logs.zip"
}

variable "timeout" {
  description = "The amount of time the Lambda function has to run in seconds"
  type        = number
  default     = 15
}