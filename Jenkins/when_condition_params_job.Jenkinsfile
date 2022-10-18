pipeline {
    agent any
    parameters {
       choice choices: ['DEV', 'CERT', 'STAGE', 'PROD'], description: 'Select the environment to deploy the resources', name: 'selectenv'
    }
	stages{
	    stage("provisioning infra on dev environment"){
		    when{
			  expression{
			    params.selectenv == "DEV"
			   }
			}
			steps{
			   echo "Deploying into Development"
			   sh '''
			      pwd
				  cd ../Infrastructure_provision/vpc-subnet
				  pwd
				  ls -lrth
				  sleep 5
				  terraform init
				  terraform fmt
				  terraform plan
				  terraform apply --auto-approve
			  '''  
		         }
	        }
		stage("provisioning infra on cert environment"){
		    when{
			  expression{
			    params.selectenv == "CERT"
			   }
			}
			steps{
			   echo "Deploying into Certification"
		        }
	}
	stage("provisioning infra on staging environment"){
	    when{
		   expression{
		     params.selectenv == "STAGE"
			}
		   }
		steps{
			   echo "Deploying into staging"
			}
	}
	stage("provisioning infra on prod environment"){
	    when{
		   expression{
		     params.selectenv == "PROD"
			}
		}
		steps{
		    echo "Deploying into production"
		  }
	}
	//stage("Workspace CleanUp"){
		//steps{
		    //echo "Cleaning up the workspace in Jenkins"
			//cleanWs()
		 //}
	    //}
	}
}
