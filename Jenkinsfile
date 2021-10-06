pipeline {
    agent { any { image 'maven:3.3.3' } }
    stages {
        stage('build') {
            steps {
               sh 'mvn clean install'
            }
        }
        
        stage('post-build')
        {
            steps { 
              
               sh 'mvn compiler:compile'
               sh  'mvn site' 
                
            }
        
        }
           
    }
}
