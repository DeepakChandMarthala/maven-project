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
                sh "docker run -d --name ${CONTAINER_NAME} -p 8006:8006 ${DOCKER_IMAGE}"
            }
        }

        stage("Push Docker Image to Registry") {
            steps {
                echo "Pushing Docker Image to Registry.."
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD} ${REGISTRY}"
                        sh "docker push ${DOCKER_IMAGE}"
                    }
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
