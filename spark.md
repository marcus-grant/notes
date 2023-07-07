---
created: 2023-05-21T16:11:29.960Z
modified: 2023-07-07T16:01:28.703Z
tags: [spark,data,analysis,query,database,pcde,module19]
---
# Spark

## Introduction

Spark is a distributed data processing framework to
process [big data][-big-data].
It is a powerful data processing tool that
is used as an ultra-fast in-memory analytics engine.
Spark was first created by the University of California at Berkeley in 2009 and
became [open source][-foss] in 2010 [(Databricks 2022)][-databricks-spark]

## Benefits of Spark

There are some key benefits of using Spark,
including speed, multi-language support, and advanced analytics.

Spark's speed is a significant benefit because it can decrease processing times when
handling big data.
By minimizing the number of read/write executions,
Spark is 100 times faster than [Hadoop][-hadoop] when
running on memory and 10 times faster when running on disk storage because
it reduces the number of executions [(TutorialsPoint 2021)][-tutspnt-spark].
Batch processing further improves Spark's speed.

Spark also offers multi-language support.
Apache Spark accepts multiple [programming languages][-langs],
[Java][-java], [Python][-py], [SQL][-sql].
Spark also generates nearly 100 high-level operations for robust *querying*.

Spark's advanced analytics make it an ideal platform for large-scale analytics.
Spark supports [Machine Learning (ML)][-ml] algorithms, graph processing,
SQL queries, and data streaming.
This allows Spark to process even the most power-consuming applications.

## Run Spark in a Container

It's probably best to deploy Spark in a container,
even for development and testing reasons.
A good standard for starting complex container(s) systems is to
use [container compose files][-cont-comp] like docker compose.

Below is an example `docker-compose` file that
can be used as a good starting point.
Note that the version `3.2` is a bit out of date,
but during the PCDE course it was the one that worked with the PySpark shell.

There's also the [Big Data Europe Spark Github Repository][-big-data-eu-spark]

```yaml
# Copyright VMware, Inc.
# SPDX-License-Identifier: APACHE-2.0

version: '2'

services:
  spark:
    image: docker.io/bitnami/spark:3.2
    environment:
      - SPARK_MODE=master
      - SPARK_RPC_AUTHENTICATION_ENABLED=no
      - SPARK_RPC_ENCRYPTION_ENABLED=no
      - SPARK_LOCAL_STORAGE_ENCRYPTION_ENABLED=no
      - SPARK_SSL_ENABLED=no
      - SPARK_USER=spark
    ports:
      - '8081:8080'
  spark-worker:
    image: docker.io/bitnami/spark:3.2
    environment:
      - SPARK_MODE=worker
      - SPARK_MASTER_URL=spark://spark:7077
      - SPARK_WORKER_MEMORY=1G
      - SPARK_WORKER_CORES=1
      - SPARK_RPC_AUTHENTICATION_ENABLED=no
      - SPARK_RPC_ENCRYPTION_ENABLED=no
      - SPARK_LOCAL_STORAGE_ENCRYPTION_ENABLED=no
      - SPARK_SSL_ENABLED=no
      - SPARK_USER=spark
```

## Spark in Python

>**Note:** For more detailed information,
>read [PySpark (Python Spark Library)][-pyspark].

With Spark deployed in a container,
it's time to start programming Spark sessions.
One of the ways to do this most relevant to data engineers and scientists is with
Spark's **PySpark** module.

PySpark is a commonly used tool in which Python applications can be run with Spark.
Spark will act as the Python compiler and
execute the steps using the most efficient process.
In the sample Python application that you will create,
the goal is to utilize Spark when applications become larger and require more resources.

### Web Links

* [Apache Spark. "Quick Start". Apache Spark. Accessed 5 January 2022][-spark-quick-start]
* [Databricks. "Apache Spark". Databricks. 2022][-databricks-spark]
* [TutorialsPoint. "Apache Spark - Introduction". Tutorials. 2021][-tutspnt-spark]
* [Big Data Europe. Github. 2023. "docker-spark"]

<!-- Hidden References -->
[-databricks-spark]: https://databricks.com/spark/about "Databricks. Apache Spark"
[-spark-quick-start]: https://spark.apache.org/docs/latest/quick-start.html "Apache Spark. Quick Start"
[-tutspnt-spark]: https://www.tutorialspoint.com/apache_spark/apache_spark_introduction.htm "Apache Spark. Intro"
[-big-data-eu-spark]: https://github.com/big-data-europe/docker-spark "Big Data Europe on Github Spark"

### Note Links

* [Big Data][-big-data]
* [Free Open-Source Software][-foss]
* [Programming Language][-langs]
* [Java][-java]
* [Python][-py]
* [PySpark][-pyspark]
* [Structured Query Language (SQL)][-sql]
* [Machine Learning][-ml]
* [Container Compose File Format][-cont-comp]

<!-- Hidden References -->
[-big-data]: big-data.md "Big Data"
[-foss]: foss.md "Free Open-Source Software"
[-langs]: programming-language.md "Programming Language"
[-java]: java.md "Java"
[-py]: python.md "Python"
[-pyspark]: python-spark.md "PySpark (Python Spark Library)"
[-sql]: sql.md "Structured Query Language (SQL)"
[-ml]: machine-learning.md "Machine Learning"
[-cont-comp]: container-compose.md "Container Compose File Format"
