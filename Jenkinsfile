pipeline {
    agent any
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
                sh 'docker build -t demo .'
            }
  
            }
                    stage("Deploying") {
            steps {
                sh 'docker run --name demo -p 8000:8000 -d demo'
            }
  
            }

        }
}


