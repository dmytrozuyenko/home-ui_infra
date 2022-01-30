pipeline {
  agent any
//   tools {
//     terraform 'terraform'
//   }
  stages {
    stage('terraform') {
      steps {
        sh "/usr/local/bin/terraform --version"
//         withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_secret', usernameVariable: 'aws_access')]) {
//           sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
//         sh "terraform init -input=false"
//         sh "terraform apply -input=false -auto-approve"
//         }
//         sh ('terraform init') 
//         sh ('terraform apply --auto-approve')
      }
    }
  }
}
