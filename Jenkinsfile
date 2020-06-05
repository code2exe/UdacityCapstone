pipeline {
  environment {
    registry = "ojbashxx/udacity-capstone"
    registryCredential = 'dockerhub'
    dockerImage = ''
}
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
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    
    stage('Build & Push to dockerhub') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    stage("Cleaning Docker up") {
            steps {
                script {
                    sh "echo 'Cleaning Docker up'"
                    sh "docker system prune -f"
                }
            }
        }
 
   
  }
  }