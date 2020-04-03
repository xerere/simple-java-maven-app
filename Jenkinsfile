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
        // stage('Run Sonar') {
        //      steps {
        //         sh 'mvn sonar:sonar -Dsonar.projectKey=myproject -Dsonar.host.url=http://10.40.130.72:9000 -Dsonar.login=494f02873e0322c15fa1c88574a6332e1996e7cf'
        //      }  
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
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
}