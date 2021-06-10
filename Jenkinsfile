pipeline{
    agent any
    tools{
        maven "maven-3.6.1"
    }
    enviroment{
        DOCKERHUB_CREDENTIALS = credentials('docker_cred')
        //VMSSH_CREDS = credentials('vm_ssh')
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
                stage("Build Image"){
                    steps{
                        sh "docker build . -t team6hub/team6repo:team6tag -f /var/lib/jenkins/workspace/ProjectFutureTeam6_development/Dockerfile"
                        //img = docker.build("team6hub/team6repo:team6tag", '-f /var/lib/jenkins/workspace/ProjectFutureTeam6_development/Dockerfile')

                    }
                }
                stage("Login to Dcoker HUB"){
                    steps{
                        sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                    }
                }
                stage("Push image to cloude"){
                    steps{
                       sh "docker push team6hub/team6repo:team6tag"
                    }
                }
                stage("Invoke playbook"){
                        steps{
                            ansiblePlaybook( 
                            playbook: '/home/pf-team-6/project/ProjectFutureTeam6/test.yml',
                            inventory: '/etc/ansible/hosts',
                            credentialsId: 'vm_ssh')
                            //hostKeyChecking: false) 
                        }
                }
            }
        }
        post{
            always{
                sh "docker logout"
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
                stage("Build Image"){
                    steps{
                        sh "docker build . -t team6hub/team6repo:team6tag -f /var/lib/jenkins/workspace/ProjectFutureTeam6_development/Dockerfile"
                    }
                }
                stage("Login to Dcoker HUB"){
                    steps{
                        sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                    }
                }
                stage("Push image to cloude"){
                    steps{
                        sh "docker push team6hub/team6repo:team6tag"
                    }
                }
                stage("Invoke playbook"){
                    steps{
                            ansiblePlaybook( 
                            playbook: '/home/pf-team-6/project/ProjectFutureTeam6/test.yml',
                            inventory: '/etc/ansible/hosts',
                            credentialsId: 'vm_ssh')
                            //hostKeyChecking: false)
                    }
                }
            }
        }
        post{
            always{
                sh "docker logout"
            }
        }
    }
}