# 💻 Project 16: Portfolio DevOps Website

Automated deployment pipeline and infrastructure as code for my portfolio - built the DevOps way.

## 🎯 Overview

This project transforms a simple portfolio website into a complete DevOps showcase featuring:
- Automated CI/CD pipeline with GitHub Actions
- AWS infrastructure managed with Terraform
- Zero-downtime deployments
- Git push → Live website in under 5 minutes

## 🔄 CI/CD Pipeline

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
Result: Portfolio updated globally in 2-5 minutes
```

## 🏗️ Infrastructure

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

## 🛠️ Technologies

- **CI/CD**: GitHub Actions
- **Hosting**: AWS S3 Static Website
- **CDN**: AWS CloudFront
- **DNS**: AWS Route 53
- **IaC**: Terraform (for infrastructure management)
- **Cost**: ~$0.50/month

## 📝 The Journey: From Manual to Automated

Initially, I built the portfolio site manually through AWS Console. The pain point: manually uploading files and creating CloudFront invalidations every time I updated my CV or portfolio.

**Solution**: Built this CI/CD pipeline that automatically deploys changes when I push to GitHub.

### How the Pipeline Works

1. **Edit locally**: Update index.html or resume.pdf
2. **Push to GitHub**: `git push origin main`
3. **GitHub Actions triggers**: Workflow starts automatically
4. **Files deploy to S3**: AWS CLI syncs the changes
5. **Cache invalidates**: CloudFront serves fresh content
6. **Site updates globally**: Complete in under 5 minutes

The pipeline is configured to:
- Only run when portfolio files change (not README, etc.)
- Use secure AWS credentials from GitHub Secrets
- Provide clear success/failure feedback

### Infrastructure Management

After building everything manually, I also documented the infrastructure with Terraform:

```bash
cd terraform
terraform init
terraform import [resources]  # Brought existing infrastructure under IaC control
terraform apply              # Now Terraform manages the infrastructure
```

This provides:
- Version-controlled infrastructure
- Ability to recreate the entire setup
- Clear documentation of AWS resources

## 🔒 Security Features

- ✅ HTTPS enforced via CloudFront
- ✅ S3 bucket not directly accessible
- ✅ IAM least privilege principles
- ✅ Secrets stored in GitHub Secrets
- ✅ Infrastructure as Code for auditability

## 📊 Performance

- **Global CDN**: Content served from 400+ edge locations
- **Compression**: Enabled for all text assets
- **Caching**: Optimised TTL settings
- **HTTP/2**: Enabled by default

## 🎯 Key Achievements

- Automated deployment pipeline with cache invalidation
- Successfully imported manual AWS infrastructure into Terraform
- Zero-downtime migration from manual to automated
- Sub-minute deployment times
- Complete DevOps transformation of a simple website

## 📚 Lessons Learned

### Real-World Application

This "manual first, automate later" approach mirrors how infrastructure often evolves in companies:
- Dev teams build POCs manually
- Success leads to need for automation
- DevOps retrofits IaC and pipelines
- No downtime during transition

The ability to take existing cloud resources and bring them under Terraform management is a valuable skill for any DevSecOps engineer.

---

Built as part of my DevSecOps portfolio journey - proving that even portfolio sites deserve proper infrastructure!