pipeline{  
  agent any 
  stages {       
    stage('Build & push image') {
      agent any
      steps {
        script{
            app = docker.build("petclinic")
            docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {       
            app.push("${env.BUILD_NUMBER}")            
            app.push("latest")
          }
        }        
      }    
    }
  }
}