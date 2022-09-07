pipeline{
  agent{
    docker {
      image 'openjdk:20-slim-buster'
    }
  }   
  stages {        
    stage('Build package') {      
      steps {
          sh 'chmod +x mvnw'
          sh './mvnw clean package'
      } 
    }  
    stage('Push image') {
      steps {
        script{
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {         
            app = docker.build("petclinic")       
            app.push("${env.BUILD_NUMBER}")            
            app.push("latest")
          }
        }        
      }    
    }
  }
}