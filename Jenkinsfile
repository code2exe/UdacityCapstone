pipeline {
	agent any
	stages {

		stage('Create K8s Cluster') {
			steps {
				withAWS(region:'eu-west-2', credentials:'ACredentials') {
					sh '''
						eksctl create cluster \
						--name udacity-capstone \
						--version 1.13 \
						--nodegroup-name standard-workers \
						--node-type t2.micro \
						--nodes 2 \
						--nodes-min 1 \
						--nodes-max 3 \
						--node-ami-family Ubuntu1804 \
						--region eu-west-2 \
						--zones eu-west-2a \
						--zones eu-west-2b \
						--zones eu-west-2c \
					'''
				}
			}
		}

		

		stage('Create Config File Cluster') {
			steps {
				withAWS(region:'eu-west-2', credentials:'ACredentials') {
					sh 'aws eks update-kubeconfig --name udacity-capstone --region eu-west-2 --alias udacity-capstone'
					
				}
			}
		}

	}
}