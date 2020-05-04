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
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Run Sonar') {
             steps {
                //sh 'mvn sonar:sonar -Dsonar.projectKey=myproject -Dsonar.host.url=http://10.40.130.72:9000 -Dsonar.login=390a085c7352cbe7509a309a83aad264a7280774'
                sh 'mvn sonar:sonar \
                        -Dsonar.projectKey=MyProjectKey \
                        -Dsonar.host.url=http://emsa_sonarqube:9000 \
                        -Dsonar.login=b8dc6355ab6cfcae96e51f8cece780489cc7f4ba'
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