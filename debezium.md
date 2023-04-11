---
created: 2023-04-06T08:33:01.777Z
modified: 2023-04-11T19:22:36.707Z
tags: [debezium,cdc,change,data,capture,java,pcde,module14]
---
# Debezium

## Background

[Change Data Capture (CDC)][cdc-zk] systems can be complex and time-consuming to
implement and deploy.
However, they have the potential to be very useful in a variety of situations.
So community developers have developed a number of open-source tools to
simplify the process of implementing CDC systems.
**Debezium** is one such tool that is designed to work with a variety of
[database management systems (DBMSs)][db-types-zk] and
is written in [Java][java-zk].

## What is Debezium?

Debezium is an [open source][foss-zk] distributed platform for CDC.
Debezium can point at your databases,
and your applications can start responding to all of the inserts, updates and
deletes that other applications commit to your databases.
[(Debezium Community 2021).][^1]

To understand exactly what debezium does, let's consider an example.
Suppose you have a database called `customers` that has a table so named in it.
One of the features of your application is to
produce a daily report of the top 500 customers.
This means that, ideally,
you would like to generate a report of the `customer`s table that includes
record additions, modifications, and deletions.

As you can imagine, implementing these changes manually on
a daily basis can quickly become expensive, and the process can be error-prone.

Debezium comes handy at this stage because it *pushes* changes out to
your application as they happen.
In other words, it streamlines the process of monitoring your database and
producing your desired report.

## Connectors

Debezium's architecture is built around the concept of **connectors**.
In data engineering,
a **connector** is a process that moves data from one database to another.
These processes may allow for filtering data, transforming it into a desired structure,
or updating it for the purposes of analysis in a similar way as it happens in CDC.

Debezium is a library of **connectors** that capture changes from a variety of
database management systems making it easier for your applications to
consume and respond to the events regardless of where the changes originated.
[(Debezium Community 2021.)][^2].
Each **connector** is designed for a specific type of database by
taking advantage of that specific database feature for CDC.

Currently, Debezium supports **connectors** for the following databases that
you are already familiar with:

* [MySQL / MariaDB][mysql-zk]
* [PostreSQL][postgres-zk]
* [MongoDB][mongo-zk]
* [Cassandra][cassandra-zk]

## Networking for Debezium

In order to get the databases, which are usually containerized and/or clustered,
to communicate with the Debezium **connector**,
you will likely need to setup [container][container-zk] networking.
For [docker][docker-zk] see the [section on networking][docker-net-zk]

## References

## Footnotes

* [Debezium Community. "Debezium." Debezium. 2021. https://debezium.io/ .][^1]
* [Debezium Community. "Connectors." Debezium. 2021. https://debezium.io/documentation/reference/stable/connectors/index.html .][^2]

<!-- Hidden References -->
[^1]: https://debezium.io/
[^2]: https://debezium.io/documentation/reference/stable/connectors/index.html

### Web Links

* [How to Use Nano Text Editor (from linuxize.com)][nano-linuxize]

<!-- Hidden References -->
[nano-linuxize]: https://linuxize.com/post/how-to-use-nano-text-editor/ "How to Use Nano Text Editor (from linuxize.com)"

### Note Links

* [Change Data Capture (CDC)][cdc-zk]
* [Types of Databases][db-types-zk]
* [Java][java-zk]
* [Free Open Source Software (FOSS)][foss-zk]
* [MySQL / MariaDB][mysql-zk]
* [PostreSQL (Relational Database)][postgres-zk]
* [MongoDB (Document Database)][mongo-zk]
* [Cassandra (Distributed Large Database)][cassandra-zk]
* [Container (Software)][container-zk]
* [Docker][docker-zk]
* [Docker: Networking][docker-net-zk]

<!-- Hidden References -->
[cdc-zk]: ./change-data-capture.md "Change Data Capture (CDC)"
[db-types-zk]: ./types-of-database.md "Types of Databases"
[java-zk]: java.md "Java"
[foss-zk]: ./FOSS.md "FOSS"
[mysql-zk]: ./mysql.md "MySQL / MariaDB (Relational Database)"
[mongo-zk]: ./mongodb.md "MongoDB (Document Database)"
[postgres-zk]: ./postgresql.md "PostgreSQL (Relational Database)"
[cassandra-zk]: ./cassandra.md "Cassandra (Distributed Large Database)"
[container-zk]: ./container.md "Container"
[docker-zk]: ./docker.md "Docker"
[docker-net-zk]: ./docker.md#docker-networking "Docker: Networking"
