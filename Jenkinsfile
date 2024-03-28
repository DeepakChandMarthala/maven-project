pipeline {
    agent any
        environment {
    def CONTAINER_NAME = "mycontainer-${BUILD_ID}" // Using BUILD_ID as a dynamic part of the container name
       def DOCKER_HUB_USERNAME="abhishekcha"
       def IMAGE_NAME="docker-repo-cicd"
       def IMAGE_TAG="latest"
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
                    
                    // Build Docker image with dynamically generated unique name
                     #sudo docker build -t ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} .
                 """
            }
  
            }
                    stage("Deploying") {
            steps {
                sh '#sudo docker run --name ${CONTAINER_NAME} -p 8000:8000 -d demo '
            }
  
            }

        }
}


