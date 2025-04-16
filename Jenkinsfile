pipeline {
    agent any
    stages {
        stage('Clone Repo') {
            steps {
                git(url: 'https://github.com/apekshasshetty/Jenkins_Pipelie', branch: 'main')
            }
        }
 
        stage('Build Docker Image') {
            steps {
                script {
                    bat '''docker build -t my-image .'''
                }
            }
        }
 
        stage('Run Container') {
            steps {
                script {
                    // Stop and remove existing container if any - ignore errors
                    bat '''
                        docker stop my-running-container || echo "Container not running"
                        docker rm my-running-container || echo "Container not found"
                    '''
                   
                    // Check if port 8090 is in use - use returnStatus to get the exit code
                    def portCheck = bat(script: 'netstat -an | findstr 8090', returnStatus: true)
                   
                    // portCheck == 0 means port is in use (findstr found the pattern)
                    if (portCheck == 0) {
                        echo 'Port 8090 is already in use, using fallback port 8091'
                        bat "docker run -d -p 8091:80 --name my-running-container my-image"
                    } else {
                        echo 'Port 8090 is available'
                        bat "docker run -d -p 8090:80 --name my-running-container my-image"
                    }
                }
            }
        }
    }
}