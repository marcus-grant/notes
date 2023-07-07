---
created: 2023-07-07T10:03:57.846Z
modified: 2023-07-07T15:59:38.109Z
tags: [python,spark,data,stream,library,database]
---
# PySpark (Python Spark )

## Introduction

>**PySpark** is the [Python API][-py] for [Apache Spark][-spark].
>It enables you to perform real-time,
>large-scale data processing in a distributed environment using Python.
>It also provides a PySpark shell for interactively analyzing your data.
>
>--[(Apache Spark. 2022)][apache-spark-overview]

PySpark is a commonly used tool in which Python applications can be run with Spark.
Spark will act as the Python compiler and
execute the steps using the most efficient process.
In the sample Python application that you will create,
the goal is to utilize Spark when applications become larger and
require more resources.

## Creating and Manipulating Dataframes

Spark's primary abstraction is a distributed item of *collections* called datasets.
These datasets can be created through Hadoop `input` files or
other transformed datasets.
Since Python is a dynamically typed [programming language][-lang],
the data does not need to be strongly typed.
You call each dataset a *dataframe* in Python to be consistent with [pandas][-pd].
To create and manipulate dataframes using PySpark, follow these steps:

### Load Data

Download and move data files into a location where PySpark's shell can reach.

### Enter PySpark Shell

Enter the PySpark shell through either a container or a local or remote installtion.

### Generate Dataframe from Data

Generate the dataframe of the sample file by running the below spark command.

```python
textFile = spark.read.text('data.txt')
```

### Access DataFrame and Transform it

You can access the dataframe values directly and transform the dataframe into
a new one if desired.
First, determine the number of rows in the dataframe with
the following Spark command.

```python
textFile.count()
```

### Peek Subsets of Dataframe

You can capture the first row of data with the following Spark Command.

```python
textFile.first()
```

### Capture Subset of Dataframe

Next, run the following command to transform this dataframe and
create a new one with a subset of the previous one.

```python
linesWithSpark = textFile.filter(textFile.value.contains('Spark'))
```

### Chain Commands Together

Spark offers the option to chain together commands.

```python
textFile.filter(textFile.value.contains('spark')).count()
```

### Use SQL

Because Spark has a [SQL engine][-sql],
it's possible to import the SQL client to PySpark and start performing queries.

```python
from pyspark.sql.functions import *

spark.sql('SELECT * FROM data')
```

### Complex Queries

After importing the SQL functions,
run the following PySpark command to find the row with the most words and
return the number of words in that row: 

```python
(textFile
    .select(size(split(textFile.value,"\s+"))
    .name("numWords"))
    .agg(max(col("numWords")))
    .collect()
)
```

## Caching

Caching is useful when a large dataframe is going to be accessed frequently.
These dataframes are considered *hot*,
so it's ideal to keep them accessible in-memory to improve speed.
In order to mark a dataframe as cache, use the following command.

```python
linesWithSpark.cache()
```

## References

### Web Links

* [PySpark Authors. Apache Foundation. 20230. "PySpark Overview"][apache-spark-overview]

<!-- Hidden References -->
[apache-spark-overview]: https://spark.apache.org/docs/latest/api/python/index.html "Apache Spark - PySpark Overview"

### Note Links

* [Python][-py]
* [Spark (Streaming Data Platform by Apache)][-spark]
* [Programming Language][-lang]

<!-- Hidden References -->
[-py]: python.md "Python"
[-spark]: spark.md "Spark (Streaming Data Platform by Apache)"
[-lang]: programming-language.md "Programming Language"
