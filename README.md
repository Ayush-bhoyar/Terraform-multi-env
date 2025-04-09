aws-Modular-infra/
├── main.tf               # Root config to call modules
├── variables.tf          # Declares all input variables
├── outputs.tf            # Outputs from root (e.g., subnet_ids)
├── dev.tfvars            # Environment-specific variable values
├── stage.tfvars
├── prod.tfvars
├── aws-infra/
│   ├── modules/
│   │   ├── vpc/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── output.tf
│   │   ├── ec2/
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   │   └── s3/
│   │       ├── main.tf
│   │       └── variables.tf
