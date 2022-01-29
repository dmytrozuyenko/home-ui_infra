pipeline {
  agent any
  tools {
    terraform 'terraform'
  }
  stages {
    stage('terraform') {
      steps {
        sh "cp /var/lib/jenkins/userContent/terraform/main.tf ."
        withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_secret', usernameVariable: 'aws_access')]) {
          sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
        sh "./terraform init -input=false"
        sh "./terraform apply -input=false -auto-approve"
        }
      }
    }
  }
}
