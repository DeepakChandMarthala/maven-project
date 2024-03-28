pipeline {
    agent any
        environment {
       CONTAINER_NAME = "mycontainer-${BUILD_ID}" // Using BUILD_ID as a dynamic part of the container name
       registry = "abhishekcha/docker-test"
       registryCredential = 'dockerhub'
       dockerImage = ''
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
            sh 'sudo chmod 666 /var/run/docker.sock'
            script {
                            
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
            }
  
            }
                    stage("Deploying") {
            steps {
                sh 'sudo docker run --name ${CONTAINER_NAME} -p 8000:8000 -d $dockerImage '
            }
  
            }

        }
}


