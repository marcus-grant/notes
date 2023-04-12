---
created: 2023-04-09T11:58:45.652Z
modified: 2023-04-12T14:13:51.263Z
tags: [java,web,framework,spring,api,pcde,module14]
---
# Spring Boot (Java Web Framework)

Spring is a [Java][java-zk] application framework and
Spring Boot is from the same ecosystem, but is focused on web applications.

## Getting Started

### Initializer

A good place to start a Spring project is the [Spring Initializer][spring-init].
There you'll be able through a web app to select the dependencies you want to
use and provide basic configurations.
Then it will give you a zip archive to download with the project structure
and initial boilerplate code.

In it you can change:

* Project type:
  * Maven
  * Gradle (Kotlin)
  * Gradle (Groovy)
* Language:
  * Java
  * Kotlin
  * Groovy
* Spring Boot version
* Project Metadata
  * Group
  * Artifact (name)
  * Project name
  * Description
  * Package name
* Packaging
  * Jar
  * War
* Java version
* Extra dependencies

### Create Spring Boot Container

#### Explanation of Spring Application Containerization

It's possible to [containerize][container-zk] a Spring application.
Here we'll show you how, among other platforms, to do it with [Docker][docker-zk].

#### Command Line to Create Container

```sh
docker run -it --rm -p 8080:8080 --name javamaven maven:3.6.3-openjdk-11 bash
```

## Basic Architecture

## References

### Web Links

* [Spring Initializer][spring-init]

<!-- Hidden References -->
[spring-init]: https://start.spring.io "Spring Initializer"

### Note Links

* [Java][java-zk]
* [Container (Software)][container-zk]
* [Docker][docker-zk]

<!-- Hidden References -->
[java-zk]: java.md "Java"
[container-zk]: container.md "Container (Software)"
[docker-zk]: docker.md "Docker"
