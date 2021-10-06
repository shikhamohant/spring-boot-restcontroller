pipeline {
    agent { any { image 'maven:3.3.3' } }
    environment {
    NEXUS_CREDS = credentials('Nexus')
    NEXUS_USER = "admin"
    NEXUS_PASSWORD = "admin123"
  }
    stages {
        stage('build') {
            steps {
               sh 'mvn clean install'
            }
        }
        
        stage('predeployment-test')
        {
            steps { 
              
               //sh  'ls -ltr'
               sh './testjar.sh'
               sh  'mvn -X clean compile package'
               sh   'mvn -X deploy'
            }
            
        }
           
    }
}
