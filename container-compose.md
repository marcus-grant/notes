---
created: 2023-06-29T10:40:26.687Z
modified: 2023-06-29T11:40:30.000Z
tags: [container,docker,podman,operation,deploy,configuration,cluster,orchestrate]
---
# Container Compose File Format

## Introduction

Most container runtimes now support some kind of **container composition format** to
define one or more [containers][-container] and their configurations each.
This greatly simplifies the starting up, and orchestrating of
containers based on a set specification.
This all started with [Docker's][-docker] implementing its `docker-compose` program and
compose file format.

Or as Docker puts it in their compose file format specification:

>The Compose Specification lets you define a platform-agnostic container based application.
>Such an application is designed as a set of containers which have to
>both run together with adequate shared resources and communication channels.
>
>--[(Docker Inc. 2023)][gh-docker-compose-spec]

## Basics

The format of a compose file is now largely converged on an improved version of
Docker's original compose file.
That is it's a [YAML file format][-yaml] with *reserved keys* for each
expected configuration.

## References

### Web Links

* [Docker Inc. "The Compose Specification". github.com/compose-spec/compose-spec/bloob/master/spec.md. June 29 2023][gh-docker-compose-spec]

<!-- Hidden References -->
[gh-docker-compose-spec]: https://github.com/compose-spec/compose-spec/blob/master/spec.md "Docker Inc. 'The Compose Specification'"

### Note Links

* [Software Container][-container]
* [Docker (Software Container Runtime)][-docker]
* [YAML Ain't Markup Language][-yaml]

<!-- Hidden References -->
[-container]: container.md "Software Container"
[-docker]: docker.md "Docker (Software Container Runtime)"
[-yaml]: yaml.md "YAML Ain't Markup Language"
