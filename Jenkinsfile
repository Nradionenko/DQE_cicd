pipeline {
    agent any
    environment {
        def BUILDVERSION = sh(script: 'date +%Y-%m-%d_%H-%M-%S', returnStdout: true).trim()
    }
    stages {
        stage('build') {
            steps {
                echo 'Building...'
            }
        }
        stage('create-release-branch') {
            steps {
                sh 'git init'
                sh 'git checkout -b release-"${BUILDVERSION}" origin/develop'
                sh 'git pull https://"Nradionenko":"${GIT_PASSWORD}"@github.com/"Nradionenko"/cicd_merge_to_release.git develop'
                sh 'git push https://"Nradionenko":"${GIT_PASSWORD}"@github.com/"Nradionenko"/cicd_merge_to_release.git release-"${BUILDVERSION}"'
                
            }
        }
    }
}
