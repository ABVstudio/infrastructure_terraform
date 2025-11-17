pipeline {
    agent {
         node {
          label 'udh-1'
       }
    }
    
    environment {
        Name_inf   = 'infrastructure_terraform'
        URL_inf    = 'git@github.com:ABVstudio/infrastructure_terraform.git'
    }

    stages {
        stage('download') {
            steps {
                sh "if [ -d ${Name_inf} ]; then cd ${Name_inf} && git pull ;else git clone ${URL_inf}; fi"
            }
        }
        stage('init') {
            steps {
                sh "cd ${Name_inf} && terraform init"
            }
        }
        stage('plan') {
            steps {
                sh "cd ${Name_inf} && terraform plan"
            }
        }
        stage('apply') {
            steps {
                sh "cd ${Name_inf} && terraform apply -auto-approve"
            }
        }
    }
}
