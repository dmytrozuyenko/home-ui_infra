pipeline {
  agent any
  tools {
    terraform "terraform"
  }
  stages {
    stage('terraform') {
      steps {
        sh 'terraform init'
        sh "terraform apply -target=/var/lib/jenkins/userContent/terraform/main.tf -auto-approve"
        withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_access', usernameVariable: 'aws_secret')]) {
          sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
        }
        
      }
    }
  }
}
