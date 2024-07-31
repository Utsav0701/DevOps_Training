Day 12

1.  **Setup Jenkins Job**

    -   Create a new Jenkins pipeline job.

    -   Configure the job to pull the Jenkinsfile from the GitHub
        > repository.

![](.//media/image1.png)

2.  **Create Jenkinsfile**

    -   **Clone Repository**: Clone the Maven project from the GitHub
        > repository.

    -   **Build**: Execute the Maven build process (mvn clean install).

    -   **Test**: Run unit tests as part of the Maven build.

    -   **Archive Artifacts**: Archive the build artifacts for future
        > use.

.

![](.//media/image2.png)

![](.//media/image3.png)

**3. Configure Pipeline Parameters**

-   Allow the pipeline to accept parameters such as Maven goals and
    > options for flexibility.

-   Ensure the pipeline can be easily modified for different build
    > configurations.

**4. Run the Pipeline**

-   Trigger the Jenkins pipeline job manually or set up a webhook for
    > automatic triggering on GitHub repository changes.

-   Monitor the build process through Jenkins\' UI and console output.

![](.//media/image4.png)
