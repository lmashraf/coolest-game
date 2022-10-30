job('seed_jobs') {
    scm {
        // Alternatives in handling credentials in a better manner:
        // https://github.com/jenkinsci/job-dsl-plugin/blob/master/docs/Handling-Credentials.md
        git {
            remote {
                url('https://${personal_token}/lmashraf/coolest-game-jobs-dsl/')
            }
            branch('main')
        }
    }
    steps {
        dsl {
            external('*.groovy')
        }
    }
}