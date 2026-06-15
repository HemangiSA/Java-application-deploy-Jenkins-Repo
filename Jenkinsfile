pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x mvnw || true'
                sh './mvnw clean package'
            }
        }

        stage('Show Jar') {
            steps {
                sh 'ls -la target'
            }
        }

        stage('Archive Jar') {
            steps {
                archiveArtifacts artifacts: 'target/demo.jar', fingerprint: true
            }
        }
    }
}
