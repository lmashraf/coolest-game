job('seed_jobs') {
    /*scm {
        // Alternatives in handling credentials in a better manner:
        // https://github.com/jenkinsci/job-dsl-plugin/blob/master/docs/Handling-Credentials.md
        git {
            remote {
                url('https://${personal_token}:/lmashraf/coolest-game-jobs-dsl/')
            }
            branch('main')
        }
    }*/
    steps {
        // Clone jobs
        shell('''
            wget https://github.com/lmashraf/coolest-game-jobs-dsl/archive/master.zip
            unzip master.zip -d jobs/
            ''')
        dsl {
            external('jobs/**/*.groovy')
        }
    }
}