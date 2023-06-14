---
created: 2023-06-14T19:40:15.627Z
modified: 2023-06-14T20:40:18.000Z
tags: [parquet,apache,format,data,file,column,storage,big,pcde,module22]
---
# Parquet (Apache Columnar Storage Format)

## Introduction

>**Apache Parquet** is an open source,
>column-oriented data file format designed for
>efficient data storage and retrieval.
>It provides efficient data compression and encoding schemes with
>enhanced performance to handle complex data in bulk.
>Parquet is available in multiple languages including Java, C++, Python, etc...
>
>-- [Apache Parquet (2023)][apache-parquet]

## Reading and Writing Parquet Files in Pandas

### About Pandas

**Pandas** is a [Python][-py] library for
data manipulation and analysis using dataframes [data-structures][-ds].
For more information about Pandas,
see the [Pandas notes][-pd] for how to use pandas outside of
reading and writing parquet files.

## Installing Arrow

Before working with Parquet files,
you will need to install the Apache Arrow library.
The Arrow library is a cross-language development platform for
in-memory data and is used by Pandas to read and write Parquet files.
To install the Arrow library, run the following command in your terminal:

```sh
pip install pyarrow
```

## Writing Parquet Files

Now that Arrow is installed, assuming you already have pandas installed,
you should be able to import pandas and start writing parquet files.
First let's create a dataframe to be written into a file later.

```python
import pandas as pd
df = pd.DataFrame(data={'col1': [1, 2], 'col2': [3, 4]})
```

You can write the the `df` dataframe to
a parquet file using the `to_parquet()` method.
It takes an argument with the path to the file to be written to,
and **crucially the file extension must be** `.parquet`.

```python
df.to_parquet('data.parquet')
```

Running the commands above in a [Jupyter Notebook][-jnb] will
create a `df.parquet` file *in the same directory* as the notebook.
It will now contain the data from the `df` dataframe in the parquet format.

## Reading Parquet Files

Now that there's a parquet file to read,
let's read it into a dataframe again by using the `read_parquet()` method.
This function takes, as an argument, the path of the file to be read.
Again, remember you **must** use the `.parquet` file extension.

```python
pd.read_parquet('data.parquet')
```

## Differences to Feather

## Comparison with Parquet

The [Feather][-feather] file format is also a columnar storage format from Apache.
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

## References

### Web Links

* [Apache Foundation. parquet.apache.org. Accessed 2023-06-14][apache-parquet]

<!-- Hidden References -->
[apache-parquet]: https://parquet.apache.org "Apache Parquet"

### Note Links

* [Pandas][-pd]
* [Python][-py]
* [Data Structures][-ds]
* [Jupyter Notebook][-jnb]
* [Feather][-feather]

<!-- Hidden References -->
[-pd]: pandas.md "Pandas (Python Dataframe Library)"
[-py]: python.md "Python"
[-ds]: data-structure.md "Data Structures"
[-jnb]: jupyter.md "Jupyter Notebook"
[-feather]: apache-feather.md "Feather (Apache Columnar Storage Format)"
