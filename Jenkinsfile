pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2 --add-host sonarqube:172.19.0.2'  
        }
    }

    stages {       
        // stage('Build') {           
        //     steps {
        //         sh 'mvn -B -DskipTests clean package'
        //     }
        // }
        stage('Run Sonar') {
            agent any
            steps {
                script {
                    // requires SonarQube Scanner 2.8+
                    scannerHome = tool 'SonarQube Scanner'
                }
                withSonarQubeEnv('SonarQube Server') {
                    sh "${scannerHome}/bin/sonar-scanner \
                            -Dsonar.projectKey=MyProjectKey2 \
                            -Dsonar.host.url=http://172.19.0.2:9000 \
                            -Dsonar.login=d787adf8575cfd38ea8223fcbd03e9bcae6b932f"
                }           
            }
        } 
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