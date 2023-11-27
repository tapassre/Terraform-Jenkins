pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

   agent  any
    stages {
        stage('checkout') {
            steps {
                                       
                   git branch: 'main', url: 'https://github.com/tapassre/Terraform-Jenkins.git'
                                       
                }
            }

        stage('Init') {
            steps {
                sh 'terraform init'
                  }
        }

        stage('Plan') {
            steps {
               sh 'terraform plan'
                // sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }

         stage('Apply') {
            steps {
                sh 'terraform apply'
            }
        }
       /*
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }
         */
           /* steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
                      }
          */
       }

       
    }

  
