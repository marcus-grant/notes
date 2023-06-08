---
created: 2023-03-06T15:20:44.030Z
modified: 2023-06-08T08:27:48.029Z
tags: [container,docker,podman,virtual,cluster,devops,pcde,computer,pcde,module10]
---
# Containers: Software Containerization

## Introduction

**Containerization** is a form of operating-system-level virtualization or
application-level virtualization over any kind of
machine that can run the container runtime.

## Basics

**Containers** are a standard unit of software that packages up code and
all its dependencies,
including the [operating system][os-zk], libraries, system, etc. into
a computing environment that can quickly and reliably run on any machine.
**Container** *images* tend to be lightweight and portable, and can be used to
deploy applications on any machine under any configurable environment that
native deployments can configure.

**Container** *images* become **containers** at runtime and
in the case of **container** *runtimes* -
images become containers when they are executed.
Regardless of whether the runtime runs on Linux, Unix, Windows, or macOS,
the **container** is always executed in the same way no matter the infrastructure.
**Containers** are isolated from one another and bundle their own resources,
so the applications run uniformly and their isolation provides some
greater degree of separation or *sanboxing* from
the [host OS][os-zk] actually running the **container**.
This provides these benefits.

* **Standardization**
  * The container runtime ensures each container is run in the same way
    regardless of the host machine.
* **Lightweight**
  * Containers share [the host OS][os-zk] kernel.
  * Thus doesn't need to run a full-blown [OS][os-zk] on each machine.
  * Thus more efficient than virtual machines.
* **Secure**
  * Applications are safer in containers
  * Can be configured to have no access to [host OS][os-zk] resources at all.
  * Can be configured to have no access to other **containers**.

## Docker

[**Docker**][docker-zk] is a software stack that
provides *containerization* of applications and virtualized operating systems.
It was one of the first containerization platforms,
that gained prominence in the early 2010s.

Docker in the 2020s is a mature platform that is used by many organizations.
Although the landscape of containerization platforms has changed significantly,
Docker is still a popular choice for many organizations despite
the rise of other containerization platforms that address some of the
limitations of [**Docker**][docker-zk].

## Networking

**Containers** can be connected to each other and to the outside world.
Most container runtimes have features to network **containers** together or
through the host machine in *host-mode* by opening ports and
mapping them to any container port.

In docker, this is done with the `--network` flag.
For more docker-specific networking information,
see [Docker: Networking][docker-net-zk].

## Use Cases

### Database Containerization

There are some good use cases for containerizing a database.
With some caveats that are worth noting,
namely storage performance and greater difficulty in managing the database with
respect to backups, migrations, and logging.
For more info, read [Database Containerization][-db-cont].

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Docker][docker-zk]
* [Operating System][os-zk]
* [Docker: Networking][docker-net-zk]
* [Database Containerization][-db-cont]

<!-- Hidden References -->
[docker-zk]: ./docker.md "Docker"
[os-zk]: ./os.md "Operating System"
[docker-net-zk]: ./docker.md#docker-networking "Docker: Networking"
[-db-cont]: database-containerization.md "Database Containerization"
