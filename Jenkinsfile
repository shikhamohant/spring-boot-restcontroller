pipeline {
    agent any
        	tools {
        	maven "maven"
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
               sh  'mvn  clean compile package'
            }
            
        }
            
             stage("publish to nexus") {
            steps {
                sh 'curl http://192.168.221.128:8091/repository/maven-releases/'
                nexusArtifactUploader artifacts: [[artifactId: 'spring-boot-restcontroller-example', classifier:'debug', file: '/var/lib/jenkins/workspace/restcontroltest1_master/target/spring-boot-restcontroller-example-0.0.1-SNAPSHOT.jar', type: 'jar']],credentialsId: 'ba1a5ce3-b8ed-43ed-8ed3-b387ee6cffa3', groupId: 'es.macero.dev', nexusUrl: '192.168.221.128:8091', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '0.0.1-SNAPSHOT'
                nexusArtifactUploader artifacts: [[artifactId: 'spring-boot-restcontroller-example', classifier:'debug', file: '/var/lib/jenkins/workspace/restcontroltest1_master/target/spring-boot-restcontroller-example-0.0.1-SNAPSHOT.jar', type: 'jar']],credentialsId: 'ba1a5ce3-b8ed-43ed-8ed3-b387ee6cffa3', groupId: 'es.macero.dev', nexusUrl: '192.168.221.128:8091', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: '2.3.12.RELEASE'     
                }
            }
        
         
            }
                
 
        }
