pipeline {
    agent {
            label 'myagent'
    }
    // agent {
    //     docker {
    //         image 'maven:3-alpine'
    //         args '-v /root/.m2:/root/.m2'        
    //     }
    // }
    stages {
        stage('SonarQube analysis') {
            agent 'myagent'
            steps {
                def scannerHome = tool 'SonarScanner 4.0';
                withSonarQubeEnv('My SonarQube Server') { // If you have configured more than one global server connection, you can specify its name
                    sh "${scannerHome}/bin/sonar-scanner"
                }

            }
        }
    //     stage('Build') {
    //         agent 'maven'
    //         steps {
    //             sh 'mvn -B -DskipTests clean package'
    //         }
    //     }
    //     stage('Run Sonar') {
    //          steps {
    //             //sh 'ping -c 3 172.19.0.2'
    //             //sh 'mvn sonar:sonar -Dsonar.projectKey=myproject -Dsonar.host.url=http://10.40.130.72:9000 -Dsonar.login=390a085c7352cbe7509a309a83aad264a7280774'
    //             sh 'mvn  sonar:sonar \
    //                     -Dsonar.projectKey=MyProjectKey2 \
    //                     -Dsonar.host.url=http://172.19.0.2:9000 \
    //                     -Dsonar.login=c0db06e640bd00480aa63a06a86c6bd2c43e4f20'
    //          }
    //     } 
    //     stage('Test') { 
    //         steps {
    //             sh 'mvn test' 
    //         }
    //         post {
    //             always {
    //                 junit 'target/surefire-reports/*.xml' 
    //             }
    //         }
    //     }
        // stage('Deliver') { 
        //     steps {
        //         sh './jenkins/scripts/deliver.sh' 
        //     }
        // }
    }
}