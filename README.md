# Amazon Bedrock Logs Terraform Module

A Terraform module for creating an Amazon Bedrock CloudWatch Log group. The log group is created to store invocation logs from Amazon Bedrock. The module creates a Lambda function that performs the `PutModelInvocationLoggingConfiguration` API call to enable logging for Bedrock. The logs are used to indicate whether an Amazon Bedrock model has been invoked for validation check functions in labs.

See the [variables.tf](variables.tf) file for configurable options.

## Testing locally

Defaults are set for all variables in the module. To override the defaults, create a `vars.tfvars` file with the variable names and updated values found in the `variables.tf` file.

Then run the following commands:

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

Logs will appear once an enabled Amazon Bedrock model is invoked. The logs will be stored in the CloudWatch log group created by the module ('/aws/bedrock/logs'). 

To destroy the instance, run:

```bash
terraform destroy -auto-approve
```

## Usage

To use in a lab Terraform configuration, add the following code to your template:

```hcl
module aws_bedrock_logs {
    source = "github.com/cloudacademy/terraform-module-aws-bedrock-logs"
}
```