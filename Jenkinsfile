pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('SonarQube analysis') {
            agent any;
            def scannerHome = tool 'SonarScanner 4.0';
            steps {
                sh 'echo $HOSTNAME'; 
                // withSonarQubeEnv('My SonarQube Server') { // If you have configured more than one global server connection, you can specify its name
                //     sh "${scannerHome}/bin/sonar-scanner"
                // }
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