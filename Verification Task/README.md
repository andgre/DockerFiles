jenkins-pipelines

Stage 1: Getting Terraform configuration file, Docker file and Ansible Playbook from GitHub; 
Stage 2: Initialize a working directory containing Terraform configuration file.
Stage 3: Apply the changes required to reach the desired state of the configuration;
Stage 4: Destroy Development VM.

Terraform creates two VM instances (Development and Production) at Google Cloud (GCP), 
forms dynamic inventory for Ansible. Ansible playbook sets Development and Production Environment: 
Development VM is used to build Java Web Application Puzzle15 from Github and copy WAR artifact to Production VM;
Production VM is used to build Docker image with artifact and start Docker container with Tomcat and Web Application.
