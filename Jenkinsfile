pipeline {
agent any
stages {
    stage('build') {
  steps {
    echo 'Building.'
  }
}
    stage ('test'){
        steps {
            echo 'Running unit tests'
            sh 'python3 main.py'
        }
    }
    stage ('push_to_preprod'){
        steps {
            echo 'Pushing development version to predprod branch'
            sh 'git fetch https://"$GIT_USER":"${GIT_PASSWORD}"@github.com/"$GIT_USER"/DQE_cicd.git'
            sh 'git checkout develop'
            sh 'git merge origin/preprod'
            sh 'git checkout preprod'
            sh 'git merge develop'
            sh 'git push https://"$GIT_USER":"${GIT_PASSWORD}"@github.com/"$GIT_USER"/DQE_cicd.git preprod'
        }
    }    
}
}
