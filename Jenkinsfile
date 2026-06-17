pipeline {
    agent any

    environment {
        APP_SERVER = '10.0.1.195'
        APP_USER = 'ubuntu'
        APP_DIR = '/opt/SpringBoot-Jenkins-Demo'
        SERVICE_NAME = 'SpringBoot-Jenkins-Demo'
        JAR_NAME = 'demo.jar'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/HemangiSA/Java-application-deploy-Jenkins-Repo.git'
            }
        }

        stage('Build Java App') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Check JAR File') {
            steps {
                sh 'ls -lh target/*.jar'
            }
        }

        stage('Deploy to App EC2') {
            steps {
                sshagent(credentials: ['app-server-ssh']) {
                    sh '''
                        echo "Copying jar to app server..."
                        scp -o StrictHostKeyChecking=no target/*.jar $APP_USER@$APP_SERVER:/tmp/$JAR_NAME

                        echo "Moving jar and restarting service..."
                        ssh -o StrictHostKeyChecking=no $APP_USER@$APP_SERVER "
                            sudo mkdir -p $APP_DIR &&
                            sudo mv /tmp/$JAR_NAME $APP_DIR/$JAR_NAME &&
                            sudo chown ubuntu:ubuntu $APP_DIR/$JAR_NAME &&
                            sudo systemctl daemon-reload &&
                            sudo systemctl restart $SERVICE_NAME &&
                            sudo systemctl status $SERVICE_NAME --no-pager
                        "
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed. Check Jenkins console logs.'
        }
    }
}