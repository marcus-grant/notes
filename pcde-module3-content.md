---
created: 2023-02-17T16:30:39.000+01
modified: 2023-02-17T16:30:39.000+01
tags: [pcde,module3,content,pandas,python,data]
---
# PCDE Course: Module 3 Content

Hello World!

## Knowledge Check 3.1: Pandas Series

* Q1: Suppose that you have two lists called idList and nameList that
store the IDs and names of the employyes, respectively.
How would you careate a pandas series that stores the values in idList as index and
the values in nameList as data?
  * s1 = Series(index=idlist, data=nameList)
  * s1 = Series(data=namelist)
  * s1 = pd.Series(idlist, namelist)
  * s1 = pd.Series(index=idlist, data=namelist) **(CORRECT)**
* Q2: Suppose that you have a series called olympics with
an index representing the ranking of a country ranging from 1 to 10 and
data representing different country names.
What syntax would you use to find the country that ranked first in the Olympics?
  * olympics.1
  * olympics(one)
  * olympics(1)
  * olympics['1'] **(CORRECT)**
* Q3: What is the most accurate statement regarding the ability to
create a pandas series using a Python dictionary?
  * A pandas series can be created using a dictionary if
there are fewer than 10 items in the dictionary.
  * A pandas series can only be created using a dictionary in a few special scenarios
  * A pandas series cannot be created using dictionary
  * In python, a pandas series can be created using a dictionary **(CORRECT)**
* Q4: Which of the following statements most accurately describes the capability to
create a pandas series using a slice of another pandas series?
  * A pandas series can be created using another series if there are fewer than 10 items
  * A pandas series cannot be created using another series **(CORRECT)**

## Knowledge Check 3.2: Reading and Writing in Pandas

* Q1: What does JSON stand for?
  * Javascript Object Notation **(CORRECT)**
* Q2: Suppose that in your code pandas as pd has been imported.
What is the correct syntax to read planets.html file to dataframe df?
  * df = pd.read_html('planets.html') **(CORRECT)**
* Q3: Which arg in the to_json function helps specify how data is structured in file?
  * orient **(CORRECT)**
* Q4: Which function would you use to write a dataframe to a file in Excel format?
  * to_excel **(CORRECT)**
  
## Knowledge Check 3.3: Pandas Dataframes

* Q1: Which of the following is false about pandas *dataframes*?
  * Pandas dataframes store one-dimensional data **(CORRECT)**
* Q2: Suppose pandas imported as pd, what is the correct syntax to create a dataframe
from an array array_1?
  * df = pd.DataFrame(array_1) **(CORRECT)**
* Q3: Which info are you unable to retrieve using info()?
  * The name of the variable that stores the dataframe **(CORRECT)**
* Q4: Which of the following is true about the index of a dataframe?
  * The index can be used to access the data in a dataframe **(CORRECT)**

## Self-Study Drag & Drop Activity 3.1: Series vs. Dataframes

Series and **(dataframes)**
are both fundamental pandas **(data structures)**
that are designed to store data.

Both pandas series and dataframes are **(indexed)**,
meaning that each element can be accessed by specifying an index.

Naturally, in order to access a specific element,
the index associated with each element must be **(unique)**.

The main difference between pandas series and
dataframes is that the first one stores data in **(one dimnesion)**,
whereas the latter stores data in **(two dimensions)**.

Because series represent data one-dimensionally,
they can be visualized as indexed arrays with
one **(column)**
and as many elements as needed for
the many observations that were recorded to define the data.

It follows that dataframes are just an extension of multiple series side by side.

Therefore, pandas dataframes can be viewed as **(tables)**,
where each row corresponds to an observation of
the data collected in the dataframe,
and each column represents a **(label)**
for each measurement or record taken.

It is important to keep in mind that,
although the data across multiple columns can be of
**(different)** data types,
all the values in a single column must store data of
the **(same)** type.



## References

### Web Links

<!-- Hidden References -->

### Note Links

<!-- Hidden References -->
