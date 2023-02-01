---
created: 2023-01-31T09:26:37.275Z
modified: 2023-01-31T13:10:11.759Z
tags: [sql,data,database,clean,process,pcde,module6]
---
# Data Cleaning in SQL

## Introduction

Cleaning data is one of the largest topics to cover when
working with data.
There's so many sources of data and
variability in how it's stored, organized, formatted, etc.
So there's various ways to get consistent data in your work.
So a large preoccupation of working in
data oriented fields is cleaning the data.

### Summary of Topic

* Data cleaning depends on the source the data is produced in
  * The sources can be various types of organizations & industries.
  * The process of data generation varies by them.
* There is a high likelihood that the generated data will be inconsistent.
* It is one of the biggest preoccupations of working with data

#### Link from PCDE Mini Lesson 6.2

This is a continuation of content that was moved from
[the PCDE course module content document][pcde-mod6-zk].

## Why is Data Cleaning Important?

Data often comes in a format that is not quite ready for efficient analysis.
In fact,
to perform an accurate analysis,
it is of paramount importance that the data is in a tidy format.

Regardless of the programming language you use,

>Data cleaning is the process of
>detecting and correcting (or removing) corrupt or
>inaccurate records from a record set, table or database and
>refers to identifying incomplete, inaccurate, incorrect, inaccurate or
>irrelevant parts of the data and then
>replacing, or deleting the dirty or coarse data
> -- [Wu, 2013][coarse-data-analysis-wu13]

## Cleaning Data in SQL

In a similar way as you have seen for Python,
cleaning data in SQL includes a set of
techniques that are normally performed by
developers when the data doesn't come in an easy to use format.

## Dealing with Different Data Types

As you have learned so far,
when a database is presented to you,
the most common data types are numeric, string and datetime.
In the case of numeric data types,
a problem you may encounter is that
the data comes in a numeric data type that
does not suit what that *property* really describes.

For example,
suppose you have a table with a column `Age` and
that this column contains *floats* so that
the ages are really written as 10.0, 34.0, etc.
In this case, it would be a good idea to convert these values to integers,
as it doesn't make sense to have an age expressed as *floats*.

Another issue may arise when dealing with zero values.
Consider the following example.
Suppose that your table also has a column titled `BloodPressure`,
that contains zero values.
This doesn't make sense either,
since the blood pressure of a living person cannot be zero.
In this case,
it would be a good idea to replace the zero values with more meaningful entries,
such as the average blood pressure for all the individuals in that table.
As in, imputing the data that is clearly corrupt or missing.

>**TODO: Relate this to a larger note on data cleaning in general**
>
>*and link to respective topics in the SQL and Python versions*

In general,
it is always important to deal with erroneous or NULL entries to
ensure an accurate analysis.
Like in Python,
the two most common techniques for data cleaning in SQL are:

* Removing the entries containing missing/null values
  * *Not recommended!*
* Imputing the missing / NULL entries with a numeric value
  * *(Typically the mean or median of the respective column)*

Another situation where
you may have problems when dealing with data that is not clean is table joining.
Consider the following scenario.
Suppose that you want to join two tables,
`MedicalRecords` and `Prognosis`,
on the key `PatientID`.
Assume further that `PatientID` is in integer format in the first table and
in *float* format in the second one.
When you try to join the two tables,
you will encounter an error because
the datatypes for the same column in each table are mismatched.

### Dealing with Strings

*String* values are also very common in databases.
An issue you may face is that within the dame column,
values that are supposed to represent the same value are written in
a different way.

For example,
in the `Medical Records` table above,
you may have a column `CardioExams`,
which represents the type of exam a patient had to undergo.
If this column contains values such as "EKG" or "ECG",
which both describe the same type of exam *(electrocardiogram)*,
this may cause inaccuracy when grouping data.

### Dealing with Dates & Times

The most common problem that arises when working with
data in a date or time format in SQL is that although
the entries appear in date or time format,
they are not actually saved as the appropriate data type.

A solution to this is to cast the original entries into
the proper format to allow manipulation and analysis.

In general, when cleaning data of any data type in SQL,
you must pay attention to the following:

* You must ensure that the data is in a proper format
in accordance with the quantity it represents.
* You must make sure that all erroneous, missing,
or NULL values are accounted for.
* You must make sure that the data across tables or
within each column is consistent.

### Further Reading & Reference

[Wu, Shaomin. "A Review on Coarse Warranty Data & Analysis". 2013][coarse-data-analysis-wu13]
<https://kar.kent.ac.uk/32972/1/LatestVersionV01.pdf>

## Movie Rental Database Example

We'll be taking a look at the *gender* column of
the *customer* database from the `bad_sakila` database.

```sql
SELECT gender
FROM customer;
```

If you look at the results,
you'll see a lot of different ways to
represent genders male and female.
Everything from `FEMALE`, `f`, `F`, `female`, `FEM` are used for
female customers.
This is a mess and we need to clean the data into a consistent value for
male or female customers.

In this case we'll use a `CASE` transformation to
transform various kinds of values into one consistent one.

## Using CASE to Transform Inconsistent Data

To clean data values,
we can use the `CASE` clause in a `SELECT` statement to
transform the inconsistent values of a gender column for female customers.

```sql
SELECT *,
CASE
    WHEN gender = 'FEMALE'  THEN 'female'
    WHEN gender = 'f'       THEN 'female'
    WHEN gender = 'FEM'     THEN 'female'
    ELSE gender
    END AS gender_cleaned
FROM customer;
```

We start with the old `SELECT` statement,
then we use the `CASE` clause followed by `WHEN-THEN` expressions to
search for different possible values for female.
The `THEN` expression then renames those values as `female`.
Then the `AS gender_cleaned` clause adds this labeled column of cleaned values.

Remember values for gender like this could come from
customers manually entering the data themselves.
Or any other inconsistent data source.
So it's often valuable to be able to validate the data like this.

## Cleaning Data through Categorization

We could also explore an example of creating categories for generations.
We might want to know which customers are
*greatest generation (born before 1945)*, *boomers (before 1964)*,
*Gen X (before 1976)*, *millennials (before 1995)*

```sql
SELECT *,
CASE
    WHEN birthdate < '1945-01-01'   THEN 'Greatest Generation'
    WHEN birthdate < '1964-01-01'   THEN 'Boomers'
    WHEN birthdate < '1976-01-01'   THEN 'Generation X'
    WHEN birthdate < '1995-01-01'   THEN 'Millennials'
    ELSE 'Generation Z'
    END AS generation
FROM customer;
```

This `CASE`-`WHEN`-`THEN` clause divides `birthdate`s into
generational categories.
This sort of procedure can be used to clean any kinds of data given to
a database.

## Coalescing NULLs

When you're trying to determine what NULL is,
because NULL is... NULL,
you need to do some interpreting.
Remember,
ideally NULL represents non-presence of data.

So let's start with the `film` table and its `original_language` column.
The below query returns a lot of *NULL* values in `original_language`
which makes it effectively worthless.
Let's determine that any *NULL* we see means that;
*the original language is unknown*.

```sql
SELECT *
FROM film;
```

Let's rewrite this query.
Start off by selecting columns: `title`, `rating`, `original_language_id`,
then for the final column,
`COALESCE` `original_language_id` *NULL*s into the string `unknown`.

```sql
SELECT title, rating, original_language_id,
COALESCE(original_language_id, 'unknown') AS OriginalLanguage
FROM film;
```

The `COALESCE` function is a built-in function that
*returns the first non-null value.*
As in,
you hand it a selected column and a value for it to *coalesce* to when null,
or to use the same column value given when it's non-null.

## REPLACE Records with new Values

Now to perform a similar type of inspection.
You will also want to look at certain columns and change something within them.
When looking at the `film` table again, but this time on the `rental_rate` column,
it shows the cost to rent the film as decimal numbers.
At least most of the time,
some values are strings with the `$` sign attached.
That's where the `REPLACE()` function comes in.

```sql
SELECT *,
    REPLACE(rental_rate, '$', '') AS clean
FROM film;
```

The `REPLACE()` function replaces an existing value with a new string.
And here we `REPLACE` any value in `rental_rate` containing `$` with `''`,
or an empty string to get rid of the dollar sign.
The first parameter in the function determines the column,
the second the substring to look for,
the third the string that replaces the substring.
The result is now a new column `clean` that
displays prices in consistent format, without losing data.

## Extracting Data from Columns

Sometimes cleaning data involves extracting data from one query then
using those results in aggregate within a cleaning query.
Though this example doesn't really clean data per se,
it demonstrates a way of using one query in another to transform data.

```sql
SELECT
    COUNT(*) AS count,
    FLOOR(YEAR(birthdate) / 10) * 10 AS decade
FROM customer
GROUP BY decade
```

Here we pull `birthdate` from `customer` table.
Then using the `FLOOR()` function to transform the values and
`GROUP`ing `BY` the relabeled decade you have transformed the
`birthdate` data and grouped it into decades and counts.
This data extraction can now be used to clean the data.

## Queries to Visually Validate Data and Queries

Sometimes you might need a sanity check on data.
In the above example where we extracted decade counts of birthdates,
we may wonder if a mistake was made in constructing the query.
Using that query as the basis for the next one,
let's see how it can instruct us on how to construct queries
that allow us to visually check if the query makes sense for the data.

```sql
SELECT
    -- COUNT(*) AS count,
    birthdate,
    FLOOR(YEAR(birthdate) / 10) * 10 AS decade
FROM customer
-- GROUP BY decade
ORDER BY decade, birthdate;
```

This will give a results table with the same data as the query before,
but it isn't aggregated.
Instead of `GROUP`ing the data,
we order it.
This way,
the disaggregated data is presented next to
the transformed version of the data, in this case the decade,
where we can visually inspect that the extracted decade is correct
for the passed on `birthdate`.
And it's easier to visually inspect when the dates are ordered.

Essentially the process of visual inspection of queries goes like this:

1. Reuse the query being validated
2. Undo the aggregation if it's an aggregate query for the columns in question.
3. Place the aggregate/transformed data side by side in the `SELECT` statement.
4. `ORDER BY` the `GROUP BY` column instead.
5. Examine the input data columns for the aggregate column...
6. Determine what input data going into transformed or aggregation queries.

## References

### Web Links

* [A Review on Coarse Warranty Data, Cleaning and Analysis (from Kent University by Shaomin Wu)][coarse-data-analysis-wu13]

<!-- Hidden References -->
[coarse-data-analysis-wu13]: https://kar.kent.ac.uk/32972/1/LatestVersionV01.pdf "A Review on Coarse Warranty Data and Analysis (from Kent University by Shaomin Wu)"

### Note Links

* [PCDE Course Module 6 Content][pcde-mod6-zk]

<!-- Hidden References -->

### Referenced By

* [SQL Overview][sql-zk]
* [PCDE Course Overview][pcde-overview-zk]
* [PCDE Course Module 6 Content][pcde-mod6-zk]

<!-- Hidden References -->
[sql-zk]: ./sql.md "SQL Overview"
[pcde-overview-zk]: ./pcde-course-overview.md "PCDE Course Overview"
[pcde-mod6-zk]: ./pcde-module6-content.md "PCDE Course Module 6 Content"
