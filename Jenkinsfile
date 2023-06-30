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
       stage ('Deploy to Octopus') {
            steps {
                withCredentials([string(credentialsId: 'octopusapi', variable: 'octopusapi')]) {
                    sh """
                    ${tool('Octo CLI')}/Octo push --package target/demo.0.0.1-SNAPSHOT.war --replace-existing --server https://192.168.230.4 --apiKey ${APIKey}
                    ${tool('Octo CLI')}/Octo create-release --project "dock1" --server https://192.168.230.4 --apiKey ${APIKey}
                    ${tool('Octo CLI')}/Octo deploy-release --project "dock1" --version latest --deployto Integration --server https://192.168.230.4 --apiKey ${APIKey}
                    """
                }
            }
}
}
