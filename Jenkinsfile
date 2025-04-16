pipeline {
    agent any

    stages {
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
                    // Remove existing container if already running
                    sh "docker rm -f my-website-container || true"
                    dockerImage.run("-p 8080:8080 --name my-website-container")
                }
            }
        }
    }
}
