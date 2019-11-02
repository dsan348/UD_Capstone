pipeline {
     agent any
     stages {
         stage ('Lint HTML') {
             steps {
                 sh 'echo "Linting HTML files"'
                 sh 'tidy -q -e *.html'
             }
         }
         //stage ('Upload to AWS') {
             //steps {
                  //withAWS(credentials: 'aws-static', region: 'us-west-2') {
                      //s3Upload bucket: 'proj4', file: 'index.html'
                  }          
            }
        }
    }
}
