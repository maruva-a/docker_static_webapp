pipeline {
    agent any

    environment {
        APP_NAME = "docker_static_webapp"
        IMAGE_NAME = "docker_static_webapp-web"
        CONTAINER_NAME = "docker_static_webapp-web-1"
        GIT_REPO = "https://github.com/maruva-a/docker_static_webapp.git"
        HOST_PORT = "8081"   // Change if you want a different host port
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: "${GIT_REPO}"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Stop Old Container') {
            steps {
                // Stop and remove old container if it exists
                sh """
                if [ \$(docker ps -aq -f name=${CONTAINER_NAME}) ]; then
                    docker rm -f ${CONTAINER_NAME}
                fi
                """
            }
        }

        stage('Run New Container') {
            steps {
                sh """
                docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:80 ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        success {
            echo "Deployment completed successfully!"
        }
        failure {
            echo "Deployment failed!"
        }
    }
}
