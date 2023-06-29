#!groovy
pipeline {
	agent none
  stages {
  	stage('Dock1 Install') {
    	agent {
      	docker {
        	image 'dock1'
        }
      }
      steps {
      	sh 'echo STAGE01'
        sh 'docker run --name dock1 -d -p 80:80 dock1'
      }
    }
}
}
