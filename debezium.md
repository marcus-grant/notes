---
created: 2023-04-06T08:33:01.777Z
modified: 2023-04-12T13:59:17.873Z
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

### Connector Basics

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

### Supported Connectors

Currently, Debezium supports **connectors** for the following databases that
you are already familiar with:

* [MySQL / MariaDB][mysql-zk]
* [PostreSQL][postgres-zk]
* [MongoDB][mongo-zk]
* [Cassandra][cassandra-zk]

### Connector Capabilities

* **Snapshots**
  * A *snapshot* is a way for an app to learn the initial state of a database.
  * Helps during startup when an app may not have the logs of recent changes.
  * *Snapshots* can also be useful when data is captured.
  * *Snapshots* can be used when an app needs to reload a table.
  * *Snapshots* can help when whole tables are added to a schema.
  * *Snapshots* are also useful in a variety of other situations.
* **Filters**
  * *Debezium* can filter rows of data from a database for easier processing.
* **Masking**
  * *Masking* is the ability to hide columns of data such as passwords.
* **Monitoring**
  * Monitoring is the ability to monitor *connectors* in *Debezium*.

>Most of the above notes aon connector capabilites comes from
>[(Debezium Community 2021.)][^1]

### MySQL Connector

*Debezium* is quite useful at performing queries against a MySQL database.
This is because MySQL has a binary log or *binlog* of all changes to
database *schemas* and tables [(Debezium Community 2021.)][^1].
At scale, Debezium has the speed to keep up with client applications and
*stream* the event logs in a timely manner.

For each event record, Debezium sends a message to
the client application consisting of a payload and often the corresponding *schema*.
Each message consists of the following four components:

| Component     | Description                                                  |
| ------------- | ------------------------------------------------------------ |
| DDL           | The operation being performed (`INSERT, SELECT, DROP`, etc.) |
| Database Name | The title of the database                                    |
| POS           | The MySQL `binlog` location                                  |
| Table Changes | The updated data table after ops are performed               |

When a table is in capture mode,
*Debezium* will also keep an additional history of
table operations in an internal log.

### Connector Change Events

A **change event** is an `INSERT`, `UPDATE`, or `DELETE` operation for which
the message also consists of a *key* and *value*.
The change event *key* consists of both a table *key* and a row *key*,
while the value has an envelope structure nested within the payload.

### Connector Further Reading

* [Debezium Documentation: Features][debezium-features-docs]
* [Debezium Documentation: Connector][debezium-connectors-docs]
* [Debezium Documentation: Connector: MySQL][debezium-mysql-connector-docs]

## Networking for Debezium

In order to get the databases, which are usually containerized and/or clustered,
to communicate with the Debezium **connector**,
you will likely need to setup [container][container-zk] networking.
For [docker][docker-zk] see the [section on networking][docker-net-zk]

## Practical Debezium Setup

### Overview

In this example we'll create a customer database ready for debezium.
This will involve creating a MySQL dockerfile, image, then container.
Then a script mentioned in the dockerfile and built into an image,
`customer.sql` will be used to initialize the database.
The project structure should look something like this.

```sh
tree
.
├── Dockerfile
└── customer.sql
```

### Initialize Database

```sql
CREATE DATABASE IF NOT EXISTS customerdb;
USE customerdb;
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
    `id`        int NOT NULL,
    `fullname`  varchar(255) DEFAULT NULL,
    `email`     varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);
```

### Setup Spring Application

Using [Java Spring Boot][java-spring-zk],
since it is native to [Java][java-zk] and hence
source code compatible with *Debezium*,
we can customize the functionality of our CDC application.

***TODO*** Insert any new info about how to configure a spring app for debezium.

### Create Docker Network

```sh
docker network create net-label
```

### Create Dockerfile

First create a Dockerfile to setup, in this case a [MySQL database][mysql-zk].

```dockerfile
FROM mysql:8.0
ENV MYSQL_DATABASE=customerdb \
    MYSQL_ROOT_PASSWORD=myNewPass
ADD customer.sql /docker-entrypoint-initdb.d
EXPOSE 3306
```

### Create Docker Image

Now build the image so it's ready to be deployed as a container.
In this case with a *tag* of `mysql-label`.

```sh
docker build -t mysql-label .
```

### Create Docker Container

Now to run it all as a container.

```sh
docker run --rm \
        --name mysql-label \
        --network net-label \
        --port 3306:3306 \
        -d mysql-label
```

### Run the Application within the Container

***TODO*** Insert any new info about how to configure a spring app for debezium.

## References

### Web Links

* [Debezium Community. "Debezium." Debezium. 2021. https://debezium.io/ .][debezium-home]
* [Debezium Community. "Connectors." Debezium. 2021. https://debezium.io/documentation/reference/stable/connectors/index.html .][debezium-connectors-docs]

* [Debezium MySQL Connector][debezium-mysql-connector-docs]
* [Debezium Features][debezium-features-docs]

<!-- Hidden References -->
[debezium-home]: https://debezium.io/
[debezium-connectors-docs]: https://debezium.io/documentation/reference/stable/connectors/index.html
[debezium-mysql-connector-docs]: https://debezium.io/documentation/reference/1.7/connectors/mysql.html "Debezium MySQL Connector"
[debezium-features-docs]: https://debezium.io/documentation/reference/features.html "Debezium Features"

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
* [Java Spring][java-spring-zk]

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
[java-spring-zk]: ./java-spring.md "Java Spring"

## Footnotes

* [Debezium Community. "Debezium." Debezium. 2021. https://debezium.io/ .][^1]
* [Debezium Community. "Connectors." Debezium. 2021. https://debezium.io/documentation/reference/stable/connectors/index.html .][^2]

<!-- Hidden References -->
[^1]: https://debezium.io/
[^2]: https://debezium.io/documentation/reference/stable/connectors/index.html
