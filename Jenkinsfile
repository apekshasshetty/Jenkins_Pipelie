pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-website")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    dockerImage.run("-p 8080:8080")
                }
            }
        }
    }
}
