pipeline {
    agent any
	environment {
        def BUILDVERSION = sh(script: 'date +%Y-%m-%d_%H:%M:%S', returnStdout: true).trim()
    }
    triggers {
        cron('30 1 1,15 * *')
    }
stages {
    stage('Build') {
  steps {
    echo 'Building...'
  }
}
    stage ('Test'){
        steps {
            echo 'Running unit tests'
            sh 'python3 main.py'
        }
    }
    stage ('Release to preprod'){
            when { 
                triggeredBy 'TimerTrigger' 
            }
            steps {
                sh 'git init'
                sh 'git checkout -b release-"${BUILDVERSION}" origin/develop'
                sh 'git pull https://"Nradionenko":"${GIT_PASSWORD}"@github.com/"Nradionenko"/cicd_merge_to_release.git develop'
                sh 'git push https://"Nradionenko":"${GIT_PASSWORD}"@github.com/"Nradionenko"/cicd_merge_to_release.git release-"${BUILDVERSION}"'
                
            }
    }    
}
}
