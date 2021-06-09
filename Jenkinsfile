pipeline{
    agent any
    tools{
        maven "maven-3.6.1"
    }
    stages{
        stage("Pr branches"){
            when{
                branch 'PR**'
            }
            stages{
                stage("Compile"){
                    steps{
                        sh "mvn clean compile"
                    }
                }
                stage("Testing"){
                    steps{
                        sh "mvn test"
                    }
                    post{
                        always{
                            junit '**/target/surefire-reports/*.xml'
                        }
                        failure{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'FAILURE BUILD: $BUILD_TAG', recipientProviders: [$class: 'DevelopersRecipientProvider']
                        }  
                    }
                }    
            }
        }
        stage("Development branch"){
            when{
                branch 'development'
            }
            stages{
                stage("Package the application"){
                    steps{
                        sh "mvn clean package"
                    }
                    post{
                        always{
                            junit '**/target/surefire-reports/*.xml'
                        }
                        success{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'SUCCESSFUL BUILD: $BUILD_TAG', to: '$DEFAULT_RECIPIENTS'
                        }
                        failure{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'FAILURE BUILD: $BUILD_TAG', to: '$DEFAULT_RECIPIENTS'
                        }  
                    }
                }
                stage("Invoke playbook"){
                    withEnv(["PATH+ANSIBLE"=${tool 'Ansible'}]){
                        ansiColor('xterm') {
                            ansiblePlaybook( 
                            playbook: '~/project/ProjectFutureTeam6/test.yml',
                            inventory: '/etc/ansible/hosts', 
                            //credentialsId: 'sample-ssh-key',
                            colorized: true) 
                        }
                    }
                }
            }
        }
        stage("Production branch"){
            when{
                branch 'production'
            }
            stages{
                stage("Package the application"){
                    steps{
                        sh "mvn clean package"
                    }
                    post{
                        always{
                            junit '**/target/surefire-reports/*.xml'
                        }
                        success{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'SUCCESSFUL BUILD: $BUILD_TAG', to: '$DEFAULT_RECIPIENTS'
                        }
                        failure{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'FAILURE BUILD: $BUILD_TAG', to: '$DEFAULT_RECIPIENTS'
                        }  
                    }
                }
                stage("Invoke playbook"){
                    withEnv(["PATH+ANSIBLE"=${tool 'Ansible'}]){
                        ansiColor('xterm') {
                            ansiblePlaybook( 
                            playbook: '~/project/ProjectFutureTeam6/test.yml',
                            inventory: '/etc/ansible/hosts', 
                            //credentialsId: 'sample-ssh-key',
                            colorized: true) 
                        }
                    }
                }
            }
        }
    }
}