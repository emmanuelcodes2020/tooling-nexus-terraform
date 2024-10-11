# nexus-terraform

**Description:**
Provisioning an AWS EC2 to run Nexus artifactory.

**Prerequisites:**
- Terraform version: ~>1.3.3
- AWS Provider: ~>4.0.0

**Installation:**
1. Install Terraform
2. Install AWS Provider: `terraform init`

**Usage:**
1. Create a new directory for your project or 
1a. Create a repositiory
1b. Git clone "url"
1c. cd directory name
2. Copy the configuration files into the directory.
3. Run `terraform init` to initialize the project.
4. Run `terraform apply` to create the resources.

**Variables:**
- `region`: AWS region (required)
- `instance_type`: EC2 instance type (default: t3.medium)

**Outputs:**
- `public_ip`: Public IP address of the created EC2 instance

