pipeline {
    agent { any { image 'maven:3.3.3' } }
    stages {
        stage('build') {
            steps {
               sh 'mvn clean install'
            }
        }
        
        stage('list-directories')
        {
            steps { 
              
               sh 'cd /var/lib/jenkins/workspace'
               sh 'ls -ltr'
                
            }
        
        }
           
    }
}
