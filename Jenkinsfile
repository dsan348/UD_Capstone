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
                 sh 'd=`date +%y%m%d%H%M%S`'
                  }          
            }
          
          stage ('Build Docker Image & Push To Dockerhub') {
			steps {
               sshPublisher(publishers: [sshPublisherDesc(configName: 'DockerCluster', transfers: [sshTransfer(cleanRemote: false, excludes: '',\
                execCommand: 'docker build -t denisan348/revolveimg:blue .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false,\
                 patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile, index.html'),\
                  sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker push denisan348/revolveimg', execTimeout: 120000, flatten: false,\
                   makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '',\
                    sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                    }
			}
		

            stage('EKS Publish App') {
                        steps {
                            sshPublisher(publishers: [sshPublisherDesc(configName: 'K8s_Cluster', transfers:\
                 [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'kubectl create deployment capstone-app --image=denisan348/revolveimg:blue', execTimeout: 120000,\
                  flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+'\
                  , remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: ''),\
                   sshTransfer(cleanRemote: false, excludes: '', execCommand: 'kubectl expose deployment capstone-app --type=LoadBalancer --port=8080 --target-port=80', execTimeout: 120000,\
                    flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+',\
                     remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')],\
                      usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                        }
                    }


        }
}
