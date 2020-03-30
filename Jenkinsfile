pipeline {
    // agent any
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        // stage('SonarQube analysis') {
        //     steps {
        //         script {
        //             // requires SonarQube Scanner 2.8+
        //             scannerHome = tool 'SonarScanner 3.3';
        //         }  
        //         sh 'echo $HOSTNAME $scannerHome';          
        //         withSonarQubeEnv('My SonarQube Server') {
        //             sh "${scannerHome}/bin/sonar-scanner"
        //         }
        //     }
        // }
        stage('Run Sonar') {
             steps {
                mvn sonar:sonar \
                    -Dsonar.projectKey='myproject' \
                    -Dsonar.host.url='http://10.40.130.72:9000' \
                    -Dsonar.login='f20d45e63135fe9f3c95371d04487c2ef6f9a401'
             }  
        }
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
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
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
}