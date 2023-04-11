---
created: 2023-04-09T11:58:45.652Z
modified: 2023-04-10T09:37:45.612Z
tags: [java,web,framework,spring,api,pcde,module14]
---
# Spring Boot (Java Web Framework)

Spring is an application framework and Spring Boot is from the same ecosystem,
but is focused on web applications.

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

<!-- Hidden References -->
