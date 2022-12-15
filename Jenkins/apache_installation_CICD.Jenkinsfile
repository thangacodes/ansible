pipeline {
    agent any
    tools {
    terraform 'TF_VERSION'
    }
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
		stage('User Input on APACHE_DEPLOY'){
		    steps{
			    input 'Do you want to proceed? If yes, please select Proceed or Abort?'
			}
		}
        stage('APACHE_INSTALLATION') {
            steps{
                sh '''
				   cd ansible-playbooks/apache-jenkins
				   sudo ansible-playbook apache_install.yml --extra-vars "ansible_ssh_user=ec2-user ansible_ssh_pass=login1-2"
				'''
            }
        }
		stage('User Input on APACHE_DESTROY'){
		    steps{
			    input 'Do you want to proceed? If yes, please select Proceed or Abort?'
			}
		}
		stage('APACHE_REMOVAL') {
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
