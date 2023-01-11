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
            
            steps {
                // // script { }
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key',
                usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    
                    script {
                        queue_endpoint = sh(returnStdout: true, script: "/var/jenkins_home/terraform output queue_url").trim()
                        echo queue_endpoint
                    }
                }
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
