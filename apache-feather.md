---
created: 2023-06-14T19:59:50.677Z
modified: 2023-06-14T20:59:53.000Z
tags: [feather,apache,file,format,data,storage,column,data,pcde,module22]
---
# Feather (Apache Columnar Storage Format)

## Introduction

>Feather is a portable file format for storing Arrow tables or
>[data frames][-ds] (from [languages][-lang] like [Python][-py] or R) that
>utilizes the Arrow IPC format internally.
>Feather was created early in the Arrow project as a proof of concept for
>fast, language-agnostic data frame storage for Python (pandas) and R
>
>--[Apache Arrow Feather Format (2023)][arrow-apache-feather]

## Arrow

Before discussing the Feather format,
it's important to understand the Arrow project.
Arrow is a cross-language development platform for in-memory data.
It specifies a standardized language-independent columnar memory format for
flat and hierarchical data,
organized for efficient analytic operations on modern hardware.

It processes data in-memory,
in columnar orientation which significantly improves performance.
The Arrow project has led to the development of
the **feather** file format for storing Arrow tables or
data frames (from languages like Python or its library [Pandas][-pd]).

## Comparison with Parquet

The [Parquet][-parquet] file format is also a columnar storage format from Apache.
Which begs the question, why do we need another columnar storage format?
The answer is that Parquet is a compressed file format,
whereas Feather is an uncompressed file format.
There are other benefits and drawbacks between the two formats,
so here's a handy table to compare the two:

* **Parquet**
  * Designed for long term archival storage.
  * More expensive to write in terms of memory than Feather, due to compression.
  * Standard storage format for analytics with large support.
* **Feather**
  * Designed for fast reading and writing of data frames in short-term storage.
  * Faster I/O speeds and less memory.
  * Written in binary format for speed, reducing memory but non-ideal for storage.

## Using Feather with Pandas

*Pandas* is a Python library for data manipulation and analysis.
It stores data in a data structure called a data frame.
It's great for working with data in Python,
so it's no surprise it supports the Feather format using the Arrow library.

### Install Feather

Although pandas supports the Feather format,
it doesn't come pre-installed.
After installing pandas, install the `feather` package:

```bash
pip install feather
```

### Write a Data Frame to Feather

To write a data frame to a Feather file,
use the `to_feather()` method:

```python
import pandas as pd
df = pd.DataFrame(data={'col1': ['a', 'b'], 'col2': ['c', 'd']})
```

This method takes a single argument, the path to the file to write to,
remember to use the `.ftr` file extension.

### Read a Data Frame from Feather

To read a data frame from a Feather file,
use the `read_feather()` method:

```python
import pandas as pd
df = pd.read_feather('data.ftr')
```

This method takes a single argument, the path to the file to read from.

## References

### Web Links

* [Apache Arrow Feather Format][arrow-apache-feather]

<!-- Hidden References -->
[arrow-apache-feather]: https://arrow.apache.org/docs/python/feather.html "Apache Arrow Feather Format"

### Note Links

* [Data Structure][-ds]
* [Programming Language][-lang]
* [Python][-py]
* [Pandas][-pd]
* [Parquet][-parquet]

<!-- Hidden References -->
[-ds]: data-structure.md "Data Structure"
[-lang]: programming-language.md "Programming Language"
[-py]: python.md "Python"
[-pd]: pandas.md "Pandas"
[-parquet]: parquet.md "Parquet (Apache Columnar Storage Format)"
