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
        stage('Set environment') {
            steps {
                try {
  //     withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '05a66d99-e9e2-4059-af9c-d8d4334f77d9',
  //     usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
  //       sh(returnStdout: true, script: ' ' + deploy + ' -project ' + project + ' -jira ' + jiraTag + ' -build-env stg -vault-host $VAULT_HOST_EXTERNAL -vault-user $USERNAME -vault-pw $PASSWORD')
  //    }
  //     def db = jiraTag.replace("-", "_")
  //     sh("docker run --network host --env-file unit_test.env --entrypoint /srv/root/tests/run_tests.sh ${project}:${gitCommit} --plat ${db} --build_number ${env.BUILD_NUMBER} --dishwasher_host ${env.DISHWASHER_HOST} --staging_db_host ${env.STAGING_DB_HOST} --vault_host ${env.VAULT_HOST_EXTERNAL}")
  //   } catch (e) {
  //     currentBuild.result = "FAILED"
  //     notifyFailure()
  //     throw e
            }
        }
        stage('Create app resources') {
            // Set AWS environment
            steps {
                // // script { }
                withAWS(credentials: 'aws_personal') {
                    sh """
                    printf ${params.queue_name} && \\
                    cd terraform/pipeline1 && /var/jenkins_home/terraform init && \\
                    /var/jenkins_home/terraform apply && \\
                    -var \'environment=${params.environment}\' \\
                    -var \'app_name=${params.app_name}\' \\
                    -var \'user=${params.user}\' \\ 
                    -var \'queue_name=${params.queue_name}\' \\
                    -var \'message_retention_seconds=${params.retention_period}\' \\
                    -var \'visibility_timeout_seconds=${params.visibility_timeout}\' \\
                    --auto-approve
                    """
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
