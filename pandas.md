---
created: 2023-02-17T14:42:48.640Z
modified: 2023-02-17T15:30:23.661Z
tags: [pandas,python,data,analysis,dataframe,data,frame,library,structure,table,sql,pcde,module3]
---
# Pandas: Python Data Analysis Library

## Introduction

**Pandas** is a [Python][py-zk] library for data analysis.
It provides high-performance,
easy-to-use data structures and data analysis tools.
All of it revolves around the `DataFrame` object,
which is a tabular [data structure][data-struct-zk] with labeled axes (rows and columns).
It is similar to a spreadsheet or a SQL table, or the `data.frame` in R.
[Wikipedia describes it as...][pandas-wiki]

>**Pandas** is a software library written for
>the [Python programming language][py-zk] for data manipulation and analysis.
>In particular,
>it offers [data structures][data-struct-zk] and
>operations for manipulating numerical tables and time series.

## Series

### Introduction

Data series in Pandas are similar to lists in Python.
They are one-dimensional arrays of data.
They can be created from lists or dictionaries.
But in Pandas,
you always have to have an index, whether specified or not.
Let's examine the below code snippet.

### Creating a Series

```python
import pandas as pd
import numpy as np
alist = [1,2,3,4]
s1 = pd.Series(alist)
s1
```

When you just create a `Series` object from a list,
a default index is created for you,
starting from 0 and counting up by 1.
Below is the result of the above code snippet.

```txt
0    1
1    2
2    3
3    4
dtype: int64
```

You may want to actually specify the index yourself.
To do this you can either create a dictionary,
where the keys are the index values.
It's also possible to create a `Series` object from a list or [`np.array`][numpy-zk],
where it is the same size as the data Series in the same order.
Modifying the above code snippet with a second list of alphabetical characters,
you get the following result.

```python
import pandas as pd
import numpy as np
alist = [1,2,3,4]
blist = ['a', 'b', 'c', 'd']
s1 = pd.Series(data=alist, index=blist)
s1
```

```txt
a    1
b    2
c    3
d    4
dtype: int64
```

You can also create Series from dictionaries.
Simply make the keys the index values,
and the values associated with the keys the data in the series.

```python
mydict = {'a': 1, 'b': 2, 'c': 3, 'd': 4}
s3 = pd.Series(mydict)
s3
```

And you get the same result as before with two lists.

### Accessing an Element in a Series

To access a specific value in a `Series` object,
you can use the index value the same way you'd access a value in a dictionary or list.

```python
s1['a']
# Output: 1
```

Accessing a value in a series by its index, like `s1` from before, gets you `1`.

### Slice a Series

Series are sliced a bit differently than lists.
Because they have an index of potentially *ordinal values*,
you can't assume that the index values are sequential.
So instead of using the `:` operator,
you have two nested brackets,
with the inner brackets containing the index values you want to slice.

```python
s1[['a', 'c']]
```

Results in :

```txt
a    1
c    3
dtype: int64
```

Now, is the slice taken a copy or reference?
Let's find out by modifying the end of the code from before.

```python
s2 = s1[ ['a', 'c']]
s2['a'] = 10
s1['a']
```

The result is `1`.
So clearly slicing in pandas copies the data.

## References

### Web Links

* [Pandas (Software)(from Wikipedia, the free encyclopedia)][pandas-wiki]
* [Pandas Series (from W3Schools)][pandas-series-w3]

<!-- Hidden References -->
[pandas-wiki]: https://en.wikipedia.org/wiki/Pandas_(software) "Pandas (Software)(from Wikipedia, the free encyclopedia)"
[pandas-series-w3]: https://www.w3schools.com/python/pandas/pandas_series.asp "Pandas Series (from W3Schools)"

### Note Links

* [Python Programming Language][py-zk]
* [NumPy][numpy-zk]
* [Data Structure][data-struct-zk]

<!-- Hidden References -->
[py-zk]: ./python.md "Python Programming Language"
[numpy-zk]: ./numpy.md "NumPy"
[data-struct-zk]: ./data-structure.md "Data Structure"
