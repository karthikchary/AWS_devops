Here's a comprehensive README file with detailed steps for setting up the Jenkins CI/CD pipeline for the iVolve web application:

Jenkins CI/CD Pipeline Setup for iVolve Web Application
Table of Contents
Prerequisites
Jenkins Slave Configuration
Shared Library Setup
Credentials Configuration
Pipeline Job Creation
Kubernetes Manifests Preparation
Running the Pipeline
Verification Steps
1. Prerequisites
Jenkins master and slave instances provisioned using Ansible playbooks
Java Development Kit (JDK) installed on both Jenkins master and slave
Git installed and configured on both instances
Docker installed and configured on the Jenkins slave
Kubernetes cluster accessible from the Jenkins slave
GitHub repository for the iVolve web application
Separate GitHub repository for Kubernetes manifests
2. Jenkins Slave Configuration
Follow these steps to configure the Jenkins slave:

Log in to the Jenkins master web interface
Navigate to Manage Jenkins > Manage Nodes and Clouds
Click New Node to create a new agent
Enter "agent" as the node name and select Permanent Agent
Configure the node with these settings:
Remote root directory: /home/ubuntu
Labels: slave
Usage: Use this node as much as possible
Launch method: Launch agent via SSH
Enter the Private IP address of Jenkins slave instance
Add SSH credentials for the ubuntu user with the private key
    cat jenkins-key.pem
Set Host Key Verification Strategy to Non verifying Verification Strategy
Click Save to create the node
Verify the slave connection appears online in the Nodes list
Alt text

3. Shared Library Setup
To create and configure the Jenkins shared library:

Create a new Git repository named "jenkins-shared-library"
Clone the repository to local machine
Create the following directory structure in the repository:
vars/ for global pipeline variables
Add the Groovy scripts for Docker operations and Git operations
Commit and push the initial implementation to the repository
In Jenkins, navigate to Manage Jenkins > Configure System
Scroll to trusted Global Pipeline Libraries section
Add a new library with name "jenkins-shared-library"
Configure the library with:
Default version: main
Retrieval method: Modern SCM
Source Code Management: Git
Repository URL of your shared library
Credentials if required
Click Save to apply the configuration
Alt text

5. Credentials Configuration
Set up the required credentials in Jenkins:

Docker Hub credentials:

Navigate to Manage Jenkins > Manage Credentials
Add new credentials with type Username with password
Enter your Docker Hub username and password
Set ID to "docker"
Git SSH credentials:

In the same credentials section
Add new credentials with type SSH Username with private key
Enter "git" as username
Paste your SSH private key
Set ID to "git-credentials"
Add description "Git SSH Credentials"
Alt text

6. Pipeline Job Creation
Create and configure the main pipeline job:

From Jenkins dashboard, click New Item
Enter "iVolve-WebApp" as name
Select Pipeline type and click OK
In the configuration page:
Under Pipeline section, select Pipeline script from SCM
Choose Git as SCM
Enter application repository URL
Add Git credentials
Specify branch (main)
Set Script Path to jenkins/jenkinsfile
Click Save to create the pipeline
7. Kubernetes Manifests Preparation
Prepare your Kubernetes manifests repository:

Create a new Git repository for Kubernetes manifests
Add your existing Kubernetes YAML files:
deployment.yaml
service.yaml
ingress.yaml
persistent volume files
Organize the repository with clear structure
Modify deployment.yaml to use image placeholder:
Set image field to use Docker image name with :latest tag
This will be updated by the pipeline
Alt text

9. Verification Steps
After pipeline completion, verify all components:

Docker Image:
Log in to Docker Hub
Verify new image with build number tag exists
Alt text

Kubernetes Manifests:
Check the Git repository commit history
Verify deployment.yaml was updated with new image tag
Alt text

Application:

Check Kubernetes cluster for new deployment
Verify application pods are running with new image
Test application functionality
Review pipeline

Alt text