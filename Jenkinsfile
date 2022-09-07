pipeline{
  agent {
    docker { image 'openjdk:20-slim-buster'}
}

stages {    
      def app     
      stage('Clone repository') {               
             
            checkout scm    
      }   
      stage('Build package') {         
       
            sh 'mvn clean package' 
       }  
      stage('Build image') {         
       
            app = docker.build("petclinic")    
       }     
       stage('Push image') {
       docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {            
         app.push("${env.BUILD_NUMBER}")            
         app.push("latest")        
        }    
      }
    }