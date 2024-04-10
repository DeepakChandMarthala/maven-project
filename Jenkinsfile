pipeline {
    agent any

    environment 
    {
        CONTAINER_NAME = "mycontainer-${BUILD_ID}"
        REGISTRY = "deepakchandmarthala/maven-project"
        TAG = "latest"
        REGISTRY_CREDENTIAL = 'docker-hub'
        DOCKER_IMAGE = ''
        DOCKER_USERNAME = 'deepakchandmarthala'
        PASSWORD = 'Deepak@240199'
    }

    stages
    {
       stage("Git Checkout") 
        {
            steps {
                echo "Retrieving Code.."
                git 'https://github.com/DeepakChandMarthala/maven-project.git'
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
                    withCredentials([usernamePassword(credentialsId: "${REGISTRY_CREDENTIAL}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) 
                    {
                        sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    }
                }
            }
        }

        stage("Push Docker Image to Registry") 
        {
            steps {
                echo "Pushing Docker Image to Registry.."
                sh "docker push ${DOCKER_IMAGE}"
                  }
        }

        stage ("Deploy in EC2")
        {
            steps
            {
                script
                {
sshagent(credentials: ['Tomcat-Server']) {
    withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
        sh '''
            ssh -v -o StrictHostKeyChecking=no -l ubuntu 18.210.14.68 \
            'uname -a && \
            whoami && \
            echo logged into the node-server && \
            ls && \
            pwd && \
            ./script.sh
            '
            
        '''
    }
}
                }
            }
        }
        
    }

    post {
        always {
                    echo "Cleaning up..."
                    sh "docker logout"
                    //sh "docker system prune -a | echo 'y'"
                }
        }
}