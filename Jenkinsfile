pipeline {
    agent { any { image 'maven:3.3.3' } }
    environment {
        NEXUS_VERSION="nexus3"
        NEXUS_PROTOCOL="http"
        NEXUS_CREDS = credentials('NexusNew')
        NEXUS_URL="127.0.0.1:8081"
        NEXUS_REPOSITORY = "maven-releases"
        //NEXUS_USER = "${NEXUS_CREDS_USR}"
        //NEXUS_PASSWORD = "${NEXUS_CREDS_PSW}"
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
                sh 'curl http://localhost:8081/repository/maven-releases'
                script {
                    // Read POM xml file using 'readMavenPom' step , this step 'readMavenPom' is included in: https://plugins.jenkins.io/pipeline-utility-steps
                    pom = readMavenPom file: "pom.xml";
                    // Find built artifact under target folder
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    // Print some info from the artifact found
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    // Extract the path from the File found
                    artifactPath = filesByGlob[0].path;
                    // Assign to a boolean response verifying If the artifact name exists
                    artifactExists = fileExists artifactPath;
                    mvnHome='/var/lib/jenkins/workspace/springpipe';

                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        
                       nexusArtifactUploader (artifacts: [[artifactId: 'spring-boot-restcontroller-example', classifier: 'debug', file: '/var/lib/jenkins/workspace/springpipe/spring-boot-restcontroller-example-0.0.1-SNAPSHOT.jar', type: 'jar']], groupId: 'es.macero.dev', nexusUrl: 'localhost:8081/repository/maven-releases', nexusVersion: 'nexus3', protocol: 'http', repository: 'deployments', version: '0.0.1-SNAPSHOT'
                       );
            
                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                    }
                }
            }
        }
         
            }
                
 
        }
