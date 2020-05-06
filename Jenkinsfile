pipeline {

    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'  
        }
    }

    stages {

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

        stage('Run Sonar') {
             steps {
                sh 'mvn  sonar:sonar \
                        -Dsonar.projectKey=MyProjectKey2 \
                        -Dsonar.host.url=http://10.40.115.72:9000 \
                        -Dsonar.login=d787adf8575cfd38ea8223fcbd03e9bcae6b932f'
             }   
        } 
        
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
}