pipeline {
    agent {
        dockerfile true
    }
    environment {
        BUILD_DIR = 'build/'
        BUILD_TYPE = 'Debug'
        BUILD_TARGET = 'all'
    }
    stages {
        stage('Build')
        {
            steps
            {
                sh './build.sh -t ${BUILD_TARGET} -d ${BUILD_DIR} -b ${BUILD_TYPE}'
            }
        }
        stage('Test')
        {
            steps
            {
                sh './${BUILD_DIR}/game/test/CoolestGame_test --gtest_output=xml'
            }

        }
    }
}