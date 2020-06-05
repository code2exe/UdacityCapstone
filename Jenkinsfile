pipeline {
  agent any
  stages {
    stage('Lint') {
        parallel{
        stage('Lint Docker'){
      steps {
        sh 'hadolint Dockerfile'
      }
      }
      stage('Lint HTML'){
      steps {
        sh 'tidy -q -e html/*.html'
      }
      }
    }
     post {
        failure {
           echo 'This build has failed. See logs for details.'
         }
      }
    }
    
    stage('Build Docker Container') {
      steps {
        sh 'sudo docker build --tag=udacity-capstone .'
      }
    }
    
    stage('Login to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'docker-pwd', usernameVariable: 'docker-user')]) {
        sh 'docker login -u ${docker-user} -p ${docker-pwd}'
    }
      }
    }
    stage('Upload Image to DockerHub') {
      steps {
        sh 'make upload'
      }
    }
 
 
   
  }
  }