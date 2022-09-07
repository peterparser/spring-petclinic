pipeline{
  agent{
    docker {
      image 'maven:3-jdk-11'
    }
  }   
stages {    
      def app     
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
      stage('Build image') {         
       steps {
            app = docker.build("petclinic")    
       }   
        }    
       stage('Push image') {
        steps {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {            
            app.push("${env.BUILD_NUMBER}")            
            app.push("latest")
          }        
          }    
      }
    }