pipeline {
    environment {
		registry = "sumeetcloudengineer/zappyhire"
		registryCredentials = 'docker-credentials'
	}
    agent any

    triggers { pollSCM '* * * * *' }

    stages {
        stage('Cloning the Git Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sumeetcloudengineer/zappyhire_angular_project.git'
            }
        }
        stage('Build Application') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker stop zappyhire-container'
                sh 'docker rm zappyhire-container'
                sh 'docker rmi zappyhire-project:latest'
                sh 'docker build -t zappyhire-project:latest .'
                sh 'docker run -p 80:80 --name zappyhire-container -d zappyhire-project:latest'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker tag zappyhire-project sumeetcloudengineer/zappyhire-docker-image'
                sh 'docker push sumeetcloudengineer/zappyhire-docker-image'
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}
