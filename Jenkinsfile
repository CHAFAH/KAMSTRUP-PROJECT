pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/CHAFAH/KAMSTRUP-PROJECT.git'
            }
        }

        stage('Maven Clean Package') {
            steps {
                script {
                    def mavenHome = tool name: "Maven-3.9.3", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package"
                }
            }
        }
        stage('UPLOAD ARTIFACTS') {
            steps {
                script {
                    def mavenHome = tool name: "Maven-3.9.3", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} deploy"
                }
            }
        }
        stage('Code Check') {
            steps {
                sh 'mvn sonar:sonar'
            }
        }
      
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t chafah/springapp:v10 .'
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'docker push chafah/springapp:v10'
                    }
                }
            }
        }

        stage('REMOVE DOCKER IMAGE') {
            steps {
                sh 'docker rmi &(docker images -q)'
            }
        }

        stage("Deploy Application") {
            steps {
                sh "kubectl apply -f springapp.yaml"
            }
        }
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-2"
    }
}
