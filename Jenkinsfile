pipeline { 
    agent any 
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-kvs')
	}
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Clone code') { 
            steps {
                git branch: 'master', url: 'https://github.com/kaushik1994/devops-project-1'
            }
        }
        stage('Build'){
            steps {
                sh "docker build . -t 7100071/devops" docker push 7100071/devops:tagname
            }
        }
        stage('Docker Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
        stage('Push on DockerHub'){
            steps{
                sh "docker push 7100071/devops"
            }
        }
        stage('Install Python 3') {
            steps {
               ansiblePlaybook credentialsId: 'server-ansible', installation: 'ansible', inventory: 'servers', playbook: 'install_python-playbook.yml'
            }
        }
         stage('Deploy') {
            steps {
               ansiblePlaybook credentialsId: 'server-ansible', installation: 'ansible', inventory: 'servers', playbook: 'deployment-playbook.yml'
            }
        }
    }
}