---
created: 2023-05-21T11:44:19.838Z
modified: 2023-07-10T15:53:17.519Z
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

## Discussion 19.2: Use Cases for Spark

### Discussion 19.2: Introduction

As described in this section,
a popular data engineering tool for handling big data is Apache Spark.
In this discussion,
you will be challenged to identify a use case to solve problems related to
big data and explain why Apache Spark is the recommended software to
solve such problems.

Below are some examples to guide your response to this discussion:

#### Case Study 1: Customer Churn Analysis

Churn analysis is used to predict the likelihood that
a customer will discontinue using a service or product (DataFlair 2022).
Naturally,
organizations in the retail and communications sectors need to be able to
predict churn because the analysis might inform what to
change in their services or products.
This could prevent customers from
discontinuing a service and switching to a competing service.

Consider an organization that provides a call center analysis service.
In this case,
call log and transactional data is used (DataFlair 2022).
Call center data can be used in combination with transactional data with
the goals of reducing customer churn, increasing sales quotas,
and reducing the occurrence of fraud (DataFlair 2022).

Apache Spark offers an opportunity to examine data about
customer interactions so that the organization can measure and
improve their objective of providing a consistent and
rewarding customer experience.

#### Case Study 2: Big Data Solution for IoT Pet Trackers

Suppose that a US organization provides a service that allows pet owners to
monitor their pets’ locations through wearable trackers that
are managed via a mobile application (ScienceSoft USA Corporation 2022).

As you can imagine, given how attached owners are to their pets,
it is anticipated that the service will have many subscribers.
Furthermore,
suppose that the organization wants to provide a big data solution that
would allow the users to always be up to date about their pets’ locations and
receive real-time notifications about incidents or changes to
their pets’ whereabouts (ScienceSoft USA Corporation 2022).

A possible solution would be to send owners not only the locations of
their pets but also audio and video clips so that
the customers can get a better sense of their pets’ locations
(ScienceSoft USA Corporation 2022).

Since the data is collected constantly and in real time,
it will proliferate rapidly.
Therefore, the organization needs to come up with
a fast solution to efficiently store this data.
Apache Spark provides a solution that is able to quickly group data and
transfer it to a data warehouse.

### Discussion 19.2: Instructions

For your discussion post, please elaborate on the following prompts:

1. Identify a use case of a service or an application that deals with big data.
2. Describe the service and
    why you think Apache Spark is the optimal solution for handling the data.
3. Provide and elaborate on
    at least three reasons why Apache Spark would be the best solution for
    handling the big data for your chosen use case.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

### Discussion 19.2: Submission

Since I used a Voi scooter today I thought
I'd consider a potential big data architecture for them.
They are an electric scooter rental company.
In cities they manage a fleet of electric scooters that aside from repairs and
recharging are left outside in allowed parking spaces.
Then an app unlocks them and charges based on time used.
With hundreds and probably thousands of scooters with realtime location data and
status updates on several scooters a lot of data gets managed.

#### Realtime Data Streaming

Apache Spark is a good solution for this because it offers streaming data processing.
This means that a lot of real-time data can be processed in real-time as
it comes into the system.
If Spark isn't fast enough, then you just need to add more worker nodes to
the platform to increase its throughput.
Location-based data can be immediately processed as it comes in
to the forms that make most sense for the automation services of Voi.

#### Faster Analytics

It also provides a great ecosystem for performing analytics on all the data in
a much faster workflow than a lot of other systems like Hadoop.
There's even support for Python and
many of its analytics modules, even providing a pandas-like dataframe class.

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
[-airflow]: airflow-workflow.md "Airflow (Data Workflow and Scheduling)"
[-docker]: docker.md "Docker (Container Runtime)"
[-container]: container.md "Software Containers"
