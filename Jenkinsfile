pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
        timestamps()
    }
    environment{
        
        registry = "erikaerdts/dock1"
        registryCredential = 'dockertoken'        
    }
    
    stages{
       stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
       stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
        stage('Deploy'){
        agent {label 'dock1'}
            steps {
                sh "docker stop dock1 | true"
                sh "docker rm dock1 | true"
                sh "docker run --name dock1 -d -p 80:80 erikaerdts/dock1"
            }
}
}
