pipeline {
  agent any
  tools {
    terraform 'terraform'
  }
  stages {
    stage('destroy') {
      steps {
//         withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_secret', usernameVariable: 'aws_access')]) {
//           sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
//         }
        sh "output \"public_ip\" {\ndescription = \"The public IP address\"value = try(aws_instance.this[0].public_ip, aws_spot_instance_request.this[0].public_ip, \"\")\n}" > outputs.tf
        sh "cat outputs.tf"
//         sh "terraform init -input=false"
//         sh "terraform destroy --auto-approve -no-color"
      }
    }

//     stage('apply') {
//       steps {
////         withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_secret', usernameVariable: 'aws_access')]) {
////           sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
////          }
//         sh "terraform apply --auto-approve -no-color"
//       }
//     }
  }
}
