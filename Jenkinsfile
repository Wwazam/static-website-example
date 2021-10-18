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
                sh 'docker run --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_NAME_FULL}'
            }
        }
        stage("test"){
            agent any
            steps {
                echo 'in test'
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
