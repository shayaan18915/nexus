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
		withCredentials([string(credentialsId: 'DOCKER_USER', variable: 'DOCKER_USER'), string(credentialsId: 'PASSWD', variable: 'DOCKER_PASSWORD')]) {
            sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD"
              sh  'docker push ishaqmd/javaapp:latest'
          }
		  

}
        
                  
          
  }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run --name javaapp -d -p 8008:8080 ishaqmd/javaapp"
				sh 'curl localhost:8080/hello'
				sh 'sleep 20'
				sh 'docker stop javaapp'
				sh 'docker rm javaapp'
 
            }
        }
 //stage('Run Docker container on remote hosts') {
             
   //         steps {
     //           sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 ishaqmd/jenkins"
 
           // }
        //}
    }
	}
