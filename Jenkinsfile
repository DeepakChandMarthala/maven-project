/*
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

*/

pipeline {
    agent any

    environment {
        CONTAINER_NAME = "mycontainer-${BUILD_ID}" // Using BUILD_ID as a dynamic part of the container name
        REGISTRY = "deepakchandmarthala/maven-project"
        TAG = "v1"
        REGISTRY_CREDENTIAL = 'dockerhub'
        DOCKER_IMAGE = ''
    }

    stages {
        stage("Git Checkout") {
            steps {
                echo "Retrieving Code.."
                git 'https://github.com/DeepakChandMarthala/maven-project.git'
            }
        }

        stage("Build Maven Project") {
            steps {
                echo "Building Maven Project.."
                sh "mvn clean package"
            }
        }

        stage("Build Docker Image") {
            steps {
                echo "Building Docker Image.."
                script {
                    DOCKER_IMAGE = "${REGISTRY}:${TAG}"
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage("Deploying Docker Container") {
            steps {
                echo "Deploying Docker Container.."
                sh "docker run -d --name ${CONTAINER_NAME} -p 8005:8005 ${DOCKER_IMAGE}"
            }
        }

    }
    }

/*       stage("Push Docker Image to Registry") {
            steps {
                echo "Pushing Docker Image to Registry.."
                script {
                    withCredentials([usernamePassword(credentialsId: "${correct-credential-id}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                    }
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
            sh "docker logout"
        }
    }
}
*/
