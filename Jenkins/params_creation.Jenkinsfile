pipeline {
    agent any
	parameters{  
     string defaultValue: 'thangadurai', description: 'Enter the firstname', name: 'firstname'
	 string defaultValue: 'murugan', description: 'Enter the lastname', name: 'lastname'
	}
    stages {
        stage('Parameters using scripted way') {
            steps {
                echo 'Hello Params job'
				echo "Hi ${params.firstname}, ${params.lastname},Welcome"
            }
        }
		stage('Workspace CleanUp'){
		    steps{
			   cleanWs()
			}
		}
	}
}
