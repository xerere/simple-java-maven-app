pipeline {
    // agent {
    //     docker {
    //         image 'maven:3-alpine'
    //         args '-v /root/.m2:/root/.m2'
    //     }
    // }
    stages {
        stage('SonarQube analysis') {
            steps {
                script {
                    // requires SonarQube Scanner 2.8+
                    scannerHome = tool 'SonarScanner 3.3';
                }  
                sh 'echo $HOSTNAME $scannerHome';          
                withSonarQubeEnv('My SonarQube Server') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
        // stage('Build') {
        //     steps {
        //         sh 'mvn -B -DskipTests clean package'
        //     }
        // }
        // stage('Test') { 
        //     steps {
        //         sh 'mvn test' 
        //     }
        //     post {
        //         always {
        //             junit 'target/surefire-reports/*.xml' 
        //         }
        //     }
        // }
        // stage('Deliver') { 
        //     steps {
        //         sh './jenkins/scripts/deliver.sh' 
        //     }
        // }
    }
}