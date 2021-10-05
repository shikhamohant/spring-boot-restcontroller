pipeline {
    agent { any { image 'maven:3.3.3' } }
    stages {
        stage('build') {
            steps {
                sh 'pwd'
                sh 'ls -ltr'
                sh 'mvn clean package'
                sh 'mvn clean install'
            }
        }
           
    }
}
