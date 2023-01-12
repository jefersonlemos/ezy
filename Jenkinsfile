pipeline {
    agent any
    parameters {
        string(name: 'environment', description: 'If you dont set any env, it will be set as dev')
        string(name: 'app_name', description: 'The app name you are deploying.')
        string(name: 'user', description: "Insert your IAM user.")
        string(name: 'queue_name', description: 'Define the queue name.')
        string(name: 'bucket_name', description: 'Define the queue name.')
        string(name: 'retention_period',  description: 'How long the queue should retain the message before be consumed - Default is 7 days (10080).')
        string(name: 'visibility_timeout', description: 'Should the message wait for a while before entering the queue to be consumed - Default is 0.')
    }
    environment {
        AWS_CREDS = credentials('aws-key')
        AWS_ACCESS_KEY_ID = "${env.AWS_CREDS_USR}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_CREDS_PSW}"  
    }
    stages {
        stage('Create app resources') {
            steps {
                sh """
                    echo "TF" && env && cd terraform/pipeline1 && /var/jenkins_home/terraform init
                """
                    // sh """
                    // echo TF && env && cd terraform/pipeline1 && /var/jenkins_home/terraform init && \\
                    // /var/jenkins_home/terraform apply \\
                    // -var=\'environment=${params.environment}\' \\
                    // -var=\'app_name=${params.app_name}\' \\
                    // -var=\'user=${params.user}\' \\
                    // -var=\'queue_name=${params.queue_name}\' \\
                    // -var=\'bucket_name=${params.bucket_name}\' \\
                    // -var=\'message_retention_seconds=${params.retention_period}\' \\
                    // -var=\'visibility_timeout_seconds=${params.visibility_timeout}\' \\
                    // --auto-approve
                    // """
                    // script {
                    //     def queue_endpoint = sh(returnStdout: true, script: "cd terraform/pipeline1 && /var/jenkins_home/terraform output queue_url").trim()
                    //     // def bucket_endpoint = sh(returnStdout: true, script: "cd terraform/pipeline1 && /var/jenkins_home/terraform output queue_url").trim()
                    // }
                // }
            }
        }
        stage('Deploy NGINX') {
            steps {
                script {
                    def queue_endpoint = sh(returnStdout: true, script: "cd terraform/pipeline1 && /var/jenkins_home/terraform output queue_arn").trim()
                    def bucket_endpoint = sh(returnStdout: true, script: "cd terraform/pipeline1 && /var/jenkins_home/terraform output bucket_arn").trim()
                    def base_file = readYaml file: "k8s/base-deployment.yaml"
                    
                    base_file.spec.template.spec.containers.env[0][0][0].value = queue_endpoint
                    base_file.spec.template.spec.containers.env[0][0][1].value = bucket_endpoint   
                    writeYaml overwrite: true, file: 'k8s/nginx-deployment.yaml', data: base_file
                }
                sh 'cat k8s/nginx-deployment.yaml'
            }
        }
    }
}
