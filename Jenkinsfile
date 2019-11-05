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
          
          stage ('Build Docker Image & Push To Dockerhub') {
			steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'DockerCluster', transfers:\
                 [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker version', execTimeout: 120000,\
                  flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+'\
                  , remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: ''),\
                   sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker images', execTimeout: 120000,\
                    flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+',\
                     remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')],\
                      usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false), sshPublisher(publishers: [sshPublisherDesc(configName: 'DockerCluster', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ls -a', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/home/docker/capstone', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile, index.html')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])}
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

