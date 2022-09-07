pipeline{
  agent{
    docker {
      image 'maven:3-jdk-11'
    }
  }   
  stages {       
    stage('Clone repository') {               
      steps {    
          checkout scm
      }  
    }   
    stage('Build package') {      
      steps {
          sh 'mvn clean package'
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