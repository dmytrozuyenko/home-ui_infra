pipeline {
  agent any
  tools {
    terraform "terraform"
  }
  stages {
    stage('terraform') {
      steps {
        sh "cp /var/lib/jenkins/userContent/terraform/main.tf ./"
        sh "terraform init -input=false"
        sh "terraform apply -auto-approve"
        withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_access', usernameVariable: 'aws_secret')]) {
          sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
        }
        
      }
    }
  }
}
