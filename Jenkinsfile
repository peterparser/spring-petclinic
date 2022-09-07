pipeline{   
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
      agent{
        docker {
          image 'maven'
        }
  }
    }  
    stage('Push image') {
      agent any
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