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
                            emailext body: 'Link to JOB $BUILD_URL', recipientProviders: [requestor()], subject: 'FAILURE BUILD: $BUILD_TAG'
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
                        // deploy through ansible
                    }
                    post{
                        always{
                            junit '**/target/surefire-reports/*.xml'
                        }
                        success{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'SUCCESSFUL BUILD: $BUILD_TAG', to: 'kvasalakis@athtech.gr','imanoloudis@athetech.gr','xskarlou@athtech.gr','azacharakis@athtech.gr'
                        }
                        failure{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'FAILURE BUILD: $BUILD_TAG', to: 'kvasalakis@athtech.gr','imanoloudis@athetech.gr','xskarlou@athtech.gr','azacharakis@athtech.gr'
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
                        // deploy through ansible
                    }
                    post{
                        always{
                            junit '**/target/surefire-reports/*.xml'
                        }
                        success{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'SUCCESSFUL BUILD: $BUILD_TAG', to: 'kvasalakis@athtech.gr','imanoloudis@athetech.gr','xskarlou@athtech.gr','azacharakis@athtech.gr'
                        }
                        failure{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'FAILURE BUILD: $BUILD_TAG', to: 'kvasalakis@athtech.gr','imanoloudis@athetech.gr','xskarlou@athtech.gr','azacharakis@athtech.gr'
                        }  
                    }
                }
            }
        }
    }
}