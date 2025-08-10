Project Description

Title:
 Terraform Project to Launch VPC and EC2 Instance with Remote State Management
Overview:

This project automates the provisioning of AWS infrastructure using Terraform, focusing on deploying a custom Virtual Private Cloud (VPC) and an EC2 instance, while also implementing secure and reliable Terraform state file management using Amazon S3 and DynamoDB.

It follows Infrastructure as Code (IaC) best practices, allowing the environment to be repeatable, version-controlled, and collaborative.
 What It Does:

    Creates a Custom VPC

        Defines a custom IP range using a CIDR block.

        Includes a public subnet for internet-accessible resources.

    Provisions an EC2 Instance

        Launches a virtual machine using a selected AMI and instance type.

        Associates the EC2 instance with a security group t

    Configures Networking

        Attaches an Internet Gateway to the VPC.

        Associates a route table to route traffic to the internet.

        Associates the route table with the subnet.

    Manages Security

        Creates and attaches a Security Group that allows inbound HTTP and SSH traffic.

        Allows all outbound traffic for updates or dependencies.

    Implements Remote State Management

        Uses an S3 bucket to store the terraform.tfstate file (the source of truth for your infrastructure state).

        Uses a DynamoDB table to enable state locking, preventing multiple simultaneous Terraform executions (which could corrupt state).

🛠️ Tools & Technologies Used:

    Terraform – Infrastructure as Code (IaC)

    AWS – Cloud infrastructure

        EC2, VPC, Subnet, Security Group, Route Table, Internet Gateway

        S3 (for remote state)

        DynamoDB (for state locking)

    Jenkins – CI/CD pipeline integration for automated deployments

    GitHub – Source control and collaboration

Objectives:

    Automate the creation of AWS resources using Terraform.

    Store and manage infrastructure state securely in a remote backend.

    Ensure consistency and team collaboration using version-controlled infrastructure.

    Enable safe multi-user Terraform usage with state locking.

