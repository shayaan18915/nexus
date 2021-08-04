pipeline {
    agent any
	
	  tools
    {
       maven "Maven.3.6.3"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/ishaqmdgcp/nexus.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
                
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp ishaqmd/javaapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
		                 
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        //withDockerRegistry([ credentialsId: "DOCKER_HUB"]) {
          //sh  'docker push ishaqmd/javaapp:latest'
          //sh  'docker push ishaqmd/javaapp:$BUILD_NUMBER'
		
		    sh 'docker login --username=ishaqmd --password=$PASSWD'
    sh  'docker push ishaqmd/javaapp:latest'
}
        
                  
          
  }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8008:8080 ishaqmd/javaapp"
 
            }
        }
 //stage('Run Docker container on remote hosts') {
             
   //         steps {
     //           sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 ishaqmd/jenkins"
 
           // }
        //}
    }
	}
