# jenkins-git-sync

A jenkins docker container which uses a config from a remote repository to start a jenkins server.

## How to use

1. Copy the docker-compose.yml.dist to docker-compose.yml
1. Define the JENKINS_CONFIG_BRANCH and JENKINS_CONFIG_REPOSITORY in the docker-compose.yml
1. (Optional) Use the jenkins-config/plugins.txt to set plugins which are needed for the jenkins configuration. They will be downloaded in the process using the jenkins container.
1. (Optional) Put a .ssh/ folder beneath jenkins-config/ which will be copied into the jenkins home directory before getting the remote git repository.
1. Start the container
```bash
docker-compose up
```
1. Visit jenkins http://localhost:8080/

It creates a volume for the /var/jenkins_home folder.
The volume remains if you use "docker-compose down".

### Updating the Container

```bash
docker-compose down
docker-compose build
docker-compose up
```

### Create a custom plugins.txt

1. Visit $jenkins-url/script
2. Paste in and execute
```groovy
Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("${plugin.getShortName()}:${plugin.getVersion()}")
}
```
3. Copy and paste output to jenkins-config/plugins.txt

## Contribution

The bash-scripts are written in bash and use best pratices.

* Guide: https://github.com/progrium/bashstyle
* Linter: https://github.com/koalaman/shellcheck
* Beautifier: https://github.com/bemeurer/beautysh

It should pass:
```bash
$ shellcheck scripts/*
$ beautysh -f scripts/*
```
