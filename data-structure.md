---
created: 2023-02-17T14:51:40.995Z
modified: 2023-06-15T15:13:29.170Z
tags: [data,structure,computer,science,program]
---
# Data Structure

A data structure is a particular way of organizing data in
a computer so that it can be used effectively.
[Wikipedia states it as][data-struct-wiki]:

>In [computer science][-cs], a data structure is a data organization,
>management, and storage format that enables efficient access and modification.
>More precisely, a data structure is a collection of data values,
>the relationships among them,
>and the functions or operations that can be applied to the [data][-data].

## Arrays

>In computer science, an **array** is a *data structure* consisting of
>a *collection* of elements (values or variables), of same memory size,
>each identified by at least one array index or key.
>An array is stored such that the position of each element can be computed from
>its index tuple by a mathematical formula.
>
>--[Wikipedia (2023)][wiki-array]

## Data Frames

A data frame is a two-dimensional data structure,
i.e., data is aligned in a tabular fashion in rows and columns.
A data frame is a special case of a two-dimensional array,
where the rows and columns are identified with labels rather than simple integer indices.
This makes it easier to manipulate and analyze the data from a human perspective.

### Different Implementations

* [Pandas][pandas-zk]
  * A Python library for data analysis,
implementing a data frame as its primary structure.

## References

### Web Links

* [Data Structure (from Wikipedia, the free encyclopedia)][data-struct-wiki]
* [Wikipedia. "Array". Accessed 2023-06-09][wiki-array]

<!-- Hidden References -->
[data-struct-wiki]: https://en.wikipedia.org/wiki/Data_structure "Data Structure (from Wikipedia, the free encyclopedia)"
[wiki-array]: https://en.wikipedia.org/wiki/Array_(data_structure) "Wikipedia: Array (data structure)"

### Note Links

* [Data][-data]
* [Computer Science][-cs]
* [Pandas: Python Data Analysis Library][pandas-zk]

<!-- Hidden References -->
[-data]: data.md "Data"
[-cs]: computer-science.md "Computer Science"
[pandas-zk]: ./pandas.md "Pandas: Python Data Analysis Library"
