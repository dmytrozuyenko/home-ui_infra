pipeline {
  agent any
  tools {
    terraform 'terraform'
  }
  stages {
    stage('init') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'aws-auth', passwordVariable: 'aws_secret', usernameVariable: 'aws_access')]) {
          sh "echo 'access_key = \"${aws_access}\"\nsecret_key = \"${aws_secret}\"' > terraform.tfvars"
        }
        sh "terraform init -input=false"
      }
    }

    stage('destroy') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh "terraform destroy --auto-approve -no-color"
        }
      }  
    }
  
    stage('apply') {
      steps {
        sh "terraform apply --auto-approve -no-color"
        sh "terraform output home-ui | tr -d \'\"\' >> ./ansible/hosts"
        sh "cat ./ansible/hosts"
//         sh "echo '[webservers]\n' > /etc/ansible/hosts"
//         sh "terraform output home-ui | tr -d \'\"\' >> /etc/ansible/hosts"
      }
    }
    
    stage('config') {
      steps {
//         ansiblePlaybook credentialsId: 'aws-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/ansible/hosts', playbook: '/ansible/playbook.yml'
        sh "ansible-playbook -i ./ansible/hosts ./ansible/playbook.yml"
      }
    }  
  }
}
