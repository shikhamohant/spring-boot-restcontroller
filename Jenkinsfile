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
              
               sh 'cd /var/lib/jenkins/.m2/repository/es/macero/dev/spring-boot-restcontroller-example/0.0.1-SNAPSHOT'
               sh 'ls -ltr'
                
            }
        
        }
           
    }
}
