pipeline {
    // agent any
    agent {
        docker {
            image 'maven:3-alpine'
            //image 'maven'

            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -X -DskipTests clean package'
            }
        }
        stage('Run Sonar') {
             steps {
                //sh 'ping 172.19.0.2'
                //sh 'mvn sonar:sonar -Dsonar.projectKey=myproject -Dsonar.host.url=http://10.40.130.72:9000 -Dsonar.login=390a085c7352cbe7509a309a83aad264a7280774'
                sh 'mvn sonar:sonar \
                        -Dsonar.projectKey=MyProjectKey \
                        -Dsonar.host.url=http://172.19.0.2:9000 \
                        -Dsonar.login=0c6e4b5db517e23fe0af23cb1789d625979639d0'
             }
        } 
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        }
        // stage('Deliver') { 
        //     steps {
        //         sh './jenkins/scripts/deliver.sh' 
        //     }
        // }
    }
}