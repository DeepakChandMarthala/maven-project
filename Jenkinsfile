pipeline {
    agent any
    stages {
        stage("Git CheckOut") {
            steps {
                echo "retriving Code.."

                git 'https://github.com/Abhi96chawla/maven-project.git'
                
            }
            }
 
            stage("Building code and Deploying") {
            steps {
                sh 'docker-compose up'
            }
  
            }

        }
}


