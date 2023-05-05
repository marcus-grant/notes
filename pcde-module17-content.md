---
created: 2023-05-04T14:21:08.366Z
modified: 2023-05-05T14:39:53.766Z
tags: [pcde,module17,etl,extract,transform,load,data,nifi,database]
---
# PCDE Course Module 17 Content

## Introduction

In this module,
you will learn how to use **NiFi** to
perform [extract, transform, and load (ETL)][-etl].
[NiFi is a data pipeline and transformation tool][-nifi] from
the Apache Software Foundation.
In the first section, you will build on your knowledge of ETL in
data engineering from earlier modules.
You will also delve deeper to learn specifics about
the features, capabilities, and architecture of NiFi.
In the next section, you will learn how to use NiFi to facilitate the handling of
data by creating an ETL pipeline.
You will build the components of your ETL pipeline including
creating the database and containers, installing the driver,
and setting up the `FlowFiles`, processors, and connectors.
You will then practice using *NiFi* to work with data in
a variety of different databases.

The mini-lessons and activities in
this section have been tested using a [Windows OS][-windows] and
the Catalina version of a [Mac OS][-macos].
If you use the Big Sur OS,
you are recommended to use the myPhpAdmin container as
demonstrated in this article:
[Run MySQL & phpMyAdmin Locally Using Docker][mysql-phpmyadmin-docker].

**Note**: Make sure you have installed the tools you will need for Modules 17-19 in
the [Course Tools Module][emeritus-course-tools-module] before
beginning this module.

## Discussion 17.1: Use Cases of ETL in Data Engineering

### Discussion Introduction

As you have learned, ETL stands for the extraction, transformation,
and loading of data.
When referring to a data engineering project,
you are mostly dealing with the following stages in that project:
data collection, data storage, data transformation, and data consumption.
Let’s look at each of the stages of the ETL process in detail.

#### Discussion Topic: Data Extraction

This stage includes the extraction and ingestion of
data from multiple source systems.
These source systems can be a variety of databases with different data formats.
Different tools are used to ingest data from these source systems.
Data engineers must ensure that the data integrity is maintained while
transferring data from one location to another.
It is also important to be mindful of the data types while
ingesting the data to make sure that you don’t lose any data.

#### Discussion Topic: Data Transformation

This is the stage that involves manipulating the data.
You can perform various operations on the data at this stage,
such as cleaning the data, transforming the data, and
applying rules based on business logic (e.g., filtering the data).
All of the data transformation happens on the destination after
the data has been successfully ingested.
Any kind of business requirements and modification of data,
such as deriving new columns, performing joins, and using aggregate functions,
is done at this stage.
It’s always a good practice to keep a copy of the source data as
it is and create new intermediate tables to perform the operations required for
the data transformation stage.

#### Discussion Topic: Data Loading

This is the stage where the new data is ready to be used or loaded to
a new destination, such as a database.
You can also load the transformed data set to the visualization tools for
reporting purposes.
This is the final stage of the ETL process in
a data engineering pipeline where
the output data set is loaded or shared to the desired destination.

### Discussion Prompt

Based on this discussion, you have a good understanding of
how to go about performing ETL operations when
working on a data engineering project.

To apply what you have learned, consider an ETL project and
describe the tasks involved in each step for that particular project.
Key points to consider include:

* Discuss your understanding of the raw data.
* Explain how you will keep the integrity of the original data.
* Describe how you will maintain data quality in the transformation phase.
* Explain how you will load the data with proper formats for all columns.

Discuss how you will achieve each of these priorities based on
your understanding of the ETL process.
Elaborate on any other thoughts or considerations you have put in
place in your ETL project.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

**Suggested Time**: 60 minutes

**Suggested Length**: 250-300 words

This is a required activity and will count toward course completion.

#### ETL Discussion: My Response

The context I'm considering for ETL is an e-commerce system.
An online retailer is going to be looking at customer data from
their online storefront, CRM system, inventory management system,
online advertising, and social media.
All to better manage their inventory, increase sales, improve customer service,
improve shopping experience, and increase customer retention and make plans.

#### ETL Data Extraction

Some of the data sources to look at for e-commerce are internal.
Internally you can *extract* data from the web client for the store of its users,
the inventory management systems.
Here you can see which items customers place in their carts,
spend the most time on examining, roughly where in the world they are located,
account email, and transaction history and inventory at different times.
There's also external sources,
such as social media and web based advertising where you can examine interest by
different kinds of customers and metrics like click through rates.

Here we need to decide on the data we are interested in,
ideally all of it, but the specifics needs to be decided on and standardized.
Once we have all the entities and properties defined it becomes easier to
build all the rest of the ETL pipeline.
This includes *extract* processes like deciding on when to pull data,
how to check validity and for new data to avoid duplication, etc.

#### ETL Data Transformation

During transformation, particularly the external data sources need transformation.
Internally the data systems should already be well defined.
However some of the data columns might overlap or aggregate with external sources.
So it's important to standardize data types, representations and the structure of
the incoming data so all sources become consistent with each other.
For example, a user ID might need to be associated with
an internal customer email address along with a social media account.
Then the data needs to be cleaned as there's always chances for missing data or
data that can't be parsed into a format that the system needs.
Other anomalies will need to be carefully monitored.

#### Data Loading

For data loading, the prepared data needs to be adapted to whatever form the
drivers to the various databases or database systems are.
In the case of MySQL, columns need to be picked and the appropriate `INSERT INTO` or
`UPDATE` statements need to be generated and executed.
The database system might include a CDC system that might need informing of
the updates to the system as well.

## Drag & Drop Activity 17.1: NiFi: An Apache ETL Tool

* Process Group
  * A process group is a group of NiFi flows, which helps a user manage and
keep **(flows)** in a **(hierarchical)** order.
* Flow
  * A flow is created by **(connecting)** different **(processors)** to
transfer and modify **(data)**, if required,
from one data source(s) to another destination data source.
* Processor
  * A process is a **(Java module)** that is responsible for
either fetching data from the sourcing system or storing it in the destination system.
Other processors are also used to add **(attributes)** or
change content in `FlowFiles`.
* FlowFile
  * A FlowFile is the basic component of NiFi,
which represents the single object of data from the **(source system)**.
The NiFi processor makes changes to the FlowFile while it moves from
the source processor to the destination.
Different **(events)** like `CREATE`, `CLONE`, `RECEIVE`, etc. are performed on
a FlowFile by different processors in a flow.
* Event
  * Events represent the **(change)** to
a `FlowFile` while versing through a NiFi *flow*.
These *events* are tracked in NiFi *repositories*.
* Connector
  * A connector links *processors* together and defines the relationship between
the *processors*, which controls how data flows.
*Connectors* can also link one *processor* back to itself to create a **(loop)**.
* Controller
  * A *controller* records **(connections)** between processes and
controls the allocation of threads used by all processes.

## Knowledge Check 17.1: Basics of NiFi

* Q1: Which of the following options list all steps of
a data engineering cycle in the correct order?
  * Data collection, processing, transformation, consumption **(WRONG)**
  * Data collection, storage, transformation **(WRONG)**
  * Data collection, storage, processing and consumption **(Correct)**
* Q2: Which of the following falls under the process of data collection?
  * All of the above **(Correct)**
* Q3: Which of the following functions can be performed using NiFi?
  * All of the above **(Correct)**
* Q4: Which of the following can be used to
create a scalable data engineering pipeline?
  * NiFi **(Correct)**
* Q5: What are the components of a `FlowFile`?
  * Data content and key-value pairs associated with the data **(Correct)**
* Q6: Which of the following is **not** a feature NiFi?
  * NiFi works without being connected to any kind of network **(Correct)**
* Q7: Which of the following can't be achieved by using NiFi?
  * Complex event processing **(Correct)**
* Q8: Which of the following functions can be achieved through NiFi?
  * All of the above **(Correct)**
* Q9: Which of the following is not a component of the NiFi architecture?
  * Registries **(Correct)**
* Q10: What is the term used to represent changes in a `FlowFile`?
  * Events **(Correct)**

## References

### Web Links

* [Run MySQL & phpMyAdmin Locally Using Docker][mysql-phpmyadmin-docker]
* [Emeritus Course Tools Module][emeritus-course-tools-module]

<!-- Hidden References -->
[mysql-phpmyadmin-docker]: https://migueldoctor.medium.com/run-mysql-phpmyadmin-locally-in-3-steps-using-docker-74eb735fa1fc "Run MySQL & phpMyAdmin Locally Using Docker"
[emeritus-course-tools-module]: https://emeritus.instructure.com/courses/103/modules "Emeritus Course Tools Module"

### Note Links

* [Apache NiFi][-nifi]
* [Extract, Transform, Load (ETL)][-etl]
* [MySQL][-mysql]
* [MacOS (Operating System)][-macos]
* [Windows (Operating System)][-windows]

<!-- Hidden References -->
[-nifi]: nifi.md "Apache NiFi"
[-etl]: etl "Extract, Transform, Load (ETL)"
[-mysql]: mysql.md "MySQL"
[-macos]: macos.md "MacOS (Operating System)"
[-windows]: windows.md "Windows (Operating System)"
