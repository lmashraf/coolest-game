pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        }
    }
    parameters {
        string(defaultValue: 'all', description: 'Targets intended to be built (all | game | test)', name: 'build_target')
        string(defaultValue: 'Debug', description: 'Selected build type (Debug | Release).', name: 'build_type')
        string(defaultValue: 'build', description: 'Build folder where binaries will be stored at the end.', name: 'build_dir')
    }
    stages {
        stage('Build')
        {
            steps
            {
                sh "./build.sh -t $build_target -d $build_dir -b $build_type"
            }
            post {
                success {
                    archiveArtifacts artifacts: '**/CoolestGame_*', fingerprint: true
                }
            }
        }
        stage('Test')
        {
            steps
            {
                sh "./$build_dir/game/test/CoolestGame_test --gtest_output=xml"
            }
        }
    }
}