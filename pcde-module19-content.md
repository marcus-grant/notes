---
created: 2023-05-21T11:44:19.838Z
modified: 2023-07-07T14:21:52.388Z
tags: [pcde,module19,data,spark]
---
# PCDE Course Module 19 Content

## Introduction

In this module, you will learn how to process big data using two new platforms:
[Spark][-spark] and [Airflow][-airflow].
First, you will be introduced to Spark, an in-memory analytics engine for
quick and efficient big data processing.
You will learn about the key components and benefits of using Spark and
how to create Spark [Docker images][-docker] and [container][-container].
You will also learn how to load and query data using [PySpark][-pyspark].
Next, you will be introduced to Airflow,
an open-source workflow management platform.
You will learn how to install Airflow in a Docker container and
how to create a workflow in Airflow using directed acyclic graphs (DAGs).
Finally, you will be presented with some example Airflow workflows and
practice creating your own workflow.
In the final assignment for this module,
you will practice querying data using PySpark and create a workflow in Airflow.

## Discussion 19.1: Addressing Challenges of Big Data with Scalable

### Discussion 19.1: Introduction

In practice, programs run multiple instances on large datasets.
These datasets could be terabytes in size with
multiple read and write operations contained within a few lines of code.
Within the data engineering industry, this is known as *scaling*;
as applications scale up to faster speeds, complexity and efficiency
(or lack thereof) become more apparent.

Scalable solutions, such as Spark and Airflow,
help alleviate some of the processing overhead by
introducing complex programming techniques without much modification to the code.
Some of these techniques include running multiple sequences of code,
also known as *threads*, of programming instructions at the same time and
batch processing to enable the application to run multiple instances.
Spark and Airflow are also able to control the flow of data between
memory and disk storage.
Therefore, frequently used data can be cached and accessed more quickly.
These scalable solutions are vital to the success of a large program and thus
must be factored in when initially designing an application.

### Discussion 19.1: Instructions

In this discussion post, provide detailed responses to the following questions:

* Identify one application that you have personally used in the last month.
  * Explain how the application is used at scale.
  * How many users do you think use this application each day?
* What type of data is the application accessing?
  * Does it need to retrieve data from a disk,
  * ...or does it need to retrieve data from an external server?
* Identify two issues that could arise when scaling the application.
  * To explore this question even further,
    describe whether you have experienced a bug that
    you think is a result of scaling.
* How could scalable solutions, such as Spark and Airflow,
  help resolve these issues?
  * What techniques would a scalable solution involve?
* What other issues, if any, could a scalable solution,
  such as Spark or Airflow, solve?

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

### Discussion 19.1: Submission

#### Identifying an Application

I've been using Mastodon, a federated and open source alternative to Twitter.
It uses a decentralized protocol to let multiple servers with
their own users communicate across servers as if it was one centralized service.
It's scaling is handled by breaking up social media traffic and storage into
multiple separate servers that talk with each other to give posts of
friends and followers across different servers.

#### What type of data is the application accessing?

Pretty much the same kinds of data twitter accesses.
Texts, images, and links from other users.
But also, different from Twitter, are the relations between different users and
servers.
Different servers federate openly with other by default, opening up all friends from
other servers to your feed.
However, some servers might be cut off from the federation by one server,
meaning those posts aren't shown.
Same with users, you control what users and content you want to see.

#### Identify two issues that could arise when scaling the application.

One issue is the amount of data that needs to be stored and
the amount of data that needs to be transferred between servers.
This is a problem that is being solved by the use of
the ActivityPub protocol that provides some sharding and filtering options.
However, there is still the issue of
how to handle the data that is stored on the servers.
The data is stored in a database that is not easily scalable.
However, the fact that mastodon is made of multiple separate instances helps.

#### How could scalable solutions, such as Spark and Airflow, help resolve these issues?

The activity pub protocol by itself does some of this by splitting data into
separate instances that people choose to join and associate with.
Some instances however can be quite large by themselves,
and there you have to be able to parallelize some of the workloads.

#### What other issues, if any, could a scalable solution, such as Spark or Airflow, solve?

Redis gets deployed a lot on Mastodon instances to handle more ephemeral data that
gets read and written quickly but don't necessarily need to
make it to the database immediately.
Things like session management, cookies, search caches, etc.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Spark][-spark]
* [Airflow (Data Workflow and Scheduling)][-airflow]
* [Docker (Container Runtime)][-docker]
* [PySpark (Python Spark Library)][-pyspark]
* [Containers (Software)][-container]

<!-- Hidden References -->
[-pyspark]: python-spark.md "PySpark (Python Spark Library)"
[-spark]: spark.md "Spark"
[-airflow]: airflow.md "Airflow (Data Workflow and Scheduling)"
[-docker]: docker.md "Docker (Container Runtime)"
[-container]: container.md "Software Containers"
