---
created: 2023-02-08T16:45:44.050Z
modified: 2023-02-10T10:40:52.684Z
tags: [pcde,module7,etl,analysis,visual,data,engineer,programming,python]
---
# PCDE Course Module 7 Content: ETL, Analysis & Visualization

## Discussion 8.1: ETL Process

### Instructions

Now that you have become familiar with the ETL process,
it’s time for you to summarize your knowledge about it.

Why is ETL important?
What’s your general understanding of ETL?
What are the key considerations in each step of ETL?
What are the key advantages of having an integrated ETL process in your Python code?

### Response
 
#### Why is ETL Important?

ETL, or **E**xtract, **T**ransform, **L**oad,
is standard way of accumulating, standardizing and centralizing data.
When you need to work on several datasets to perform your work,
this process is how you effectively integrate multiple data sources practically.
It effectively establishes a single source of truth for
the data in an organization,
by ensuring data quality and centralizing its source.

#### What's your General Understanding of ETL?

That it's a broad name for the process of integrating,
standardizing, cleaning, and centralizing the data of an organization.
Ultimately it's deciding on standards early on for how data is to be structured,
then transforming the data from different sources so it fits that structure.
Then of course adding it to the appropriate database.

#### What are the Key Considerations in each Step of ETL?

* Extract:
  * Consider the source
  * Any restrictions?
  * Any format or structure changes necessary, like it being an Excel sheet?
* Transform
  * How do you transform the data source to work with your systems?
  * Should the data be reorganized to better fit your needs?
  * What should be an entity and property?
  * Do you need all the data points?
  * Is data cleaning or reformating necessary?
* Load
  * How will the data get transformed to suit the database?
  * What will be indexed?
  * What are the datatypes?
  * What are the primary and foreign keys?

#### What are the key advantages of having an integrated ETL process in Python?

Python has several key advantages, perhaps better suited to a list:

* It's flexible:
  * Python is one of the biggest ecosystems in software
  * That makes python easy to use with just about any data source & destination
  * Usually your use case already has a python library to streamline the process
* Python is great at automation workflows:
  * Python has been integrated in several automation workflows
  * This simplifies the process of
periodically updating data with fresh updates from its sources
* Analysis
  * Python is a first-class citizen in the world of data analysis
  * We know this from experience through pandas, numpy, scipy, matplotlib, etc.
* Interoperability
  * Python is effectively built through standardization
  * This leads to a culture of making highly portable code
  * As a result it works on more data sources and sinks than just about anything


## References

### Web Links

<!-- Hidden References -->

### Note Links

<!-- Hidden References -->
