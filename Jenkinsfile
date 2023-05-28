pipeline {
    agent any

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
                sh 'docker build -t zappyhire-project:latest .'
                sh 'docker run -p 80:80 --name zappyhire-container -d zappyhire-project:latest'
            }
        }
    }
}
