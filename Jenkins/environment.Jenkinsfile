pipeline{
  agent any
  environment{
      TOMCAT_IP   = "172.31.37.168"
	  TOMCAT_USER = "ec2-user"
	}
	stages{
	   stage("Deploy"){
	      steps{
		     echo "We are deploying to ${env.TOMCAT_IP} using user ${env.TOMCAT_USER}"
			}
		}
		stage("if job success"){
		   steps{
		      sh 'git --version'
			}
	    }
		stage("if job failed"){
		   steps{
		      sh 'durai --version'
			}
		}
	}
	post {
     failure {
     echo "Job is failure.Sending an email to the SCM team"
    }
	success {
	  echo "Job is succeed.Sending an email to the SCM team"
    }
  }
}
