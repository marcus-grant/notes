---
created: 2023-06-14T18:56:46.442Z
modified: 2023-06-14T20:35:16.964Z
tags: [pcde,module22,data,big,science,sql,python,dask,feather,parquet]
---
# PCDE Course Module 22 Content

## Introduction

In this module,
you will learn about processing and
streaming big data using the pandas library, the Apache Parquet format,
and the Apache Feather format.
You will begin by comparing the functionality and speed of the Parquet and
Feather formats when processing large datasets.
Next, you will explore the advantages of
parallel computing and learn the basics of DASK,
a parallel computing Python library.
You will practice using the DASK library to create, read, write,
and analyze multiple files in parallel and
simulate parallel processing across distributed machines.
In the next section,
you will learn how web sockets are used as a communication protocol and
how to stream data through web sockets.
The final assignment for this module consists of two parts.
In the first part of the final assignment,
you will compare the performances of parallel computing with
the pandas, NumPy, and DASK libraries.
In the second part of the final assignment,
you will practice streaming data using web sockets.

## Try-It Activity 22.1: Reading Big Data

### Try-It 22.1 Introduction

In this try-it activity,
you will begin by comparing the reading and writing performances of
the Apache [Parquet][-parquet] and [Feather][-feather] formats on
a dataframe with two million rows.
Next, you will discuss which format performed better at
reading and writing big data and why you think that may be.
Finally,
you will be asked to select a publicly available large dataset and
describe why it would be convenient to store it either in
Parquet or Feather format.

### Try-It 22.1 Instructions

1. In a terminal, run `pip install lorem` to generate large lorem ipsum data.
2. Download the [Try_It_22_1][try-it-22-1] directory.
    Open it using Jupyter Notebook.
    There are four questions throughout the notebook.
3. Read the instructions and modify the code that is provided in
    the cells for questions 1, 2, 3, 4.

Now that you have some experience comparing the performances of
the Parquet and Feather formats when reading and writing big data,
discuss your experience with your peers.
In your discussion post, respond to each of the questions below:

* Which format seems to be more efficient when writing data?
* Which format seems to be more efficient when reading data?
* What are the main differences between the Parquet and Feather formats?
  * How do you think these differences impact the performance of each format?
    * Especially in reading and writing data.
* Select a publicly available large dataset (more than 500,000 rows).
  * Describe the dataset and research why it would be convenient to
    store it in either Parquet or Feather format.

**Suggested Time**: 75 minutes
**Suggested Length**: 250~300 words

## My Response

## References

### Web Links

<!-- Hidden References -->
**TODO**: Add this archive to your own archive for reliable access.
***TODO***: Then add this archive to a permalink short-link.
[try-it-22-1]: https://classroom.emeritus.org/courses/1412/files/1004624/download

### Note Links

* [Pandas (Python Dataframe Library)][-pd]
* [Parquet (Apache Columnar Storage Format)][-parquet]
* [Feather (Apache Columnar Storage Format)][-feather]
* [DASK (Python Multiprocessing Library)][-dask]

<!-- Hidden References -->
[-pd]: pandas.md "Pandas (Python Dataframe Library)"
[-parquet]: parquet.md "Parquet (Apache Columnar Storage Format)"
[-feather]: apache-feather.md "Feather (Apache Columnar Storage Format)"
[-dask]: python-dask.md "DASK (Python Multiprocessing Library)"
