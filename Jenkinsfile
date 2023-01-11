pipeline {
    agent any
    parameters {
        string(name: 'environment', description: 'If you dont set any env, it will be set as dev')
        string(name: 'app_name', description: 'The app name you are deploying.')
        string(name: 'user', description: "Insert your IAM user.")
        string(name: 'queue_name', description: 'Define the queue name.')
        string(name: 'retention_period',  description: 'How long the queue should retain the message before be consumed - Default is 7 days (10080).')
        string(name: 'visibility_timeout', description: 'Should the message wait for a while before entering the queue to be consumed - Default is 0.')
    }
    stages {
        stage('Create app resources') {
            // Set AWS environment

            steps {
                // // script { }
                sh '''
                cd terraform/pipeline1 && /var/jenkins_home/terraform init && \\
                /var/jenkins_home/terraform apply && \\
                -var \'environment=${params.environment}\' \\
                -var \'app_name=${params.app_name}\' \\
                -var \'user=${params.user}\' \\ 
                -var \'queue_name=${params.queue_name}\' \\
                -var \'message_retention_seconds=${params.retention_period}\' \\
                -var \'visibility_timeout_seconds=${params.visibility_timeout}\' \\
                --auto-approve
                '''
            }
        }
        // stage('Deploy NGINX') {
        //     steps {
        //         // k8s command
        //         }
        //     post {
        //         success {
        //             script {
        //             }
        //         }
        //         failure {
        //         }
        //     }
        // }
    }
}
