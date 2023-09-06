pipeline {
    agent any
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    environment {
        BUILD_SERVER_IP = 'ec2-user@3.80.245.196'
    }
    stages {
        stage('Compile') {
            agent {
                label 'linux_slave'
            }
            steps {
                script {
                    echo "COMPILING THE CODE"
                    sh 'mvn compile'
                }
            }
        }
        stage('UnitTest') {
            agent any
            steps {
                script {
                    echo "RUN THE UNIT TEST CASES"
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Package') {
            agent any
            steps {
                script {
                    echo "PACKAGE THE CODE"
                    sshagent(['ssh-key']) {
                        sh "scp -o StrictHostKeyChecking=no server-script.sh ${BUILD_SERVER_IP}:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ${BUILD_SERVER_IP} 'bash ~/server-script.sh'"
                    }
                }
            }
        }
    }
}
