pipeline {
    agent any
    triggers {
        cron('14 21 * * *')
    }
stages {
    stage('build') {
  steps {
    echo 'Building...'
  }
}
    stage ('test'){
        steps {
            echo 'Running unit tests'
            sh 'python3 main.py'
        }
    }
    stage ('push_to_preprod'){
            when { 
                triggeredBy 'TimerTrigger' 
            }
        steps {
            echo 'Pushing development version to predprod branch'
            sh 'git fetch https://"Nradionenko":"${GIT_PASSWORD}"@github.com/"Nradionenko"/DQE_cicd.git'
            sh 'git checkout develop'
            sh 'git merge origin/preprod'
            sh 'git checkout preprod'
            sh 'git merge develop'
            sh 'git push https://"Nradionenko":"${GIT_PASSWORD}"@github.com/"Nradionenko"/DQE_cicd.git preprod'
        }
    }    
}
}
