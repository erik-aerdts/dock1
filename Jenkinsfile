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
      	#sh 'ifconfig'
      }
    }
  }
}
