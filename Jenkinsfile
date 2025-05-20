pipeline {
    agent any
    tools {
        maven 'maven'
    }
    environment{
        DOCKERHUB_USERNAME = "manojshetty2021"
    }
    stages {
        stage("clean") {
            steps {
                sh 'mvn clean'
            }
        }
        stage("validate") {
            steps {
                sh 'mvn validate'
            }
        }
        stage("test") {
            steps {
                sh 'mvn test'
            }
        }
        stage("package") {
            steps {
                sh 'mvn package'
            }
            post {
                success {
                    echo "build successfull"
                }
            }
        }
        stage("build docker images") {
            steps {
                sh 'docker build -t netflix .'
            }
            post {
                success{
                    echo "image build successfully"
                }
                failure{
                    echo "image not built"
                }
            }
        }
        stage("push to docker hub"){
            steps{
                script {
                    sh"""
                    echo "Manoj@8310" | docker login -u "manojshetty2021" --Manoj@8310-stdin
                    docker tag netflix ${DOCKERHUB_USERNAME}/netflix
                    docker push ${DOCKERHUB_USERNAME}/netflix
                    """
                }
            }
                
        }
        stage("remove docker image locally"){
            steps{
                sh"""
                docker rmi -f ${DOCKERHUB_USERNAME}/netflix
                docker rmi -f netflix
                """
            }
        }
        stage("stop and restart"){
            steps {
                sh"""
                docker rm -f app
                docker run -it -d --name app -p 8081:8080 ${DOCKERHUB_USERNAME}/netflix
                """
            }
        }
    }
    post {
        success {
            echo "deployemnt successfull"
        }
        failure {
            echo "deployment is failure"
        }
    }
}