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
              
               sh 'mvn -N io.takari:maven:0.7.7:wrapper'
                
            }
        
        }
           
    }
}
