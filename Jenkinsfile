pipeline {
     agent any
     stages {
         stage ('Lint HTML') {
             steps {
                 sh 'echo "Linting HTML files"'
                 sh 'tidy -q -e *.html'
             }
         }
         
         stage ('Lint Dockerfile') {
             steps {
                 sh 'echo "linting Dockerfile"'
                 sh 'pwd'
                 sh '/home/linuxbrew/.linuxbrew/bin/hadolint Dockerfile'
                 sh 'ls -a'
                  }          
            }
          
          stage('Build Docker Image & Push To Dockerhub') {
			steps {
				withCredentials([sshUserPrivateKey(credentialsId: 'Docker_Swarm', keyFileVariable: 'DKRKFV', passphraseVariable: 'DKPF', usernameVariable: 'DKUSR')]){
					sh '''
						ssh -tti "DKPF" $DKUSR@ec2-35-163-227-4.us-west-2.compute.amazonaws.com 
                        exec pwd
                        exec ls -al
                       '''
				}
			}
		}

            //stage('EKS Publish App') {
                        //steps {
                            //withCredentials([sshUserPrivateKey(credentialsId: 'AWS_K8s_Cluster', keyFileVariable: 'K8KFV', passphraseVariable: '', usernameVariable: 'K8SUSR')]){
                                //sh '''
                                //
                                //    kubectl get svc
                              //  '''
                            //}
                        //}
                    //}


        }
    }
