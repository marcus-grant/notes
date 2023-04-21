---
created: 2023-04-20T12:21:10.523Z
modified: 2023-04-21T08:31:02.190Z
tags: [pcde,module16,transit,api,web,python,cdc,change,data,capture,database,container]
---
# PCDE Course Module 16 Content: Transit Data & APIs

## Introduction

In this module,
you will be working on another project that you can add to your portfolio.
Throughout this module,
you will learn about location-based applications and
how to build the various components to create one yourself.
You will also be introduced to two new tools,
[Mapbox][-mapbox] and [Maven][-maven],
and you will learn about the curl command,
which is used to transfer data to or from a server.

In Project 16.1, you will build a transit data application.
To complete this project, you will need to use knowledge from earlier modules to
enhance a Flask web application provided by Dr. Sanchez that
displays the position of buses on a map using data from the MBTA.

Here is an overview of the goals and expectations for this module’s project:

You will be using the MBTA API to determine the position of
buses (longitude and latitude) along Route 1.
Take the time to familiarize yourself with the format of
the data returned by the API and the documentation provided by the MBTA.

You will be using a [MySQL database][-mysql] that you will create to
store the information that you retrieve from the MBTA API.
You will then periodically make calls to the MBTA API,
parse the [JSON][-json] data returned by the API,
and insert new rows into the table that you have created.

You also learned about [change data capture (CDC)][-cdc] and
how it is necessary to
propagate changes from the master database to other databases.
You will use [Debezium][-debezium] to monitor changes to your MySQL database and
propagate the changes to a MongoDB database.

In the final part of the project,
you will analyze the data stored in the MySQL database.
After letting your web application run for 12 hours,
you will assess some insights that you can gather from the data you have collected.
This is the ultimate goal of a data engineer:
to be able to find patterns in data and to draw conclusions from that data.

The anticipated time to complete this project is approximately 11 hours.

Although the time to complete the project may vary,
be sure to set aside enough time to complete the final project for submission.

To review the final project details,
please see the [full description of Project 16.1][-project16].

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [PCDE Project 16: Build a Transit Data Application][-project16]
* [Mapbox][-mapbox]
* [MySQL][-mysql]
* [Maven (Java Build Tool)][-maven]
* [JavaScript Object Notation (JSON)][-json]
* [Change Data Capture (CDC)][-cdc]
* [Debezium][-debezium]
* [CSS][-css]

<!-- Hidden References -->
[-project16]: pcde-project-16.md "PCDE Project 16: Build a Transit Data Application"
[-mapbox]: mapbox.md "Mapbox"
[-mysql]: mysql.md "MySQL"
[-maven]: maven.md "Maven (Java Build Tool)"
[-json]: json.md "JavaScript Object Notation (JSON)"
[-cdc]: cdc.md "Change Data Capture (CDC)"
[-debezium]: debezium.md "Debezium"
[-css]: css.md "CSS"
