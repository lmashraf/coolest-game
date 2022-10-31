# Summary

A small project to showcase build and test automation of a C++ project using Cmake/gtest with a Jenkins (jcasc) dockerized solution.

# Prerequisites:
- docker (version: 20.10.21+)
- cmake (version: 3.10.2+)
- g++ (version: 7.5.0+)

`sudo apt update && sudo apt install build-essentials g++ cmake python2 docker-engine`

For detailed docker installation see: https://docs.docker.com/engine/install/ubuntu/

- Set Github personal token to read from the repositories

`export git_token="###"`

NOTE: The GitHub personal token shall be used to access this GitHub repository inside the jobs and will be provided separately.

# How To Build and Run Locally
## Build
Either clone the repository `https://github.com/lmashraf/coolest-game` or get the sources from the provided zip file. Then simply run the following script:

 `./build.sh -b [game | test | all] -d <build_directory> -t [Debug | Release]`

eg. : `./build.sh -t all -d build -b Debug` for help, run `./build.sh -h`

Based on the command shown on the example above, the build and test binaries shall be generated inside the `build/game` and `build/game/test/` folders respectively.

## Run
- Run executables: `./build/game/CoolestGame_run`
- Run tests: `./build/game/CoolestGame_test`

![test execution](https://github.com/lmashraf/coolest-game/blob/master/docs/0_local_test_execution.jpg?raw=true)

# How To Run on Jenkins
## Start the Jenkins Container
The project contains two subfolders for CI :
- `jenkins`: a folder that has all jenkins configuration presets such as JCASC file configuration, jenkins plugins and seed_job script as well as a few scripts to spin up the Jenkins instance.
- `pipelines`: a folder with the Jenkinsfile pipeline scripts that shall run inside the generated jobs

1. From inside the `jenkins` folder, simply run `./run_jenkins.sh`.
2. Optionally: While the Jenkins instance is up and running, execute `./fix_docker_permissions.sh` to fix permission issues related to docker inside the Jenkins container.
3. The Jenkins instance starts on `https://localhost:8080` with the admin credentials defined in the Dockerfile `(admin:p@55w0rd)`

![login](https://github.com/lmashraf/coolest-game/blob/master/docs/1_jenkins_login.jpg?raw=true)

## Build and Test on Jenkins
4. Run the seed_jobs for the first time.

![seed jobs](https://github.com/lmashraf/coolest-game/blob/master/docs/2_seed_job.jpg?raw=true)

5. then go to `Manage Jenkins > Security > In-process Script Approval`  and approve both jobs' scripts.

![script approval](https://github.com/lmashraf/coolest-game/blob/master/docs/3_script_approval.jpg?raw=true)

![script approval](https://github.com/lmashraf/coolest-game/blob/master/docs/4_script_approval.jpg?raw=true)

![script approval](https://github.com/lmashraf/coolest-game/blob/master/docs/5_script_approval.jpg?raw=true)

6. Rerun the seed_jobs to generate our 2 pipeline jobs.

![script approval](https://github.com/lmashraf/coolest-game/blob/master/docs/6_jobs_generation.jpg?raw=true)

7. Run any of the build jobs as necessary (Release or Debug).

![script approval](https://github.com/lmashraf/coolest-game/blob/master/docs/7_jobs_execution.jpg?raw=true)
