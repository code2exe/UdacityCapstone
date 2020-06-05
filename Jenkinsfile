pipeline {
  agent any
  
  stages {
    stage('Set current kubectl context') {
			steps {
				withAWS(region:'eu-west-2', credentials:'ACredentials') {
				  sh  'context=$(kubectl config current-context)'
					sh	'kubectl config use-context $context'
			
				}
			}
		}

		stage('Deploy blue container') {
			steps {
			  dir('k8s')  {
				withAWS(region:'eu-west-2', credentials:'ACredentials') {
					sh 'kubectl apply --context $context -f blue-controller.json'
				
				}
			}
		}
		}

		stage('Deploy green container') {
			steps {
			  dir('k8s')  {
				withAWS(region:'eu-west-2', credentials:'ACredentials') {
					sh 'kubectl apply --context $context -f green-controller.json'
				
				}
			}
		}
		}

		stage('Create the service in the cluster, redirect to blue') {
			steps {
			  dir('k8s')  {
				withAWS(region:'eu-west-2', credentials:'ACredentials') {
					sh 'kubectl apply --context $context -f blue-service.json'
				
				}
			}
		}
		}

		stage('Wait user approve') {
            steps {
                input "Ready to redirect traffic to green?"
            }
        }

		stage('Create the service in the cluster, redirect to green') {
			steps {
			  dir('k8s')  {
				withAWS(region:'eu-west-2', credentials:'ACredentials') {
					sh 'kubectl apply --context $context -f green-service.json'
				
				      }
			      }
		      }
		}

	}
}