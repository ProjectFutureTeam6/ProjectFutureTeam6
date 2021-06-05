pipeline{
    agent any
    tools{
        maven "maven-3.6.1"
    }
    stages{
        stage("Feature branches"){
            when{
                branch 'F**'
            }
            stages{
                stage("Compile"){
                    steps{
<<<<<<< HEAD
                        sh "mvn clean compile"
=======
                        sh "mvn clean compile"
>>>>>>> 7e647f65078068f45822ed40c31505b5df126c69
                    }
                }
                stage("Testing"){
                    steps{
<<<<<<< HEAD
                        sh "mvn test"
=======
                        sh "mvn test"
>>>>>>> 7e647f65078068f45822ed40c31505b5df126c69
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
        // stage("Main branch"){
        //     when{
        //         branch 'main'
        //     }
        //     stages{
        //         stage("Input message"){
        //             input{
        //                 message "Do you want to deploy?"
        //                 ok "Yes!"
        //                 parameters{
        //                     string(name:'OUTPUT', defaultValue:'',description:"Enter a text")
        //                 }
        //             }
        //             steps{
        //                 echo "The output is: ${OUTPUT}"
        //             }
        //         }
        //         stage("Deployment"){
        //             steps{
        //                 echo "I deployed to production"
        //             }
        //         }
        //     }
        //     post{
        //         success{
        //             mail to:"kostas.vasalakis@hotmail.com",
        //             subject:"SUCCESSFUL BUILD: $BUILD_TAG",
        //             body:"Link to JOB $BUILD_URL"
        //         }
        //         failure{
        //             mail to:"kostas.vasalakis@hotmail.com",
        //             subject:"FAILURE BUILD: $BUILD_TAG",
        //             body:"Link to JOB $BUILD_URL"
        //         }
        //     }
        // }
        stage("Development branch"){
            when{
                branch 'development'
            }
            stages{
                stage("Compile"){
                    steps{
<<<<<<< HEAD
                        sh "mvn clean compile"
=======
                        sh "mvn clean compile"
>>>>>>> 7e647f65078068f45822ed40c31505b5df126c69
                    }
                }
                stage("Package the application"){
                    steps{
                        sh "mvn package -Dmaven.test.skip=true"
                        // deploy through ansible
                    }
                    post{
                        success{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'SUCCESSFUL BUILD: $BUILD_TAG', to:$DEFAULT_RECIPIENTS
                        }
                        failure{
                            emailext body: 'Link to JOB $BUILD_URL', subject: 'FAILURE BUILD: $BUILD_TAG', to:$DEFAULT_RECIPIENTS
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
                stage("Compile"){
                    steps{
<<<<<<< HEAD
                        sh "mvn clean compile"
=======
                        sh "mvn clean compile"
>>>>>>> 7e647f65078068f45822ed40c31505b5df126c69
                    }
                }
                stage("Package the application"){
                    steps{
                        sh "mvn package -Dmaven.test.skip=true"
                        // deploy through ansible
                    }
                }
                // stage("Clean old mvn output"){
                //     steps{
<<<<<<< HEAD
                //         sh "mvn clean"
=======
                //         sh "mvn clean"
>>>>>>> 7e647f65078068f45822ed40c31505b5df126c69
                //     }
                // }
                // stage("Compile"){
                //     steps{
<<<<<<< HEAD
                //         sh "mvn clean compile"
=======
                //         sh "mvn clean compile"
>>>>>>> 7e647f65078068f45822ed40c31505b5df126c69
                //     }
                // }
                // stage("Testing"){
                //     steps{
<<<<<<< HEAD
                //         sh "mvn test"
=======
                //         sh "mvn test"
>>>>>>> 7e647f65078068f45822ed40c31505b5df126c69
                //     }
                //     post{
                //         always{
                //             junit '**/target/surefire-reports/*.xml'
                //         }
                //     }
                // }
            }
        }
    }
}