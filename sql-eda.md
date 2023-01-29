---
created: 2023-01-26T10:08:58.298Z
modified: 2023-01-29T17:05:31.927Z
tags: [data,sql,analysis,eda,database,science,computers,pcde,module6]
---
# Exploratory Data Analysis in SQL

## Overview

Exploratory Data Analysis or **EDA** is of great importance when exploring data.
Using SQL makes the most sense when performing **EDA** as
it is *the* native language for *querying* data.
So let's go over the process shall we?

## Importing the Data

To load data & schema into a database:

```sh
export tmp_pass="yOuR-PaSsWorD"
mysql -u root -p $tmp_pass -e DROP bad_sakila IF EXISTS; CREATE DATABASE bad_sakila
mysql -u root -p $tmp_pass bad_sakila < bad-sakila-schema.sql
mysql -u root -p $tmp_pass bad_sakila < bad-sakila-data.sql
unset tmp_pass
```

Here we first create a temporary environment variable `tmp_pass` with
our password given to the root of the database.
Then we use that password and root user to login to
the database to run two SQL statements:
`DROP bad_sakila IF EXISTS` to remove the data & schema if it already exists,
`CREATE DATABASE bad_sakila` to recreate a new database to restore state.
Then we run two commands to load the schema then data files into the database.
Finally, `unset` the `tmp_pass` variable to
make sure your password isn't leaking.


### SHOW TABLE/DATABASE STATUS

There's a query that shows the status of a table and
it's a good command to start when looking at a database for the first time.
That is the `SHOW TABLE STATUS` query.

```sql
SHOW TABLE STATUS;
```

It will show all the tables in the database.
As well as their number of rows, data length, average row length, etc.

### Use SELECT to Find Number of Rows in Tables

Let's say we want a count of the number of films in the bad_sakila database.
We would count the rows of the table `film`.

```sql
SELECT COUNT(*) FROM film;
```

### Exploring the Relationship between Tables Using Joins 

We can do more than that we can bring together *join tables* of related tables.
Remember a many to many relation has a intermediary table of
a *1-to-many* relation between two other tables.
So let's say we want to find the relation between `film` & `category`.

```sql
SELECT COUNT(*), c.name
FROM film f -- f for film
JOIN film_category j -- j for join
    ON f.film_id = j.film_id
JOIN category c -- c for category
    ON c.category_id = j.category_id
GROUP BY c.name;
```

We `SELECT` the `COUNT` and `category.name`.
`FROM` the `film` table or `f` alias is where we'll first read from.
We want to group the name of the categories after all to
get the count of films in each category.

Then we'll `JOIN` that with the `film_category` or `j` table,
with the joining condition being both their `film_id`s are equal.
This brings the two tables together.
This is effectively a *join table* so we give it the alias `j`.

Next we'll bring those with the third table,
the `category` or `c` entries themselves,
by joining their `category_id`s.

Now we need to `GROUP BY` the name of the category,
or `GROUP BY c.name`.
This is to group together a list of category names to
`COUNT` to get a number of films of a category.

All this together we can get an idea of the amounts of data in each table and
even their relationships between each of the tables.

Let's do another example.
How many active customers are there?
We'll start by writing this query:

```sql
SELECT active, count(customer_id) as customers
FROM customer
GROUP BY 1;
```

We'll `SELECT` the `active` column which
represents whether a customer is active.
Then alias the count of each active/inactive customer `AS` `customers`.
We're taking the data from the `customer` table.
Then we'll `GROUP BY 1` to group together
the active and inactive customers seperately for a count.

Because of this query we no know how many customers are active or inactive.
However, this template can be used to discover just about any relation.

## Further Reading

Kaggle has a [wonderful jupyter notebook][eda-sql-kaggle] about
*EDA* using pandas, SQL, & matplotlib to explore the
[r/dataisbeautiful](https://www.reddit.com/r/dataisbeautiful/)
subreddit.
It tries to uncover...

* What are the most popular reddits?
* Which topics are viral?
* What posts have been removed and why?
* What % removed reddits are deleted by moderators?
* Who are the biggest spammers at Reddit?

## References

### Web Links

* [EDA using SQL (from Kaggle.com by Anny_KSKS)][eda-sql-kaggle]

<!-- Hidden References -->
[eda-sql-kaggle]: https://www.kaggle.com/code/olgaberezovsky/eda-using-sql/notebook "EDA using SQL (from Kaggle.com by Anny_KSKS)"

### Note Links

<!-- Hidden References -->

### Referenced By

* [PCDE Course Overview][pcde-overview-zk]
* [SQL Overview][sql-zk]

<!-- Hidden References -->
[pcde-overview-zk]: ./pcde-course-overview.md "PCDE Course Overview"
[sql-zk]: ./sql.md "SQL Overview"
