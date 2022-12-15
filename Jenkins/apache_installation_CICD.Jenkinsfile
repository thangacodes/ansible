pipeline {
    agent any
    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', url: 'https://github.com/send2durai/shell-scripting.git'
				sh '''
				   cd ansible-playbooks/apache-jenkins
				   pwd
				   ls -lrth
				'''
            }
        }
		stage('User Input on STATIC_WEB_DEPLOYMENT'){
		    steps{
			    input 'Do you want to proceed? If yes, please select Proceed or Abort?'
			}
		}
        stage('STATIC_WEB_DEPLOYMENT') {
            steps{
                sh '''
		      cd ansible-playbooks/apache-jenkins
		       sudo ansible-playbook apache_install.yml --extra-vars "ansible_ssh_user=ec2-user ansible_ssh_pass=login1-2"
		  '''
            }
        }
		stage('CURL REMOTEHOST'){
		    steps{
			    sh '''
				   curl 172.31.2.66:80
				'''
			}
		}
			
		stage('User Input on STATIC_WEB_DEPLOYMENT DELETION'){
		    steps{
			    input 'Do you want to proceed? If yes, please select Proceed or Abort?'
			}
		}
		stage('STATIC_WEB_DEPLOYMENT DELETION') {
            steps{
                sh '''
		     cd ansible-playbooks/apache-jenkins
		      sudo ansible-playbook apache_remove.yml --extra-vars "ansible_ssh_user=ec2-user ansible_ssh_pass=login1-2"
		'''
            }
        }
		stage('Workspace CleanUP'){
		    steps{
			    echo "Going to clean Jenkins Job Workspace"
				cleanWs()
			}
		}
    }    
}
