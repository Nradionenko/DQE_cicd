pipeline {
    agent any
    triggers {
        cron('51 9 * * *')
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
            sh 'git pull'
            sh 'git merge origin/preprod'
            sh 'git checkout preprod'
            sh 'git merge develop'
            sh 'git push https://"Nradionenko":"${GIT_PASSWORD}"@github.com/"Nradionenko"/DQE_cicd.git preprod'
			
        }
	post {
		success {
			build job: 'CICD_homework_preprod_release'
			}
		}
        }
        }
    }    
