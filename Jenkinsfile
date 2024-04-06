/*pipeline {
    agent any
        environment {
       CONTAINER_NAME = "mycontainer-${BUILD_ID}" // Using BUILD_ID as a dynamic part of the container name
       registry = "deepakchandmarthala/maven-project"
       tag = "v1"
       registryCredential = 'dockerhub'
       dockerImage = ''
    }
    stages {
        stage("Git CheckOut") {
            steps {
                echo "retriving Code.."

                //git 'https://github.com/Abhi96chawla/maven-project.git' 
                git 'https://github.com/DeepakChandMarthala/maven-project.git'
                
            }
            }
    }
}
*/
pipeline {
    agent any
        environment {
       CONTAINER_NAME = "mycontainer-${BUILD_ID}" // Using BUILD_ID as a dynamic part of the container name
       registry = "deepakchandmarthala/maven-project"
       tag = "v1"
       registryCredential = 'dockerhub'
       dockerImage = ''
    }
    stages {
        stage("Git CheckOut") {
            steps {
                echo "retriving Code.."

                //git 'https://github.com/Abhi96chawla/maven-project.git' 
                git 'https://github.com/DeepakChandMarthala/maven-project.git'
                
            }
            }
 
            stage("Building") {
            steps {
                //sh 'sudo chmod 666 /var/run/docker.sock'
                sh 'sudo chmod 777 /var/run/docker.sock'
                sh 'docker build -t ${registry}:${tag} .'
            }
  
            }
                    stage("Deploying") {
            steps {
                sh 'sudo docker run --name ${CONTAINER_NAME} -p 8000:8000 -d ${registry}:${tag} '
            }
  
            }

        }
}


