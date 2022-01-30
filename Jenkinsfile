pipeline {
  agent any
  tools {
    terraform 'terraform-1.1.4'
  }
  stages {
    stage('terraform') {
      steps {
        sh "terraform --version"
        sh "terraform init -input=false"
//         sh "/usr/local/bin/terraform --version"
//         sh "/usr/local/bin/terraform init"
        withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_secret', usernameVariable: 'aws_access')]) {
          sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
//         sh "terraform init -input=false"
//         sh "terraform apply -input=false -auto-approve"
         }
//         sh ('terraform init') 
        sh "terraform apply --auto-approve"
      }
    }
  }
}
