---
created: 2023-06-14T18:56:46.442Z
modified: 2023-06-15T14:12:48.604Z
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

### My Response

#### Which format seems to be more efficient when writing data?

I wrote the lorem and random numbers dataframe created in the notebook to
both the Parquet and Feather formats.
On my machine, an Apple Silicon M1 Mac, the feather format was faster.

Here's the output of the `%%time` magic command for the Parquet write:

```text
CPU times: user 2.19 s, sys: 170 ms, total: 2.36 s
Wall time: 2.42 s
```

And here's the feather write:

```text
CPU times: user 1.46 s, sys: 172 ms, total: 1.63 s
Wall time: 1.29 s
```

As you can see, the feather write was faster by 1.13 seconds.
A speedup of about 46.7%.

#### Which format seems to be more efficient when reading data?

With the parquet and feather files written, I could then test the read speed.
Doing largely the same thing except using the `read_parquet` and
`read_feather` functions of pandas on two different file formats,
I got the following results.

Here's the parquet read:

```text
CPU times: user 1.82 s, sys: 573 ms, total: 2.4 s
Wall time: 2.9 s
```

And the feather read:

```text
CPU times: user 1.6 s, sys: 769 ms, total: 2.37 s
Wall time: 2.44 s
```

As you can see, the feather read was faster by 0.46 seconds.
A speedup of about 15.9%.
The difference isn't as great here,
which I imagine is due to the fact that the reading is more limited by
the speed of the disk than the data formatting and processing being done in RAM.

#### What are the main differences between the Parquet and Feather formats?

While both formats aim to improve the performance of data file formats by
storing data in a columnar format,
the Parquet format is more intended for broader ecosystems and for
longer term storage.
As such it has more compatibility built in and
crucially as it's designed for archives, it uses compression.
This will make the files slower to read and write,
but smaller to store.
Whereas the Feather format is designed for speed,
so it stores the data in a binary format without compression.
Binary formats don't use any kind of text encoding,
it's just raw bits arranged in a particular way, particularly to
optimize for the CPU's cache.
It also uses in-memory operations to speed up the reading and writing.
This makes it great for more *warm* or *ephemeral* data than Parquet.
Consider it a tier between raw databases and Parquet's colder archival tier.

#### Select a Publicly Available Large Dataset: Reddit Comment Archives

I chose to try and download some of the reddit archives on [archive.org][archive].
Since the Reddit API is being heavily charged per use starting this week,
I thought it'd be topical to try and download some of the archives.
I got a history of a subreddit from 2005 to earlier in the year.
Compressed with Zstandard, the archive is 180MB.
Uncompressed, it's 631MB as a collection of JSON files.

Due to it being the responses to Reddit's once public API,
it makes sense to store it in the JSON format as
that's the format the response is already in.
To store it for long term archival,
and distribution to other researchers,
it may make sense to use Parquet.

Parquet is great for distribution because it already comes compressed and
is significantly smaller than raw JSON and much faster to process.
The only reason it might not be used to archive reddit today is that
it's a relatively new format and
a lot of wrapper libraries for Python and R already exist to
perform analysis on the JSON data with all its nested structures and
particularly named keys.

## References

### Web Links

* [PCDE Emeritus Try-It Activity 22.1 Download][try-it-22-1]
* [Archive.org][archive]

<!-- Hidden References -->
**TODO**: Add this archive to your own archive for reliable access.
***TODO***: Then add this archive to a permalink short-link.

[try-it-22-1]: https://classroom.emeritus.org/courses/1412/files/1004624/download "PCDE Try-It Activity 22.1 Download"
[archive]: https://archive.org/ "Archive.org"

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
