pipeline {
    environment {
        USER_NAME = "wwazam"
        CONTAINER_NAME = "static-website"
        IMAGE_NAME = "${USER_NAME}/${CONTAINER_NAME}"
        IMAGE_TAG = "${BUILD_TAG}"
        IMAGE_NAME_FULL = "${IMAGE_NAME}:${IMAGE_TAG}"
        STAGING = "bpa-staging"
        PRODUCTION = "bpa-production"
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
                sh 'curl http://3.239.248.143 | grep -q "A FULLY RESPONSIVE SITE TEMPLATE DESIGNED BY HTML5 UP AND RELEASED FOR FREE UNDER THE CREATIVE COMMONS LICENSE."'
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
                echo 'in push'
            }
        }
    }
}
