### **Day 13**

### **Multi-Branch Project**

#### **Project Deliverables**

1.  **Git Repository:**

    -   I have created two branch for development and staging

![](.//media/image1.png)

2.  **Java Project:**

    -   Simple Java project created (HelloWorld application)

![](.//media/image2.png)

-   In master Branch I created a Sample.java file with simple print
    statement "Hello world from Master"

![](.//media/image3.png)

-   In development Branch I created a Sample.java file with simple print
    statement "Hello world from development"

![](.//media/image4.png)

-   In staging Branch I created a Sample.java file with simple print
    statement "Hello world from staging"

![](.//media/image5.png)

-   created Jenkinsfile in master branch

![](.//media/image6.png)

3.  **Jenkins Setup:**

    -   Multi-branch pipeline job configured in Jenkins.

    -   Jenkinsfile defining build and deployment steps.

    -   Environment variables managed using Jenkins environment variable
        > settings.

![](.//media/image7.png)

-   In jenkins dashboard i added an Environment Variable with name
    BRANCH\_NAME with value master/development/staging.

![](.//media/image8.png)

-   Created a multibranch pipeline project for this project.

![](.//media/image9.png)

![](.//media/image10.png)

-   bulild that file for 3 times with different environment variable

1\. master

![](.//media/image11.png)

2\. deployment

![](.//media/image12.png)

3\. staging

![](.//media/image13.png)
