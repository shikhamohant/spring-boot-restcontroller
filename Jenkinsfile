pipeline {
    agent { any { image 'maven:3.3.3' } }
    environment {
        NEXUS_VERSION="nexus3"
        NEXUS_PROTOCOL="http"
        NEXUS_CREDS = credentials('Nexus')
        NEXUS_URL="127.0.0.1:8081"
        NEXUS_REPOSITORY = "maven-snapshots"
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
                sh 'curl http://localhost:8081/repository/maven-releases/'
                //nexusArtifactUploader artifacts: [[artifactId: 'spring-boot-restcontroller-example', classifier:'debug', file: '/var/lib/jenkins/workspace/springpipe/target/spring-boot-restcontroller-example-0.0.1-SNAPSHOT.jar', type: 'jar']],credentialsId: '', groupId: 'es.macero.dev', nexusUrl: '127.0.0.1:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: '0.0.1-SNAPSHOT'
                nexusArtifactUploader artifacts: [[artifactId: 'spring-boot-restcontroller-example', classifier:'debug', file: '/var/lib/jenkins/workspace/springpipe/target/spring-boot-restcontroller-example-0.0.1-SNAPSHOT.jar', type: 'jar']],credentialsId: '', groupId: 'es.macero.dev', nexusUrl: '127.0.0.1:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '0.0.1-SNAPSHOT'
                       
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
                    mvnHome='/usr/share/maven/';

                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        
                     
            
                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                    }
                }
            }
        }
         
            }
                
 
        }
