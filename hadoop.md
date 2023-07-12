---
created: 2023-05-16T13:47:24.015Z
modified: 2023-07-12T13:46:26.715Z
tags: [data,process,library,cluster,big,stream,machine,learn,pcde,module18]
---
# Hadoop

## Introduction

**Hadoop** is an open-source software platform for
distributed storage and distributed processing for [big data][-big-data].
It consists of several components that work together to
load, process, and store big data written in [Java][-java].

## Hadoop Architecture

The Hadoop architecture consists mainly of four components:

* [MapReduce][-mr]
* [Hadoop Distributed File System (HDFS)][-hdfs]
* [Yet Another Resource Negotiator (YARN)][-yarn]
* [Common Utilities (or Hadoop Common)][-hadoop-common]

### MapReduce

>**Note:** For more information, read about [MapReduce][-mr] here.

**`MapReduce`** is a core component of the Hadoop platform.
The main funtionality of MapReduce is to split large amounts of data into
smaller *chunks* and distribute the smaller *chunks* onto multiple *servers* for
massively parallel processing tasks.
The architecture allows splitting workloads into a massive number of smaller ones that
later get re-combined into singular data sets.

### Hadoop Distributed File System (HDFS)

>**Note:** For more information,
>read about [Hadoop Distributed File System (HDFS)][-hdfs]

The **Hadoop Distributed File System** is utilized for storage permission in
a Hadoop cluster.
It's designed for providing a commodity hardware scalable and
highly available storage cluster for
distributing processing and querying workloads.

### Yet Another Resource Negotiator (YARN)

>**Note:** For more information,
>read about [Hadoop: Yet Another Resource Negotiator (YARN)][-yarn]

**YARN** is a framework that *MapReduce* works with.
*YARN* performs two operations job scheduling and resource management.

## Deployment

>**TODO:** Write more about how to deploy via containers, kubernetes & ansible.

Thanks to the EU's Horizon 2020 project, **Big Data Europe**,
offers open source resources to deploy [Big Data][-big-data] tools such as Hadoop.
This will help when deploying Hadoop on a cluster of machines or
a single development one.
This includes their [Hadoop Docker Container][-big-data-eu-docker-hadoop] which
can be used to deploy Hadoop on a single machine.

## References

### Web Links

* [Wikipedia Contributors. "Apache Hadoop". 2023. wikipedia.org.][wiki-hadoop]
* [Big Data Europe (from Github by Big Data Europe Project)][-big-data-eu]
* [Big Data Europe Hadoop Docker Container(from Github by Big Data Europe Project)][-big-data-eu-docker-hadoop]

<!-- Hidden References -->
[wiki-hadoop]: https://en.wikipedia.org/wiki/Apache_Hadoop "Wikipedia Contributors. 'Apache Hadoop'. 2023. wikipedia.org."
[-big-data-eu]: https://github.com/big-data-europe/README "Big Data Europe (from Github by Big Data Europe Project)"
[-big-data-eu-docker-hadoop]: https://github.com/big-data-europe/docker-hadoop "Big Data Europe Hadoop Docker Container(from Github by Big Data Europe Project)"

### Note Links

* [Java][-java]
* [Big Data][-big-data]
* [Hadoop: MapReduce][-mr]
* [Hadoop Distributed File System (HDFS)][-hdfs]
* [Hadoop: Yet Another Resource Negotiator (YARN)][-yarn]
* [Hadoop Common][-hadoop-common]

<!-- Hidden References -->
[-java]: java.md "Java"
[-big-data]: big-data.md "Big Data"
[-mr]: hadoop-map-reduce.md "Hadoop: MapReduce"
[-hdfs]: hadoop-dfs.md "Hadoop Distributed File System (HDFS)"
[-yarn]: hadoop-yarn.md "Hadoop: YARN"
[-hadoop-common]: hadoop-common.md "Hadoop Common"
