# Docker jenkins swarm slave

this images enable running a jenkins slave using the [Jenkins Swarm Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin)

## Details

Distro: ubuntu 14.04
Installes packages:

* git
* subversion
* OpenJDK 1.8.0-96
* NodeJS 4.4.4
* Bower

## Example usage:

* Running with autodiscovery and no authentication

```bash
docker run -it arnobroekhof:jenkins-swarm-slave:latest
```

* Running with the master specified

```bash
docker run -it arnobroekhof:jenkins-swarm-slave:latest -master https://myjenkins-master
```

NOTE: all the commands that can be passed to the swarm client can also be passed to the docker container.

