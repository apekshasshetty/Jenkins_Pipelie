// pipeline {
//     agent any
//     stages {
//         stage('Clone Repo') {
//             steps {
//                 git(url: 'https://github.com/apekshasshetty/Jenkins_Pipelie', branch: 'main')
//             }
//         }
 
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     bat 'docker build -t my-image .'
//                 }
//             }
//         }
 
//         stage('Run Container') {
//             steps {
//                 script {
//                     // Stop and remove existing container if any - using separate commands with returnStatus
//                     bat(script: 'docker stop my-running-container', returnStatus: true)
//                     bat(script: 'docker rm my-running-container', returnStatus: true)
                   
//                     // Check if port 8090 is in use
//                     def portCheck = bat(script: 'netstat -an | findstr 8090', returnStatus: true)
                   
//                     if (portCheck == 0) {
//                         echo 'Port 8090 is already in use, using fallback port 8091'
//                         bat 'docker run -d -p 8091:80 --name my-running-container my-image'
//                     } else {
//                         echo 'Port 8090 is available'
//                         bat 'docker run -d -p 8090:80 --name my-running-container my-image'
//                     }
//                 }
//             }
//         }
//     }
// }

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
                    bat 'docker build -t my-image .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run container for testing
                    bat 'docker run -d -p 8090:80 --name test-container my-image'
                    bat 'timeout /t 5' // wait a bit for container to start

                    // Run PowerShell test
                    bat 'powershell -ExecutionPolicy Bypass -File test.ps1'

                    // Stop and remove container
                    bat 'docker stop test-container'
                    bat 'docker rm test-container'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    bat(script: 'docker stop my-running-container', returnStatus: true)
                    bat(script: 'docker rm my-running-container', returnStatus: true)

                    def portCheck = bat(script: 'netstat -an | findstr 8090', returnStatus: true)

                    if (portCheck == 0) {
                        echo 'Port 8090 is already in use, using fallback port 8091'
                        bat 'docker run -d -p 8091:80 --name my-running-container my-image'
                    } else {
                        echo 'Port 8090 is available'
                        bat 'docker run -d -p 8090:80 --name my-running-container my-image'
                    }
                }
            }
        }

       stage('Deploy to Render') {
    steps {
        script {
            bat 'curl -X POST https://api.render.com/deploy/srv-cvvp65adbo4c738ddpug?key=BdEwJCr6zfc'
        }
    }
}
    }
}
