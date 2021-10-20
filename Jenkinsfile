pipeline {
    agent any
        	tools {
        	maven "maven"
    	}

    stages {
            stage('Properties file') {
            steps {
                script {
                    def props = readProperties file:'jenkinsfile.properties';
                    env['NexusURL_Port'] = props['NexusURL_Port']
                    env['NexusRelRepo'] = props['NexusRelRepo']
                    env['artifactId'] = props['artifactId']
                    env['classifier'] = props['classifier']
                    env['filepath'] = props['filepath']
                    env['type'] = props['type']
                    env['NexusCredentialsId'] = props['NexusCredentialsId']
                    env['groupId'] = props['groupId']
                    env['nexusVersion'] = props['nexusVersion']
                    env['protocol'] = props['protocol']
                    env['NexusSnaRepo'] = props['NexusSnaRepo']
                    env['SnapVersion'] = props['SnapVersion']
                    env['RelVersion'] = props['RelVersion']
                    }                
                }
            }
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
                sh 'curl http://"$NexusURL_Port"/repository/maven-releases/'
        		nexusArtifactUploader artifacts: [[artifactId: "$artifactId", classifier: "$classifier", file: "$filepath", type: "$type"]], credentialsId: "$NexusCredentialsId", groupId: "$groupId", nexusUrl: "$NexusURL_Port", nexusVersion: "$nexusVersion", protocol: "$protocol", repository: "$NexusSnaRepo", version: "$SnapVersion"
		        nexusArtifactUploader artifacts: [[artifactId: "$artifactId", classifier: "$classifier", file: "$filepath", type: "$type"]], credentialsId: "$NexusCredentialsId", groupId: "$groupId", nexusUrl: "$NexusURL_Port", nexusVersion: "$nexusVersion", protocol: "$protocol", repository: "$NexusRelRepo", version: "$RelVersion"
               }
            }
        }
    }
