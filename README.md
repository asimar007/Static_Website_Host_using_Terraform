# Static Website Host using Terraform

## Project Description

This project demonstrates how to use Terraform to create a static website hosting environment on Amazon Web Services (AWS) using Amazon S3 a. By following this guide, you'll be able to deploy a static website that is scalable, highly available, and secure.
## Project Goals

### Infrastructure as Code (IaC):
 Implement the infrastructure using Terraform, which allows you to define and manage your infrastructure in a declarative way.
    
### Static Website Hosting:
 Set up a static website using Amazon S3 to store the website's content.

## Key Steps

### 1.Make a portfolio:
Make a  portfolio using HTML, CSS & JavaScript containing the Terraform code for setting up the static website hosting environment.
    
### 2. Configure AWS Credentials:
 Set up your AWS credentials either through environment variables or by configuring the AWS CLI.
```
aws configure
```

Modify the `main.tf` file: Update the `mybucket` and other configurations in the `main.tf` file.
    
1.  Initialize Terraform
    ```
    terraform init
    ``` 
2.  Review the execution plan
 ```
 terraform plan
 ``` 
    
3.  Apply the changes
    
    ```
    terraform apply -auto-approve
    ``` 
    
    Confirm the action and wait for the infrastructure to be provisioned.
    
4.  Access your static website:
    
    Once the resources are provisioned, you will get a URL that you can access to view your static website.
    
5.  Clean up:
    
    When you're done, don't forget to clean up the resources to avoid unnecessary charges
    ```
    terraform destroy
    ```
## Technologies Used

### Terraform:
 Infrastructure as Code tool used to define and manage the AWS resources.
    
### Amazon S3:
Storage service used for hosting static website content, including HTML files, images, CSS, and JavaScript.

## Project Benefits

### Scalability:
CloudFront's global edge locations ensure fast content delivery to users worldwide.
    
### Cost-Effective:
Amazon S3 and CloudFront offer a cost-effective way to host and deliver static websites.
    
### High Availability:
CloudFront and S3 are designed for high availability and reliability.
    
### Security:
HTTPS encryption and security best practices are automatically applied to CloudFront distributions.
