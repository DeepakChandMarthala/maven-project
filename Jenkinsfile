pipeline {
    agent any
        environment {
        CONTAINER_NAME = "mycontainer-${BUILD_ID}" // Using BUILD_ID as a dynamic part of the container name
    }
    stages {
        stage("Git CheckOut") {
            steps {
                echo "retriving Code.."

                git 'https://github.com/Abhi96chawla/maven-project.git'
                
            }
            }
 
            stage("Building") {
            steps {
                sh """
                        #!/bin/bash
                    sudo chmod 666 /var/run/docker.sock
                    def baseName = "myimage"
                    def timestamp = new Date().format("yyyyMMddHHmmss")
                    def imageName = "${baseName}-${timestamp}"
                    
                    // Build Docker image with dynamically generated unique name
                       docker build -t ${imageName} .
                       
                 """
            }
  
            }
                    stage("Deploying") {
            steps {
                sh 'docker run --name ${CONTAINER_NAME} -p 8000:8000 -d demo '
            }
  
            }

        }
}


