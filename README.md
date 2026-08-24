# 🔵🟢 AWS Blue-Green Deployment

![AWS](https://img.shields.io/badge/AWS-Cloud-blue?logo=amazon-aws)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple?logo=terraform)
![CodeDeploy](https://img.shields.io/badge/AWS-CodeDeploy-orange?logo=amazon-aws)
![EC2](https://img.shields.io/badge/AWS-EC2-orange?logo=amazon-ec2)
![ALB](https://img.shields.io/badge/AWS-ALB-blue?logo=amazon-aws)
![GitHub](https://img.shields.io/badge/GitHub-Version%20Control-black?logo=github)

## 🚀 Project Overview

This project demonstrates a production-style **Blue-Green Deployment architecture on AWS** using Terraform, Amazon EC2, Application Load Balancer, Auto Scaling, AWS CodeDeploy, Amazon S3, IAM and Python Flask.

The main objective is to demonstrate how application teams can deploy a new version of an application with **minimal downtime and reduced deployment risk**.

---

## 🔵🟢 What is Blue-Green Deployment?

Blue-Green Deployment is a release strategy where two environments are maintained:

### 🔵 Blue Environment

The Blue environment represents the currently running production version.

```text


## 🚀 Project Overview

This project demonstrates a production-style Blue-Green Deployment architecture on AWS using Terraform, Amazon EC2, Application Load Balancer, Auto Scaling, AWS CodeDeploy, Amazon S3, IAM, Python Flask, Git and GitHub.

The objective of this project is to understand how modern DevOps teams can deploy new application versions with minimal downtime, controlled traffic switching, safer releases and rollback capabilities.

Terraform is used as the Infrastructure as Code tool to define the cloud infrastructure, while AWS CodeDeploy is used to demonstrate the Blue-Green application deployment strategy.

## 🔵🟢 Blue-Green Deployment



## 🏗️ Architecture

```text
                         Developer
                             |
                             v
                          GitHub
                             |
                             v
                    Terraform / CodeDeploy
                             |
                             v
                        Amazon S3
                             |
                             v
                      AWS CodeDeploy
                             |
                             v
                Application Load Balancer
                             |
                   +---------+---------+
                   |                   |
                   v                   v
             🔵 BLUE ENV          🟢 GREEN ENV
              Version 1.0          Version 2.0
                   |                   |
                   +---------+---------+
                             |
                             v
                        Production
````

## 🔄 Deployment Workflow

```text
Developer
    |
    v
GitHub
    |
    v
Application Build
    |
    v
Deployment Package
    |
    v
Amazon S3
    |
    v
AWS CodeDeploy
    |
    v
Green Environment
    |
    v
Health Check
    |
    v
Deployment Validation
    |
    v
ALB Traffic Switch
    |
    v
Production
```

## ☁️ AWS Services Used

| Service                   | Purpose                             |
| ------------------------- | ----------------------------------- |
| Amazon VPC                | Network infrastructure              |
| Amazon EC2                | Application compute                 |
| Application Load Balancer | Traffic distribution                |
| Auto Scaling              | Instance management and scalability |
| AWS CodeDeploy            | Blue-Green application deployment   |
| Amazon S3                 | Deployment artifact storage         |
| AWS IAM                   | Roles and permissions               |
| Security Groups           | Network access control              |
| Terraform                 | Infrastructure as Code              |
| GitHub                    | Source code management              |

## 🛠️ Technologies Used

* AWS
* Terraform
* AWS CodeDeploy
* Amazon EC2
* Application Load Balancer
* Auto Scaling
* Amazon S3
* IAM
* VPC
* Security Groups
* Python
* Flask
* Linux
* Git
* GitHub
* Docker

## 💻 Application

The sample application is developed using Python Flask.

Application Port:

```text
5000
```

Example Blue response:

```text
AWS Blue-Green Deployment
Version 1.0 - BLUE
Application is running successfully.
```

Example Green response:

```text
AWS Blue-Green Deployment
Version 2.0 - GREEN
Application is running successfully.
```

## 📁 Project Structure

```text
aws-blue-green-deployment/
│
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── terraform/
│   ├── provider.tf
│   ├── vpc.tf
│   ├── security-groups.tf
│   ├── iam.tf
│   ├── ami.tf
│   ├── launch-template.tf
│   ├── autoscaling.tf
│   ├── alb.tf
│   ├── s3.tf
│   ├── codedeploy.tf
│   └── outputs.tf
│
├── scripts/
│   ├── install.sh
│   └── deploy.sh
│
├── appspec.yml
├── README.md
└── .gitignore
```

## 🏗️ Infrastructure as Code

Terraform is used to define the AWS infrastructure.

The Terraform configuration covers:

* VPC
* Public Subnets
* Security Groups
* IAM Roles
* EC2 Launch Template
* Auto Scaling Group
* Application Load Balancer
* Target Group
* Amazon S3
* AWS CodeDeploy

Common Terraform commands:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## 🔵 Blue Environment

The Blue environment represents the current production application.

```text
Users
  |
  v
Application Load Balancer
  |
  v
🔵 BLUE
Version 1.0
  |
  v
Production
```

The Blue environment remains available while the new application version is prepared.

## 🟢 Green Environment

The Green environment contains the new application version.

```text
AWS CodeDeploy
      |
      v
🟢 GREEN
Version 2.0
      |
      v
Health Validation
```

The Green environment is validated before receiving production traffic.

## 🔄 Blue → Green Deployment Process

### Step 1 — Blue is Production

Initially, production traffic is served by Blue.

```text
Users
  |
  v
ALB
  |
  v
🔵 BLUE Version 1.0
```

### Step 2 — New Version is Prepared

The new application version is packaged and stored.

```text
Version 2.0
    |
    v
Deployment Package
    |
    v
Amazon S3
```

### Step 3 — CodeDeploy Deploys Green

AWS CodeDeploy deploys the new application version into the Green environment.

```text
AWS CodeDeploy
      |
      v
🟢 GREEN Version 2.0
```

### Step 4 — Health Check

The Green environment is validated before traffic switching.

```text
Green Environment
       |
       +---- Application Health Check
       |
       +---- Target Group Health
       |
       +---- Application Validation
```

### Step 5 — Traffic Switch

After successful validation, traffic moves from Blue to Green.

```text
Before:

ALB
 |
 +----> 🔵 BLUE Version 1.0


After:

ALB
 |
 +----> 🟢 GREEN Version 2.0
```

Green becomes the new production environment.

### Step 6 — Rollback

If the Green deployment fails, traffic can return to Blue.

```text
Deployment Failure
       |
       v
Rollback
       |
       v
🔵 BLUE Version 1.0
       |
       v
Production
```

## ⚖️ Application Load Balancer

The Application Load Balancer acts as the main traffic entry point.

```text
Internet
   |
   v
Application Load Balancer
   |
   +------> Blue Target Group
   |
   +------> Green Target Group
```

The ALB provides controlled traffic distribution between application environments.

## 📈 Auto Scaling

Auto Scaling manages EC2 instances dynamically.

```text
Auto Scaling Group
        |
        +---- EC2 Instance
        |
        +---- EC2 Instance
        |
        +---- EC2 Instance
```

Benefits include:

* Automatic instance management
* Horizontal scaling
* Improved availability
* Better fault tolerance

## 🚀 AWS CodeDeploy

AWS CodeDeploy is responsible for application deployment automation.

The deployment process is designed to:

1. Prepare the deployment
2. Provision or use the Green environment
3. Install the new application version
4. Validate the application
5. Shift production traffic
6. Maintain rollback capability

## 🪣 Amazon S3

Amazon S3 is used to store deployment artifacts.

```text
Application Package
        |
        v
Amazon S3
        |
        v
AWS CodeDeploy
```

Deployment artifacts can contain:

* Application source
* Configuration files
* Deployment scripts
* appspec.yml

## 🔐 IAM and Security

IAM roles are used to provide AWS services with required permissions.

Security practices used in this project include:

* IAM roles instead of hard-coded AWS credentials
* Least privilege permissions
* Security Groups for network control
* No AWS credentials committed to GitHub
* Sensitive files excluded using .gitignore
* Private keys excluded from Git
* Terraform state files excluded from GitHub

## 🧪 Testing Strategy

The deployment should be validated before production traffic is shifted.

Application test:

```bash
curl http://<ALB-DNS>
```

Expected Blue response:

```text
AWS Blue-Green Deployment
Version 1.0 - BLUE
```

Expected Green response:

```text
AWS Blue-Green Deployment
Version 2.0 - GREEN
```

Health validation flow:

```text
Green Environment
       |
       v
Application Health
       |
       v
Target Group Health
       |
       v
ALB Connectivity
       |
       v
Production Traffic
```

Rollback testing:

```text
Green Deployment
      |
      X
Deployment Failure
      |
      v
Rollback
      |
      v
Blue Environment
```

## 📊 Traditional vs Blue-Green Deployment

| Feature                | Traditional Deployment | Blue-Green Deployment |
| ---------------------- | ---------------------- | --------------------- |
| Downtime               | Possible               | Minimal / Low         |
| Rollback               | Slower                 | Faster                |
| Testing Before Traffic | Limited                | Yes                   |
| Production Risk        | Higher                 | Lower                 |
| Traffic Switching      | Manual/Possible        | Controlled            |
| Environment Isolation  | Usually No             | Yes                   |
| Automation             | Depends                | High                  |

## 🎯 Key DevOps Concepts Demonstrated

* Blue-Green Deployment
* Infrastructure as Code
* Terraform
* AWS CodeDeploy
* Application Load Balancer
* Auto Scaling
* Amazon EC2
* Amazon S3
* IAM
* VPC
* Security Groups
* Deployment Automation
* Traffic Switching
* Rollback Strategy
* Low Downtime Deployment
* Git
* GitHub
* Linux
* Python Flask
* Docker

## 📚 Learning Outcomes

Through this project, I gained practical understanding of:

* Designing AWS deployment architectures
* Infrastructure as Code using Terraform
* Blue-Green Deployment strategy
* AWS CodeDeploy
* EC2 instance management
* Auto Scaling
* Application Load Balancer configuration
* S3 deployment artifact management
* IAM roles and permissions
* Security Groups
* Traffic switching
* Deployment validation
* Rollback strategies
* Git version control
* GitHub project management
* Production-oriented DevOps architecture

## 💡 Benefits of Blue-Green Deployment

### Reduced Downtime

The new application version can be prepared and validated before production traffic is switched.

### Safer Releases

The current production environment remains available during deployment.

### Fast Rollback

If the new version has problems, traffic can be redirected to the previous stable version.

### Better Validation

The Green environment provides an isolated environment for testing before production traffic is moved.

### Reduced Deployment Risk

The release process reduces the impact of failed application deployments.

## 🧩 Production-Style Architecture

```text
                         USERS
                           |
                           v
                Application Load Balancer
                           |
                 +---------+---------+
                 |                   |
                 v                   v
             BLUE ENV            GREEN ENV
             Version 1.0         Version 2.0
                 |                   |
                 +---------+---------+
                           |
                           v
                    AWS CodeDeploy
                           |
                           v
                       Amazon S3
                           |
                           v
                         GitHub
```

## 🧰 Tools and Technologies

```text
Cloud:
AWS

Infrastructure:
Terraform

Deployment:
AWS CodeDeploy

Compute:
Amazon EC2

Networking:
VPC
Application Load Balancer
Security Groups

Scaling:
Auto Scaling

Storage:
Amazon S3

Security:
IAM

Application:
Python
Flask

Version Control:
Git
GitHub

Containerization:
Docker

Operating System:
Linux
```

## 💼 Resume Description

Designed a production-style AWS Blue-Green Deployment architecture using Terraform, AWS CodeDeploy, Application Load Balancer, EC2, Auto Scaling, Amazon S3 and IAM. Implemented separate Blue and Green application environments with health validation, controlled traffic switching and rollback strategy to reduce deployment downtime and production release risk.

## 💼 Skills Demonstrated

```text
AWS Cloud
Terraform
AWS CodeDeploy
Amazon EC2
Application Load Balancer
Auto Scaling
Amazon S3
IAM
VPC
Security Groups
Linux
Python Flask
Docker
Git
GitHub
DevOps
Infrastructure as Code
Blue-Green Deployment
```

## 🔮 Future Enhancements

The project can be extended with:

* GitHub Actions CI/CD pipeline
* Automated Terraform deployment
* Docker containerization
* Amazon ECR integration
* Amazon ECS deployment
* AWS CloudWatch monitoring
* CloudWatch alarms
* Amazon SNS notifications
* Automated deployment approval
* Automated rollback
* HTTPS using AWS Certificate Manager
* Route 53 DNS integration
* Custom domain
* AWS WAF integration
* Centralized logging
* Automated application testing
* Security scanning
* Terraform remote state using Amazon S3
* DynamoDB state locking
* Dev, Staging and Production environments

## 🚀 Future CI/CD Architecture

```text
Developer
    |
    v
GitHub
    |
    v
GitHub Actions
    |
    +---- Build
    |
    +---- Test
    |
    +---- Docker Build
    |
    v
Amazon ECR / S3
    |
    v
AWS CodeDeploy
    |
    v
Green Environment
    |
    v
Automated Testing
    |
    v
Traffic Shift
    |
    v
Production
```

## 📌 Project Information

```text
Project Name    : AWS Blue-Green Deployment
Project Type    : DevOps / Cloud
Cloud Platform  : AWS
Deployment      : Blue-Green
Infrastructure  : Terraform
Deployment Tool : AWS CodeDeploy
Application     : Python Flask
Version Control : Git & GitHub
Container       : Docker
Status          : Portfolio Project
```

## 👨‍💻 Author

**Jaikrish**

B.Tech – Information Technology

Cloud & DevOps Technologies:

`AWS` `Terraform` `Linux` `Python` `Docker` `Git` `GitHub` `DevOps`

## ⭐ Project

This project was created to demonstrate practical knowledge of AWS Cloud, DevOps, Infrastructure as Code, deployment automation and Blue-Green deployment strategies.

If you found this project useful, feel free to explore the repository and give it a ⭐.

---

```
```
