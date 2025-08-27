# Project 16: Portfolio Pipeline

## Overview

CI/CD pipeline with GitHub Actions for static website deployment. AWS S3 hosting with CloudFront CDN. Infrastructure managed with Terraform.

## Architecture

```
                  ┌─────────────┐
                  │    User     │
                  └──────┬──────┘
                         │
                         ▼
                   noahfrost.co.uk
                         │
                         ▼
                  ┌─────────────┐
                  │  Route 53   │
                  │    (DNS)    │
                  └──────┬──────┘
                         │
                         ▼
                  ┌─────────────┐
                  │ CloudFront  │
                  │    (CDN)    │
                  └──────┬──────┘
                         │
                         ▼
                  ┌─────────────┐
                  │  S3 Bucket  │
                  │   (Static)  │
                  └─────────────┘
```

## Technologies

- CI/CD: GitHub Actions
- Hosting: AWS S3 Static Website
- CDN: AWS CloudFront
- DNS: AWS Route 53
- IaC: Terraform

## Implementation

### CI/CD Pipeline

```yaml
Trigger: Push to main (index.html or resume.pdf)
    ↓
Step 1: GitHub Actions workflow starts
    ↓
Step 2: Configure AWS credentials
    ↓
Step 3: Upload files to S3
    ↓
Step 4: Invalidate CloudFront cache
    ↓
Result: Website updated
```

The pipeline triggers when portfolio files change. AWS CLI syncs changes to S3 and invalidates CloudFront cache.

### Infrastructure Management

Initially built through AWS Console. Later imported existing resources into Terraform:

```bash
cd terraform
terraform init
terraform import [resources]
terraform apply
```

This provides version-controlled infrastructure and reproducible deployments.

## Configuration

### Security
- HTTPS enforced via CloudFront
- S3 bucket not directly accessible
- IAM policies with specific permissions
- AWS credentials stored in GitHub Secrets

### Performance
- CloudFront edge locations
- Gzip compression enabled
- Cache headers configured
- HTTP/2 enabled

## Project Structure

```
portfolio-pipeline/
├── .github/
│   └── workflows/
│       └── deploy.yml         # GitHub Actions workflow
├── terraform/
│   ├── main.tf               # Infrastructure resources
│   ├── variables.tf          # Configuration variables
│   └── outputs.tf            # Output values
├── index.html                # Portfolio website
└── resume.pdf                # CV document
```

## Deployment Process

1. Edit index.html or resume.pdf locally
2. Push to GitHub main branch
3. GitHub Actions workflow executes
4. Files sync to S3 bucket
5. CloudFront cache invalidates
6. Updated content served globally

## Features

- Automated deployment on git push
- CloudFront cache invalidation
- Terraform state management
- GitHub Secrets for credentials
- Selective file deployment