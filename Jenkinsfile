pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
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
               sh "terraform plan"
                // sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
       / *
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }
         * /
           /* steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
                      }
          */
       }

        stage('Apply') {
            steps {
                // sh "terraform apply -input=false tfplan"
                sh ' terraform apply'
            }
        }
    }

  }
