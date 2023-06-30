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
            script {
                docker.image('erikaerdts/dock1).withRun('-d -p 80:80' )
            }
}
}
}
