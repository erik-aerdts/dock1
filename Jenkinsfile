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
      }
    }
  }
       stage('Run Dock1') {
       agent {
       steps {
       docker.image("dock1").run()
      }
    }
  }
}
