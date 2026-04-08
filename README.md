# Azure Hub-and-Spoke Network using Terraform

## Overview
This project implements a secure hub-and-spoke Azure network architecture using Terraform.
It follows enterprise best practices for centralised security, private connectivity, and modular IaC design.

## Architecture
- Hub VNet with Azure Firewall
- App Spoke VNet
- Data Spoke VNet
- VNet Peering with controlled traffic flow
- Forced tunnelling ready design

## Key Concepts Demonstrated
- Terraform modules
- Remote state management
- Secure network segmentation
- Enterprise IP addressing
- Azure Firewall deployment
- CI/CD ready structure

## Why Hub-spoke?
- Centralised security
- Scalable network expansion
- Clear separation of concerns
- Used in most enterprise Azure environments

## How to Deploy

terraform init
terraform plan -var-file=envs/dev/terraform.tfvars
terraform apply -var-file=envs/dev/terraform.tfvars
