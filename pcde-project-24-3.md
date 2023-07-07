---
created: 2023-06-28T18:19:36.786Z
modified: 2023-07-03T16:07:45.669Z
tags: [pcde,module24,project,kafka,big,data,python,pipeline,stream]
---
# PCDE Project 24.3

## Introduction

In this project, you will be working with [Kafka][-kafka],
one of the most successful applications for handling streaming data at scale.
You will use a Docker image created by Confluent that installs all of
the necessary Kafka components including, among others, the broker and ZooKeeper.
Kafka allows you to store messages in topics,
which are distributed across multiple brokers by splitting topics into
data partitions that save you from unfortunate broker failures.

To get started with this project, you will begin with a simple Kafka implementation.
With this implementation, you will create a [Python][-py] application that
publishes vehicle location longitude-latitude data to a Kafka topic.
Next, you will use [Node.js][-node] to start a web server that
acts as a consumer for the messages received from the Kafka application.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Kafka (Stream Processing Platform)][-kafka]
* [Python][-py]
* [Node JS][-node]

<!-- Hidden References -->
[-kafka]: kafka.md "Kafka (Stream Processing Platform)"
[-py]: python.md "Python"
[-node]: nodejs.md "Node JS"
