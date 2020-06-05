## **Udacity Cloud DevOps Capstone Project**

The goal of this project is to build a CI/CD pipeline for an application using the skills learnt in previous lessons. These include:

- Working in AWS
- Using Jenkins to implement CI and CD
- Build pipelines with Blueocean on Jenkins
- Working with Ansible and CloudFormation to deploy clusters
- Building Docker Containers and Kubernetes clusters.

#### About Project:

Here, I created a multi-branch CI/CD pipeline for a basic hello world nginx application and deployed it Amazon EKS.

#### Requirements:

- [ ] Jenkins Host
- [ ] Blueocean plugin  for Jenkins
- [ ] Docker
- [ ] Kubectl
- [ ] eksctl
- [ ] Python
- [ ] awscli

#### To run the project:

There are 3 branches; the master branch, predeploy branch and the deployment branch.

```bash
1. git clone https://github.com/code2exe/UdacityCapstone.git && cd UdacityCapstone
```

Then create a pipeline on Blueocean, authenticate to GitHub and the builds will start.

*#TODO: Use a conditional pipeline to kick off each build in sequence*