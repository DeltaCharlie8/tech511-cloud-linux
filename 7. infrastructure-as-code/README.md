# Infrastructure as Code (IaC)

- [Infrastructure as Code (IaC)](#infrastructure-as-code-iac)
  - [Terraform](#terraform)
    - [Installing Terraform (Windows)](#installing-terraform-windows)
  - [Ansible](#ansible)

## Terraform

### Installing Terraform (Windows)
1. open your PowerShell as administrator
2. run this command to see if Chocolatey is installed
```
choco -v
```
3. once installed, run this command to install Terraform
```
choco install terraform -y
```
4. verify the installation by checking the version
```
terraform -version
```
5. you should see something like:
```
Terraform v1.13.3
```
6. run the command again in your gitbash to confirm that terraform can be used anywhere on your pc

**Please note: if using VS Code, add the terraform extension (official one by Hashicorp)**

## Ansible