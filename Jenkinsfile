

pipeline {
    agent any

    environment {
        CONTAINER_NAME = "mycontainer-${BUILD_ID}"
        REGISTRY = "deepakchandmarthala/maven-project"
        TAG = "v1"
        REGISTRY_CREDENTIAL = 'docker-hub'
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

        stage("Login to Docker Registry") {
            steps {
                echo "Logging in to Docker Registry.."
                script {
                    withCredentials([usernamePassword(credentialsId: "${REGISTRY_CREDENTIAL}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    }
                }
            }
        }

        stage("Push Docker Image to Registry") {
            steps {
                echo "Pushing Docker Image to Registry.."
                sh "docker push ${DOCKER_IMAGE}"
            }
        }
    }
   stage('Deploy image on EC2')
    {
        steps 
        {
            script 
            {
            // Docker login
            withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) 
            {
                sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
            }

            // Pull Docker image
            sshagent(credentials: ['Tomcat-Server']) 
            {
    withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) 
                {
                    sh 
                    '''
                    ssh -v -o StrictHostKeyChecking=no -l ubuntu 54.144.81.109 \
                    'uname -a && \
                    whoami && \
                    echo logged into the node-server && \
                    ls && \
                    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD && \
                    docker pull deepakchandmarthala/maven-project:v1'
                    '''
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
