pipeline {
    environment {
        USER_NAME = "wwazam"
        CONTAINER_NAME = "static-website"
        IMAGE_NAME = "${USER_NAME}/${CONTAINER_NAME}"
        IMAGE_TAG = "${BUILD_TAG}"
        IMAGE_NAME_FULL = "${IMAGE_NAME}:${IMAGE_TAG}"
        IP_ADDR = "3.239.248.143"
    }

    agent none

    stages {
        stage("build"){
            agent any
            steps {
                sh 'docker build -t ${IMAGE_NAME_FULL} .'
            }
        }
        stage("run"){
            agent any
            steps {
                sh 'docker rm -f ${CONTAINER_NAME} || true'
                sh 'docker run -d --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_NAME_FULL}'
            }
        }
        stage("test"){
            agent any
            steps {
                sh 'curl http://${IP_ADDR} | grep -qi "A FULLY RESPONSIVE SITE"'
            }
        }
        stage("stop"){
            agent any
            steps {
                sh 'docker stop ${CONTAINER_NAME}'
            }
        }
        stage("push"){
            agent any
            steps {
                script {
                    node {
                        withCredentials([usernamePassword(credentialsId: 'dockerhub_pw',usernameVariable:'USERNAME', passwordVariable: 'PASSWORD')]) {
                            sh '''
                                docker login -u ${USER_NAME} -p ${PASSWORD}
                                docker image push ${IMAGE_NAME_FULL}
                            '''
                        }
                    }
                }
            }
        }
    }
}
