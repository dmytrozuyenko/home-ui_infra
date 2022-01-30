pipeline {
  agent any
  tools {
    terraform 'terraform'
  }
  stages {
    stage('terraform') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_secret', usernameVariable: 'aws_access')]) {
          sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
        }
        sh "terraform destroy --auto-approve"
      }
    }

    stage('terraform') {
      steps {
        sh "terraform init -input=false"
//         withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_secret', usernameVariable: 'aws_access')]) {
//           sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
//          }
        sh "terraform apply --auto-approve"
      }
    }
  }
}
