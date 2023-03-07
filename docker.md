---
created: 2023-03-06T15:36:53.072Z
modified: 2023-03-07T13:58:02.253Z
tags: [docker,container,devops,virtual,computer,pcde,module10]
---
# Docker

## Introduction

Docker is one of the most common software platforms used to create and run *containers*.

## Do Not Use Docker If

* You need a speed boost
* If you prioritize security over convenience
* If you develop desktop GUI applications
* If you want to facilitate development
* If you need to use different OSs or kernels
* If you have a lot of valuable data to store
* If you are looking for an easily managed technology

## Commands

### Container Management

* `docker create image` - Create container from image
* `docker run image` - Create container from image = `create` + `start`
* `docker start container` - Start container
* `docker stop container` - Stop container (gracefully)\*
  * \* send `SIGTERM` signal to main process + `SIGKILL` after 10 seconds
* `docker kill container` - Kill (`SIGKILL`) container (forcefully)
* `docker restart container` - = `stop` + `start`
* `docker pause container` - Suspend the container
* `docker unpause container` - Resume the container
* `docker rm [ -f ] container` - Remove container
  * `-f` - force remove running container = `docker kill` + `docker rm`

### Container Inspection

* `docker ps` - List running containers
* `docker ps -a` - List all containers
* `docker logs [ -f ] container` - Get container logs (`stdout` and `stderr`)
  * `-f` - follow logs
* `docker top container [ps options]` - List processes running inside container
* `docker diff container`  - Show the differences with the image (modified files)
* `docker inspect container` - Show low-level infos (in [JSON][json-zk] format)

### Interacting with Container

* `docker attach container` - Attach to running container (`stdin`, `stdout`, `stderr`)
* `docker cp container:path hostpath` - Copy files/folders from container to host
* `docker cp hostpath container:path` - Copy files/folders from host to container
* `docker export container` - Export container contents as a [tar archive][tar-zk]
* `docker exec container args` - Run command in existing container
  * Useful for debugging
* `docker wait container` - Wait until the container terminates
  * Returns exit code
* `docker commit container image` - Commit a new docker image
  * Asa a snapshot of the container

### Image Management

* `docker images` - List all local images
* `docker history image` - Show the image history (list of ancestors or layers)
* `docker inspect image` - Show low-level infos (in [JSON][json-zk] format)
* `docker tag image tag` - Tag image with a label `tag`
* `docker commit container image` - Create an image (from a container)
* `docker import url [tag]` - Create an image (from a [tar archive][tar-zk])
* `docker rmi image` - Remove image

### Image Transfer

* `docker pull image[:tag]` - Pull image from registry
* `docker push image[:tag]` - Push image to registry
* `docker search text` - Search an image on registry
* `docker login` - Login to registry
* `docker logout` - Logout from registry
* `docker save repo[:tag]` - Export image/repo as [tar archive][tar-zk]
* `docker load` - Import image from [tar archive][tar-zk]
* `docker-ssh image` - Script to transfer images via SSH between two daemons

### Builder

* `FROM image|scratch` - Base image to build on
* `MAINTAINER email` - Author of the image
* `COPY path dst` - Copy files from host to image
* `ADD src dst` - Same as `COPY` but un-tar archives and accept [HTTP urls][http-zk]
* `USER name` - set the default username
* `WORKDIR path` - set the default working directory
* `CMD args` - set the default command
* `ENV name value` - set an environment variable

## Docker-Compose

The `docker-compose` utility is used to manage multiple containers together.
Very often we need to run multiple containers together to make an application work.
And they need very specific configurations to work together,
especially in terms of file systems and networking.

The `docker-compose.yml` file is used to configure the containers.
As the `.yml` extension suggests, it is written in [YAML][yaml-zk] format.

All `services` are defined in the `docker-compose.yml` file as named dictionaries.
Then each keyed service can have many different kinds of docker configurations.
`image`, is the only required configuration and it's the docker image of that service.
Other common configuration keys are `build`, `command`, `environment`, `ports` and more.

### Example

```yaml
version: '3.4'
services:
  expressrestaurantswagger:
    image: jrwtango/expressrestaurantswagger
    build:
      context: .
      dockerfile: ./Dockerfile
    environment:
      NODE_ENV: development
    ports:
      - "3000:3000"
```

This starts a container from the `jrwtango/expressrestaurantswagger` image.
The `build` configuration is used to build the image from
the `Dockerfile` in the current directory.
To specify `environment` variables, we use the `environment` configuration.
The `NODE_ENV` variable is set to `development` to specify the environment for node.
Finally `ports` is used to map the container's port `3000` to the host's port `3000`.
When running `docker-compose up`, the container will be started and the application
will be available at `http://localhost:3000`.

## References

### Web Links

* [What is a Container (from docker.com)][what-is-container-docker]
* [What is Docker? (from docker.com)][what-is-docker]
* [Docker Desktop (from docker.com)][docker-desktop]
* [Docker Hub (from docker.com)][docker-hub]
* [Use Cases (from docker.com)][use-cases-docker]
* [Pros & Cons of Containerization (from AtomicObject)][container-pros-cons-atom]
* [Containers: Pros & cons you may not know about (from InfoWorld by David Linthicum)][pros-cons-containers-infoworld]
* [Docker Cheatsheet][cheatsheet-docker]

<!-- Hidden References -->
[what-is-container-docker]: https://www.docker.com/resources/what-container "What is a Container (from docker.com)"
[what-is-docker]: https://docs.docker.com/get-started/overview/ "What is Docker? (from docker.com)"
[docker-desktop]: https://www.docker.com/products/docker-desktop "Docker Desktop (from docker.com)"
[docker-hub]: https://www.docker.com/products/docker-hub "Docker Hub (from docker.com)"
[use-cases-docker]: https://www.docker.com/use-cases "Use Cases (from docker.com)"
[container-pros-cons-atom]: https://spin.atomicobject.com/2019/05/24/containerization-pros-cons/ "Pros & Cons of Containerization (from AtomicObject)"
[pros-cons-containers-infoworld]: https://www.infoworld.com/article/3342165/containers-the-pros-and-cons-you-may-not-know-about.html "Containers: Pros & cons you may not know about (from InfoWorld by David Linthicum)"
[cheatsheet-docker]: https://dockerlabs.collabnix.com/docker/cheatsheet/ "Docker Cheatsheet"

### Note Links

* [Software Containers][container-zk]
* [JSON][json-zk]
* [Tar (Tape Archive)][tar-zk]
* [HTTP: Hypertext Transfer Protocol][http-zk]
* [YAML (YAML Ain't another Markup Language)][yaml-zk]

<!-- Hidden References -->
[container-zk]: ./container.md "Software Containers"
[json-zk]: ./json.md "JSON"
[tar-zk]: ./tar.md "Tar (Tape Archive)"
[http-zk]: ./http.md "HTTP: Hypertext Transfer Protocol"
[yaml-zk]: ./yaml.md "YAML (YAML Ain't another Markup Language)"
