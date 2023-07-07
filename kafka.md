---
created: 2023-07-03T15:16:00.668Z
modified: 2023-07-03T16:17:20.000Z
tags: [kafka,distribute,parallel,log,event,asynchronous,iot,data,store,pcde,module24]
---
# Kafka (Apache Stream Processing Platform)

## Introduction

>**Apache Kafka** is a distributed event store and stream-processing platform.
>It is an [open-source system][-foss] developed by
>the Apache Software Foundation written in [Java][-java] and Scala.
>The project aims to provide a unified, high-throughput, low-latency platform for
>handling real-time data feeds.
Kafka can connect to external systems (for data import/export) via
>Kafka Connect,
>and provides the Kafka Streams libraries for stream processing applications.
>
>--[(Wikipedia.org 2023)][wiki-kafka]

## Run in Container

It's possible to run Kafka in a [Docker container][-docker],
or any [container platform][-container].
Because Kafka depends on multiple separate components to run simultaneously,
it's preferable to deploy Kafka using some kind of
[container compose system][-cont-comp].

There's an [example repository][-kafka-docker-ex] to deploy the system.

## References

### Web Links

* [Wikipedia Contributors. "Apache Kafka". Wikipedia, the free encyclopedia. 2023][wiki-kafka]
* [johntango. "JohnKafka". Github.com. 2023][-kafka-docker-ex]

<!-- Hidden References -->
[wiki-kafka]: https://en.wikipedia.org/wiki/Apache_Kafka "Wikipedia.org Apache Kafka"
[-kafka-docker-ex]: https://github.com/johntango/johnKafka "Github johntango/johnKafka"

### Note Links

* [Free Open-Source Software (FOSS)][-foss]
* [Java][-java]
* [Docker][-docker]
* [Container (Software)][-container]
* [Container Compose File Format][-cont-comp]

<!-- Hidden References -->
[-foss]: foss.md "Free Open-Source Software (FOSS)"
[-java]: java.md "Java"
[-docker]: docker.md "Docker"
[-container]: container.md "Container (Software)"
[-cont-comp]: container-compose.md "Container Compose File Format"
