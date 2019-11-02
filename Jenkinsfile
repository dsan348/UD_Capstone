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
                 sh 'rm -rf /home/ubuntu/UD_Capstone/'
                 sh 'git clone https://github.com/dsan348/UD_Capstone /home/ubuntu/'
                  }          
            }
        }
    }
