---
created: 2023-02-17T14:38:39.862Z
modified: 2023-02-20T15:14:03.506Z
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

## Knowledge Check 3.5: Time and Date Functionality in Pandas

* Q1: When did the Unix epoch start?
  * 1970-01-01 **(CORRECT)**
* Q2: What is the correct pandas syntax if you want to generate a series with
index all the days of the week May 5, 1989?
  * pd.date_range(start=`5/5/1989`, periods=7) **(CORRECT)**
* Q3: What is the default value for the freq argument in the pd.date_range function?
  * 1 day **(CORRECT)**

## Discussion 3.1: Applications of Time and Date Functionality in Pandas

### Prompt

As you become an expert Python programmer,
you will often come across data that is in a date or time format.

The Python `datetime` *module* contains a wide range of *functions* to
manipulate dates and times in your program.
Therefore,
it’s important that you become familiar with this *module* and its *functions*.

First, review this complete list of
Python datetime built-in *functions* (Links to an external site.).

Next, select three built-in Python *functions* from
the datetime *module* that you have not yet familiarized yourself with
in this *module*’s videos.
For each, provide a summary of its configurations and applications.
Be sure to include an example of
a practical use for each *function* that you choose.

This initial post should be between 75 and 100 words.

Read the statements posted by your peers.
Engage with them by responding with
thoughtful comments and questions to deepen the discussion.

Suggested Time: 45 minutes

Suggested Length: 75-100 words

This is a required activity and will count toward course completion.

### Response

#### datetime.datetime.now(tz=None)

This function will use the system time and
either the given `tz=VALID_TIMEZONE_STRING` timezone string or
if no timezone string is given,
the operating system specified timezone, ie the local time, gets used by default.
The returned object is a `datetime` object which
can represent a timestamp for any given moment in time,
in this case, a moment in time the millisecond this function is executed.
A function that takes immediate timestamps is useful in many situations and
here are just a few:
operating system logging, measuring time for a python function to run,
creating a transaction ledger that needs exact times, leaving, and many more.

```python
from datetime import datetime

timestamp1 = datetime.now()
print(timestamp1)
```

which outputs

```txt
2022-08-01 18:41:17.134578
```

#### datetime.datetime.timedelta

The `timedelta` class with its associated constructor gets used to
calculate intervals of time.
This is done with the `timedelta()` constructor which
allows you to specify differences in time with various kinds of units of time.
Those time unit parameters are weeks, days, hours,
minutes, seconds, milliseconds, microseconds.
The default values of all those parameters are 0.
With a `timedelta` object
you can perform basically every mathematical operator standard to
Python on those objects.
This is useful for any situation where you either need to modify a `timestamp`,
or make comparisons with them.
Let's say you're creating a timed event.
You'd take a `datetime` created from the now function from before.
Then you'd create a `timedelta` object with whatever timer offset you need,
then you'd keep checking if
the current `timestamp` is less than the initial timestamp plus the `timedelta`.

```python
from datetime import datetime, timedelta
timer_start = datetime.now()
print(timer_start)
timer_period_future = timedelta(days=1, hours=12, minutes=45)
timer_period_past = timedelta(seconds=-1)
print(timer_period_future)
print(timer_period_past)
if datetime.now() >= timer_period_future + timer_start:
    print('Timer has not reached the timedelta yet')
elif datetime.now() >= timer_period_past + timer_start:
    print('Timer has reached timedelta')
```

which outputs

```txt
2022-08-01 18:41:17.134578
1 day, 12:45:00
-1 day, 23:59:59
Timer has reached timedelta
```

#### datetime.strptime()

This parses a string with correctly formatted, according to the format string,
datetime information into a datetime object.
It takes a datetime string as its first positional argument and
a formatting string as the second positional argument.
There's a lot of format codes that would be too long to summarize in this discussion,
but you can find them
[here](https://docs.python.org/3/library/datetime.html#strftime-and-strptime-format-codes).
This is useful whenever you need to
create custom time formats from incoming data.
Very useful when ingesting data into datastructures like pandas and
performing computations on
them if python can treat as properly formatted datetime objects.
Say for example if we wanted to parse a short version of the ISO8601 format from
a string, as in years to seconds, but no unit of time less than seconds.
You'd do something like this.

```python
isotimestamp = datetime.strptime('2022-03-29T19:59:01', "%Y-%m-%dT%H:%M:%S")
print(isotimestamp)
```

which gives:

```txt
2022-03-29 19:59:01
```

## Knowledge Check 3.6: Designing Dataframes and Indexing in Pandas

* Q1: Which of the following is true?
  * iloc() can be used to access elements in
a dataframe based on their index? **(CORRECT)**
  * iloc() can be used to access elements in a dataframe based on their label?
  * loc() can be used to access elements in a dataframe based on their index?
  * iloc() can only be used to access a single element
* Q2: Suppose you have a dataframe, df, what does the following code return? df[2]?
  * The column with index two in the dataframe **(INCORRECT)**
  * The row with index two in the dataframe **(INCORRECT)**
  * The second element in the dataframe
  * None of the above **(CORRECT)**
* Q3: What is the correct syntax to access the last row in a dataframe, df?
  * df.iloc[-1] **(CORRECT)**
* Q4: What is a valid syntax to access a single element in a dataframe, df?
  * df.iloc[:, 0:1]
  * df.loc[2:2]
  * df.iloc[1,1] **(CORRECT)**
  * df.iloc[0:1,1]
* Q5: What does the pandas function MultiIndex.from_tuples do?
  * Converts tuples to one column
  * Converts tuples to multiple columns
  * Converts a list of tuples to multi-index **(CORRECT)**
  * Converts tuples to a single index
* Q6: Which of the following is true?
  * You can add a maximum of five multi-index columns in a dataframe
  * A row cannot have more than one index
  * You can ass many multi-index columns in a dataframe as you like **(CORRECT)**
  * None of the above
* Q7: Consider the following code:
`multicol=pd.MultiIndex.from_tuples([('Country','University',StudentID')])`
Assuming this runs on dataframe df, how many columns will df have?
  * 1 **(CORRECT)**
  * 2
  * 3 **(INCORRECT)**
  * 0
* Q8: Consider the code:
`multirow=pd.MultiIndex.from_tuples([('Country','MIT','StudentID'), ('Country','UCL','StudentID')])`
Assuming this runs on dataframe df, how many rows will df have?
  * 1
  * 2 **(CORRECT)**
  * 3
  * 0

## Self Study Drag & Drop Activity 3.3: Different Ways to Modify a Dataframe

Sometimes, when data is presented to you in different files,
it may be convenient to **(combine)**
your dataframes for easier analysis.

There are two techniques that one can use to combine dataframes:
the **(union)** and the join.

The union is performed whenever you want to **(append)**
the **(columns)** of one dataframe to another.
Naturally, in order for this technique to work,
you must ensure that the dataframes contain **(exactly)** the same columns.

In pandas, the union can be performed by using the **(concat())** function.

On the other hand, the operation of combining columns in
different dataframes that
contain common values is called the **(join)**.

There are four different types of joins:
inner, outer, left, and **(right)**.

All of the joins work by
combining two dataframes based on a **(join key)**.

In the case of the inner join,
the resulting dataframes will contain only the rows that
have **(matching)** values in both of the original dataframes.

Conversely, when performing an outer join,
the resulting dataframe will contain **(all)** the rows from
the original dataframes and **(NaNs)**
where data is missing in one of the dataframes.

## Knowledge Check 3.7: Data Analysis & Time Zones in Pandas

* Q1: What is the default time that the `datetime` module returns?
  * local timezone
* Q2: Which function from the datetime module do you have to use to get time in UTC?
  * utcnow()
* Q3: Which module do you have to import to get the local time zone in Python?
  * tzlocal
* Q4: What does the value_counts function do in pandas?
  * It returns an object containing counts of unique values
Q5: Suppose your dataframe contains a column, 'time of day',
whose entries are in a 24-hour time format.
Suppose you want to extract values corresponding to the hours in the column.
What is the correct syntax to achieve this?
  * df['time of day'].dt.hour
Q6: What type of object does the value_counts() function return?
  * Series
Q7: Using the sum function
what is the difference between setting the argument axis equal to 0 or 1?
  * axis=0 sums over the columns, and axis=1 sums over the rows **(WRONG)**
  * axis=0 sums over the rows, and axis=1 sums over the columns **(CORRECT)**

## References

### Web Links

<!-- Hidden References -->

### Note Links

<!-- Hidden References -->
