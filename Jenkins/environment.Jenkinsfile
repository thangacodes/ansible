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
	    }
       }
