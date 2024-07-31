﻿## <a name="_cslvcjmv71yb"></a>**Project 01 - 1 Hour**
## <a name="_trv8jvohne5n"></a>**Deploying a Scalable Web Application with Persistent Storage and Advanced Automation**
### <a name="_b2lav5bvov3m"></a>**Objective:**
Deploy a scalable web application using Docker Swarm and Kubernetes, ensuring data persistence using a single shared volume, and automate the process using advanced shell scripting.
### <a name="_j0pleyq9j9gt"></a>**Overview:**
1. **Step 1**: Set up Docker Swarm and create a service.
1. **Step 2**: Set up Kubernetes using Minikube.
1. **Step 3**: Deploy a web application using Docker Compose.
1. **Step 4**: Use a single shared volume across multiple containers.
1. **Step 5**: Automate the entire process using advanced shell scripting.

![ref1]
### ![](media/1.png)
#### ![](media/2.png)

### ![](media/3.png)
### <a name="_378bgdbsrhn2"></a><a name="_hraacbezs1da"></a>**Project 02 - 1 Hour**
### <a name="_lpgx121mmgx2"></a>**Comprehensive Deployment of a Multi-Tier Application with CI/CD Pipeline**
### <a name="_gnl597x2crh2"></a>**Objective:**
Deploy a multi-tier application (frontend, backend, and database) using Docker Swarm and Kubernetes, ensuring data persistence using a single shared volume across multiple containers, and automating the entire process using advanced shell scripting and CI/CD pipelines.
### <a name="_m0uilununvnc"></a>**Overview:**
1. **Step 1**: Set up Docker Swarm and create a multi-tier service.
1. **Step 2**: Set up Kubernetes using Minikube.
1. **Step 3**: Deploy a multi-tier application using Docker Compose.
1. **Step 4**: Use a single shared volume across multiple containers.
1. **Step 5**: Automate the deployment process using advanced shell scripting.

![ref1]
### <a name="_dt3gdm1iahw"></a>**Step 1: Set up Docker Swarm and Create a Multi-Tier Service**
#### <a name="_v18y38857b9p"></a>**1.1 Initialize Docker Swarm**

![](media/4.png)
### <a name="_2dck38r1bnra"></a>**Step 2: Set up Kubernetes Using Minikube**
#### <a name="_3mk2edb6stzg"></a>**2.1 Start Minikube**

\# Start Minikube

minikube start

#### ![](media/5.png)
### <a name="_v3rg44lgg8rx"></a>**Step 4: Use a Single Shared Volume Across Multiple Containers**
Update docker-compose.yml as shown in Step 3.1 to use the shareddata volume across the frontend and backend services.

[ref1]: media/1.png