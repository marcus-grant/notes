---
created: 2023-01-25T16:14:31.711Z
modified: 2023-02-01T16:05:07.605Z
tags: [pcde,module6,data,database,analysis,science,client,server,interface,computers,sql,programming]
---
# PCDE Module 6 Content: Database Analysis & the Client Server Interface

## Overview

In this course we will cover...

### Database Analysis Course Overview

* Data exploration
* Histograms
* Data binning
* Detecting duplicates
* Data cleaning
* Pivot tables
* Dealing with Strings
* Dealing with Dates

### Associated Notes

* [SQL Overview][sql-zk]
* [EDA in SQL][sql-eda-zk]
* [Visualizing Data in SQL][sql-vis-zk]
* [Cleaning Data in SQL][sql-clean-zk]

### Links

***TODO*** Please put these somewhere in your cloud and archives,
ideally on your bin as well.

#### Bad Sakila Database SQL Files

* [Bad Sakila schema file][pcde-bad-sakila-schema-dl-emeritus]
* [Bad Sakila data file][pcde-bad-sakila-data-dl-emeritus]

## Bad Sakila Database

### Bad Sakila Overview

We will be using the "Bad Sakila" Movie Rental database for this module.
It is based on the context of a movie rental business with
tables divided into 4 categories.
Those 4 categories are Customer data, Business, Inventory, & views.

![bad-sakila-db-diagram](2023-01-26-09-19-57.png "Bad Sakila Movie Rental DB Diagram")

* Customer data
  * Customer
    * *PK*: customer_id
    * *FK(s)*: store_id, address_id
    * dependents: first_name, last_name, email, active, create_date, last_update
  * Address
    * *PK*: address_id
    * *FK(s)*: city_id
    * dependents: address, address2, district, postal_code, phone, last_update
  * City
    * *PK*: city_id
    * *FK(s)*: country_id
    * dependent: city, last_update
  * Country
    * *PK*: country_id
    * *FK(s)*: null
    * dependents: country, last_update
* Business
  * Store
    * *PK*: store_id
    * *FK(s)*: manager_staff_id, address_id
    * dependents: last_update
  * Staff
    * *PK*: staff_id
    * *FK(s)*: address_id, store_id
    * dependents: first_name, last_name, picture, email, active,
username, password, last_update
  * Rental
    * *PK*: rental_id
    * *FK(s)*: inventory_id, staff_id, customer_id
    * dependents: rental_date, return_date, last_update
  * Payment
    * *PK*: payment_id
    * *FK(s)*: customer_id, staff_id, rental_id
    * dependents: amount, payment_date, last_update
* Inventory
  * Inventory
    * *PK*: inventory_id
    * *FK(s)*: film_id, store_id
    * dependents: last_update
  * Film
    * *PK*: film_id
    * *FK(s)*: language_id, original_language_id
    * dependents: title, description, release_year, rental_duration, rental_rate, length,
replacement_cost, rating, special_features, last_update
  * Film_category
    * *PK*: film_id + category_id
    * *FK(s)*: film_id, category_id
    * dependents: last_update
  * Category
    * *PK*: category_id
    * *FK(s)*: null
    * dependents: name, last_update
  * Language
    * *PK*: language_id
    * *FK(s)*: null
    * dependents: name, last_update
  * Actor
    * *PK*: actor_id
    * *FK(s)*: null
    * dependents: first_name, last_name, last_update
  * Film_actor
    * *PK*: actor_id + film_id
    * *FK(s)*: actor_id, film_id
    * dependents: last_update
  * Film_text
    * *PK*: film_id?
    * *FK(s)*: film_id?
    * dependents: title, description
* Views
  * film_list
  * nicer_but_slower_film_list
  * actor_info
  * sales_by_store
  * sales_by_film_category
  * stall_list
  * customer_list
  * film
    * film_in_stock
    * film_not_in_stock
  * Resources
    * get_customer_balance
    * inventory_held_by_customer
    * inventory_in_stock
    * rewards_report

## Discussion 6.1: The Bad Sakila Movie Rental Database (4:00)

### Prompt

In the last video,
Dr. Sanchez performed some queries to explore the Bad Sakila Data.

Now it is time for you to explore on your own.
Think about what other information you would want to
know about the data in a database and
what information would help you understand the database better.
In your initial discussion post,
list at least three new queries you can run to
locate specific information using the tables included in the database.
For each query:

* State the query that you would use (write the query as you would in SQL).
* Describe the data that would be output from the query.
* Explain why this query would be helpful in understanding the database.

In your discussion post,
be sure to share links to any websites that
were helpful to you as you considered what types of
queries data scientists and engineers typically use to better understand databases.

Read the statements posted by your peers.
Engage with them by responding with
thoughtful comments and questions to deepen the discussion.

**Suggested Time**: 4 minutes

**Suggested Length**: 150-200  words

This is a required activity and will count toward course completion.

### Post

I've heard of [kaggle.com](https://www.kaggle.com/) before and
have been interested in trying them out for a while now.
I thought this would be a good opportunity to learn about **EDA** by
using this platform and some of
the notebooks and writings their users contribute.

On that note,
a contributor known as *anny_ksks*,
has contributed [this great jupyter notebook][eda-sql-kaggle] that
explores the data within a great subreddit for our interests (I'll see you there),
[r/DataIsBeautiful][r-dataisbeautiful].

In it she asks some pertinent questions I suppose any good Data Engineer might:

>* What are the most popular Reddit's? Which topics are viral?
>* Which posts have been removed and why?
>* What % removed reddits are deleted by moderatos?
>* Who are the most popular authors?
>* Who are the biggest spammers at Reddit platform?

In this notebook I also learned something new about our old friend *pandas*,
it can be used to store results of queries by directly entering SQL into it.
You can even use SQL to query dataframes themselves.

These questions got me thinking about our `bad_sakila` database.

* Is english really the most common film language?
* What are the most filmed actors in this movie rental store?
* What customers the most obsessive about an actor(ess)?
  * *i.e which customer rents the most of a single actor(ess)?*

#### Is English the most common Film Language?

So let's get exploring.
First, the simple one, which film language is most common, is it english?
To do this we open the `film` database and join it with `language` `ON`
the `language.language_id` and `film.language_id` columns.

```sql
SELECT l.name, COUNT(f.language_id)
FROM film f
JOIN language l
    ON f.language_id = l.language_id
GROUP BY language_id;
```

Well that was underwhelming,
it seems this rental company only does english movies.
There's exactly 1000 english movies in the whole inventory.
This helps us understand we aren't dealing with cinema outside Hollywood.

| name    | COUNT(f.language_id) |
| ------- | -------------------- |
| English | 1000                 |

#### What are the most filmed actors in this movie rental company?

Who are the most filmed actors in this film inventory?
Again,
we return to the `film` table and
start `SELECT`ing actor names and a `COUNT` of film appearances as columns.
And now we are dealing with a more complicated *many-to-many* relationship,
`actor` to `film`.
So we'll need to join via a *join table*, `film_actor` `ON`
the `film_id` column.
Then join the `actor` and `film_actor` database `ON`
the `actor_id` columns.
Then `GROUP BY` the **join table**'s actor_id column because
this is where we get the count of film appearances of each actor.
Finally, we `ORDER BY` the aliased `films` column to
more easily see who has appeared in the most films.

```sql
SELECT a.last_name, a.first_name, COUNT(j.actor_id) AS films
FROM film f -- f for film
JOIN film_actor j -- j for join
    ON f.film_id = j.film_id
JOIN actor a -- a for actor
    ON a.actor_id = j.actor_id
GROUP BY j.actor_id
ORDER BY films DESC;
```

This was an expensive join statement.
On my macbook with M1 CPU it took me just over a minute to get the answer.
Below is the first 12 rows of the *join table* that answers our question.
*Gina Degeneres* appears in the most films in our inventory.
Looking further down the table we see a lot of reoccurrences.
This tells us that the data is somewhat concentrated around
the same groupings of actors.

| last_name   | first_name | films |
| ----------- | ---------- | ----- |
| DEGENERES   | GINA       | 42    |
| TORN        | WALTER     | 41    |
| KEITEL      | MARY       | 40    |
| CARREY      | MATTHEW    | 39    |
| KILMER      | SANDRA     | 37    |
| DAMON       | SCARLETT   | 36    |
| BASINGER    | VIVIEN     | 35    |
| WITHERSPOON | ANGELA     | 35    |
| WOOD        | UMA        | 35    |
| BERRY       | HENRY      | 35    |
| DUNST       | GROUCHO    | 35    |
| BOLGER      | VAL        | 35    |

#### What customers the most obsessive about an actor(ess)?

This one is a bit of fun,
which customer is most obsessed about an actor or actress?
We can figure this out by
checking out which customer has rented out
the most films starring one actor or actress.

I thought I'd open this up for discussion as it is quite complex.
How do we get this relationship setup in a query?
We have a set of relationships that lead us from `customer` to `actor`.

* `actor` is related to `film_actor`.
* `film_actor` is related to `film`.
* `film` is related to `inventory`.
* `inventory` is related to `rental`.
* `rental` is related to `customer`.

Would you just chain several joins together by their *foreign keys* to
finally arrive at the `GROUP BY` statement that gives us a `customer_id`
that has rented the most of any one `actor_id`?

A query like this would be expensive,
but this is the sort of relationship that can be really valuable to
a business like a movie rental company.
It tells us what movies customers are most likely to rent,
and thus make a rental more likely if advertised to.

### Replies

***TODO*** Add your replies

## Knowledge Check 6.1: Exploring a Database (30:00)

### Q1

Which SQL statement would you use to create a schema?

* INSERT schema schema_name
* ADD schema schema_name
* ADD if not exists schema schema_name
* CREATE schema schema_name
  * **Correct**

### Q2

Which SQL statement would you use to access a database before
exploring tables in that database?

* GO INSIDE db_name
* SELECT db_name
* USE db_name
  * **Correct**
* GET db_name

### Q3

Which SQL statement could you use to get an overview of
all the tables in a database?

* SHOW TABLE OVERVIEW
* SHOW TABLE INFO
* SHOW TABLE DESIGN
* SHOW TABLE STATUS
  * **Correct**

### Q4

Which SQL statement can be used to count the number of rows in a table?

* SELECT COUNT(rows) FROM table_name
* SELECT COUNT(*) FROM table_name
  * **Correct**
* SELECT rows FROM table_name
* SELECT num_rows FROM table_name

## Codio Coding Activity 6.1: Exploring a Dataset Using SQL (45:00)

### 1. Codio Coding Activity 6.1: Exploring a Dataset using SQL

#### Select The Database

To avoid mistakes,
you are strongly advised to select the database before attempting any question.
You can do so using the syntax:

```sql
USE database_name
```

#### Load the Database

To load the database,
type the following in the Terminal window:

```sql
source bad-sakila-schema.sql
source bad-sakila-data.sql
```

#### Resetting the Terminal

If something glitches in the Terminal window,
the workaround is to terminate the command with ; + Enter.
Alternatively you can navigate to the next page and
then back to the one you were working on.
Both of these options will reset the Terminal.

### 2. The Bad Sakila Database

#### The Bad Sakila Database

Throughout this activity,
you will be working with the `bad_sakila` database that you have explored in
the last three videos.

In the file window,
type the correct commands to
visualize all the tables present in the bad_sakila database.

#### Solution

```sql
USE bad_sakila;
SHOW TABLES;
```

How many tables are in the bad sakila database? 16

### 3. Showing the Status of the Tables

Showing the Status of the Tables

Rearrange the code blocks below to
view the status of the tables in the bad sakila dataset.

Hint: You won’t use all of the blocks.

You will have three attempts to complete this question.
After your final attempt,
you will be able to view the correct answers for each item.

#### Solution

```sql
USE bad_sakila;
SHOW TABLE STATUS;
```

### 4. Familiarizing With Your Data I

After loading a database,
the next logical step is to familiarize yourself with your data.

Suppose that you want to know
how many actor_id records are stored in the table actor.

In the file window,
type the commands to display the number of actors across the database.

The result should be:

```txt
+----------+
| COUNT(*) |
+----------+
|      200 |
+----------+
```

#### Solution

```sql
USE bad_sakila;
SELECT COUNT(*)
FROM actor;
```

### 5. Familiarizing With Your Data II

Next, suppose you want to know the number of different languages spoken in
the movies in the database.

In the file window,
type the commands to display the number of languages across the database.

The results should be:

```txt
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+
```

#### Solution

```sql
USE bad_sakila;
SELECT COUNT(*)
FROM language;
```

### 6. Familiarizing With Your Data III

Display the Language Table

What is the command to show the records in the language table?

Hint: You won’t use all of the blocks.

You will have three attempts to complete this question.
After your final attempt,
you will be able to view the correct answers for each item.

### 7. Filtering Query Results I

Now,
let’s work on filtering the records in
the bad sakila database using more advanced queries.

NOTE: For the next two exercises,
you will need to utilize some concepts that you learned in Modules 4 and 5.

Suppose you want to retrieve the rows in the actor table where
the last_name column values have GEN somewhere in the last_name value.

Ensure that the resulting table contains
the columns actor_id, first_name, and last_name.

In the file window,
type the correct commands to retrieve the records in
the actor table as described above. Remember to select the database first!

Results:

```txt
+----------+------------+-----------+
| actor_id | first_name | last_name |
+----------+------------+-----------+
|       14 | VIVIEN     | BERGEN    |
|       41 | JODIE      | DEGENERES |
|      107 | GINA       | DEGENERES |
|      166 | NICK       | DEGENERES |
+----------+------------+-----------+
```

#### Solution

```sql
USE bad_sakila;
SELECT actor_id, first_name, last_name
FROM actor
WHERE
    last_name LIKE "%GEN%";
```

### 8. Filtering Query Results II

Next,
suppose you want to find all actors whose last names contain the letters LI.
This time,
order the rows by last name and first name, in that order.

Ensure that the resulting table contains the columns first_name and last_name.

After typing the correct queries in the Terminal you should see the following output:

```txt
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| GREG       | CHAPLIN   |
| WOODY      | JOLIE     |
| AUDREY     | OLIVIER   |
| CUBA       | OLIVIER   |
| GROUCHO    | WILLIAMS  |
| MORGAN     | WILLIAMS  |
| SEAN       | WILLIAMS  |
| BEN        | WILLIS    |
| GENE       | WILLIS    |
| HUMPHREY   | WILLIS    |
+------------+-----------+
```

#### Solution

```sql
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;
```

### 9. Joining Tables I

In the next exercise,
you will be using the tables film, film_actor from the bad_sakila database.

For your convenience, see below the ER diagram for the bad_sakila database.

Suppose you want to know how many films each
actor with the same first name participated in.

In the file window,
type the commands to retrieve the records as described above.

HINT: Before trying the exercise,
use the command SHOW COLUMNS FROM table_name;
to visualize all the columns in each table. Join the tables.

#### Solution

```sql
USE bad_sakila;
SELECT COUNT(*), a.first_name
FROM film f
JOIN film_actor j
    ON f.film_id = j.film_id
JOIN actor a
    ON a.actor_id = j.actor_id
GROUP BY a.first_name;
```

## Codio Coding Activity 6.2: Histograms in SQL (45:00)

### 1. Codio Coding Activity 6.2: Histograms in SQL

Select The Database
To avoid mistakes, you are strongly advised to
select the database before attempting any question.
You can do so using the syntax:

```sql
USE database_name
```

Select The Database
To create the database, type the following in the Terminal window:

```sql
source sakila-schema.sql
source sakila-data.sql
```

### 2. The Sakila Database

Throughout this activity, you will be working with the sakila database.
In the Terminal window, type the commands to select the database.

### 3. Counting I

Here,
you will be challenged to retrieve the inventory ID for
each movie in the rental table.
For your convenience, this is what the rental table looks like:

* rental_id INT
  * rental_date DATETIME
  * inventory_id MEDIUMINT
  * customer_id SMALLINT
  * return_date DATETIME
  * staff_id TINYINT
  * last_update TIMESTAMP

In the file window,
type the commands to retrieve the inventory ID for each movie in the rental table.

Typing the correct queries in the Terminal will return a very long table with
over 4,000 entries.
Here is a display of the last 10 rows for your reference.

+--------------+---------+
|         4572 |       4 |
|         4573 |       5 |
|         4574 |       3 |
|         4575 |       4 |
|         4576 |       4 |
|         4577 |       5 |
|         4578 |       3 |
|         4579 |       5 |
|         4580 |       2 |
|         4581 |       5 |
+--------------+---------+

#### Solution

```sql
USE sakila;
SELECT inventory_id, count(rental_id) as rentals
FROM rental
GROUP BY 1
```

### 4. Counting II

In this exercise,
you will use the film_actor table to
count how many times an actor has performed in different movies.

**HINT**:
Before trying the exercise,
use the command `SHOW COLUMNS FROM table_name;` to
visualize all the columns in each table. Join the tables.

In the file window on the left,
type the correct command to
retrieve records according to the instructions above.

The output should be:

```txt
+----------+-------+
| actor_id | films |
+----------+-------+
|        1 |    19 |
|        2 |    25 |
|        3 |    22 |
|        4 |    22 |
|      ... |   ... |
|      195 |    27 |
|      196 |    30 |
|      197 |    33 |
|      198 |    40 |
|      199 |    15 |
|      200 |    20 |
+----------+-------+
```

#### Solution

```sql
USE sakila;
SELECT actor_id, COUNT(film_id) AS films
FROM film_actor
GROUP BY actor_id;
```

### 5. Producing a Histogram I

Now,
let’s create a histogram that
displays the number of movies each actor has acted in.

First find in how many movies each actor has performed in.
Then aggregate the number of
actors per each amount of films using these results of your first query.

In the file window on the left,
type the correct command to
retrieve records according to the instructions above.

#### Solution

```sql
USE sakila;
SELECT films, COUNT(*) AS num_actors, RPAD('', COUNT(*), '*') AS bar
FROM (
    SELECT actor_id, COUNT(film_id) AS films
    FROM film_actor
    GROUP BY actor_id
) a
GROUP BY 1;
```

### 6. Producing a Histogram I

In the next exercise,
you will produce a histogram of the city table.

For your convenience,
the columns on the city table are displayed below:

```txt
+-------------+----------------------+------+-----+-------------------+-----------------------------+
| Field       | Type                 | Null | Key | Default           | Extra                       |
+-------------+----------------------+------+-----+-------------------+-----------------------------+
| city_id     | smallint(5) unsigned | NO   | PRI | NULL              | auto_increment              |
| city        | varchar(50)          | NO   |     | NULL              |                             |
| country_id  | smallint(5) unsigned | NO   | MUL | NULL              |                             |
| last_update | timestamp            | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
+-------------+----------------------+------+-----+-------------------+-----------------------------+
```

The correct queries should produce the following output:

```txt
+------------+---------------+--------------------------------------------+
| num_cities | num_countries | bar                                        |
+------------+---------------+--------------------------------------------+
|          1 |            42 | ****************************************** |
|          2 |            19 | *******************                        |
|          3 |            14 | **************                             |
|          4 |             4 | ****                                       |
|          5 |             5 | *****                                      |
|          6 |             4 | ****                                       |
|          7 |             4 | ****                                       |
|          8 |             3 | ***                                        |
|         10 |             1 | *                                          |
|         11 |             1 | *                                          |
|         13 |             2 | **                                         |
|         14 |             1 | *                                          |
|         15 |             1 | *                                          |
|         20 |             1 | *                                          |
|         28 |             2 | **                                         |
|         30 |             1 | *                                          |
|         31 |             1 | *                                          |
|         35 |             1 | *                                          |
|         53 |             1 | *                                          |
|         60 |             1 | *                                          |
+------------+---------------+--------------------------------------------+
```

#### Solution

```sql
SELECT num_cities, COUNT(*) AS num_countries, RPAD('', COUNT(*), '*') as bar
FROM (
    SELECT country_id, COUNT(city_id) AS num_cities
    FROM city
    GROUP BY country_id
) a
GROUP BY 1;
```

## Knowledge Check 6.2: Histograms in SQL (30:00)

* Q1: Which of the following Python libraries can be used to plot histograms?
  * [ ] Plotpython
  * [x] Matplotlib
  * [x] Seaborn
  * [ ] Histoplot
* Q2: Which padding function is used in SQL to plot histograms?
  * PAD
  * RPAD
    * **Correct**
  * PADDING
  * RPADDING
* Q3: What is a histogram?
  * An average of all the data points?
  * A summary of all the data points?
  * A graphical representation that
organizes a group of data points into user-specified ranges
    * **Correct**
  * A mathematical concept that provides the mean & median of the data points
* Q4: Which SQL library is used to plot histograms in SQL?
  * Seaborn
  * Unlike python, SQL does not support or use any libraries to create histograms
    * **Correct**
  * Matplotlib
  * Any SQL can be used

## Knowledge Check 6.3: Handling Duplicates (30:00)

* Q1: How do you group data into different bins in a SQL query?
  * By using the HAVING clause
  * By using the WHERE clause
  * By using the SELECT clause
  * By using the CASE statement
    * **Correct**
* Q2: Which one of the following is the correct example of
grouping `age_date` into three bins
(< 30, 30~60, >60) and getting the count of the number of rows for each?

```sql
SELECT CASE
  WHEN age<30 THEN ‘less than 30’
  WHEN (age>=30 AND age<=60) THEN ‘30-60’
  ELSE ‘greater than 60’
  END AS age_bracket, count(*)
FROM age_data
```

* Q3: Which SQL function can be used to identify duplicates in the data?
  * average()
  * count(*)
    * **Correct**
  * sum()
  * add()

## Codio Coding Activity 6.3: Handling Duplicates in SQL (45:00)

### 1. Codio Coding Activity 6.3: Handling Duplicates in SQL

Select The Database
To avoid mistakes,
you are strongly advised to select the database before attempting any question.
You can do so using the syntax:

```sql
USE database_name
```

Select The Database

To create the database,
type the following in the Terminal window:

```sql
source bad-sakila-schema.sql
source bad-sakila-data.sql
```

### 2. The Bad Sakila Database

The Bad Sakila Database
Throughout this activity,
you will be working with the bad_sakila database.

In the Terminal window,
type the commands to select the database.

### 3. Binning I

As you learned in Video 6.5,
binning is a grouping strategy that
groups information within an interval into bins.

You will start by considering the city table in the bad_sakila database.

In the file window,
write a query to show a table that contains the
columns country_id and city.
Order the entries in the column country_id in descending order.

Type the correct command to retrieve records according to the instructions above.

After typing the correct commands, the last few records should be:

```txt
|          6 | Baha Blanca                |
|          6 | Cordoba                    |
|          6 | Escobar                    |
|          6 | Ezeiza                     |
|          6 | La Plata                   |
|          6 | Merlot                     |
|          6 | Quilmes                    |
|          6 | San Miguel de Tucuman      |
|          6 | Santa F                    |
|          6 | Tannic                     |
|          6 | Vicente Lopez              |
|          5 | South Hill                 |
|          4 | Bengal                     |
|          4 | Namibia                    |
|          3 | Fauna                      |
|          2 | Patna                      |
|          2 | Bihar                      |
|          2 | Skids                      |
|          1 | Kabul                      |
+------------+----------------------------+
```

#### Solution

```sql
USE bad_sakila;
SELECT country_id, city
FROM city
ORDER BY country_id DESC;
```

### 4. Binning II

Now, suppose that you want to
group the entries of the table produced in
the previous exercise based on the starting letter of
the country the city is located in.

Before doing so,
it’s helpful to retrieve a table that summarizes the country
and its corresponding country_id.

The correct answer should result in:

```txt
+---------------------------------------+------------+
| country                               | country_id |
+---------------------------------------+------------+
| Afghanistan                           |          1 |
| Algeria                               |          2 |
| American Samoa                        |          3 |
| Angola                                |          4 |
| Anguilla                              |          5 |
| Argentina                             |          6 |
| ...                                   |        ... |
| Yemen                                 |        107 |
| Yugoslavia                            |        108 |
| Zambia                                |        109 |
+---------------------------------------+------------+
```

#### Solution

```sql
SELECT country, country_id
FROM country
ORDER BY country_id DESC;
```

### 5. Binning III

Now it’s time for you to bin the cities based on their country ID.

Bin the entries of
the table you have produced in Question 3 with
columns country_id and city in the following way:

* if country_id is lesser or equal than 10, then write ‘Country starts with A’
* if country_id is between 11 and 17, then write ‘Country starts with B’
* if country_id is between 18 and 27, then write ‘Country starts with C’
* if country_id is between 28 and 43, then write ‘Country starts with D, E, F, G, or H’
* if country_id is between 44 and 70, then write ‘Country starts with I, J, K, L, M, or N’
* if country_id is between 71 and 91, then write ‘Country starts with O, P, R, or S’
* if country_id is between 92 and 109, then write ‘Country starts with T, U, V, Y, or Z’

Make sure that the resulting table has columns bin and count.

The result should be:

```txt
+-----------------------------------------+-------+
| bin                                     | count |
+-----------------------------------------+-------+
| Country starts with A                   |    28 |
| Country starts with B                   |    39 |
| Country starts with C                   |    80 |
| Country starts with D, E, F, G, or H    |    34 |
| Country starts with I, J, K, L, M, or N |   200 |
| Country starts with O, P, R or S        |   111 |
| Country starts with T, U, V, Y, or Z    |   108 |
+-----------------------------------------+-------+
```

#### Solution

```sql
SELECT
    CASE WHEN country_id <= 10 THEN 'Country starts with A'
    WHEN country_id <= 17 THEN 'Country starts with B'
    WHEN country_id <= 27 THEN 'Country starts with C'
    WHEN country_id <= 43 THEN 'Country starts with D, E, F, G, or H'
    WHEN  country_id <= 70 THEN 'Country starts with I, J, K, L, M, or N'
    WHEN country_id <= 91 THEN 'Country starts with O, P, R or S'
    ELSE 'Country starts with T, U, V, Y, or Z'
    END AS bin,
    COUNT(*) AS  count
FROM (
    SELECT country_id, city
    FROM city
    ORDER BY country_id DESC
) a GROUP BY 1;
```

## Mini Lesson 6.2: Cleaning Data in SQL

### Why is Data Cleaning Important?

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

### Cleaning Data in SQL

In a similar way as you have seen for Python,
cleaning data in SQL includes a set of
techniques that are normally performed by
developers when the data doesn't come in an easy to use format.

For further reading,
read the [notes on Cleaning Data in SQL][sql-clean-overview-sect-zk]

### Dealing with Different Data Types

As you have learned so far,
when a database is presented to you,
the most common data types are numeric, string and datetime.
In the case of numeric data types,
a problem you may encounter is that
the data comes in a numeric data type that
does not suit what that *property* really describes.

## Self-Study Drag & Drop Activity 6.1: Cleaning Data (25:00)

Data often comes in a format that is not quite ready for
an efficient **(analysis)**.
In fact,
to perform an accurate analysis,
it is of paramount importance that the data is in a tidy format.

Data **(cleaning)** is the process of identifying and then correcting,
**(removing)**, or replacing inaccurate data from a database.
Cleaning data in SQL includes a set of techniques to
perform when the data doesn’t come in an easy-to-use format.

The most common data types in a database are numeric,
**(string)**, or datetime.

In the case of **(numeric)** data types,
a problem you may encounter is that the data comes in
a numeric data type that
does not suit what that **(property)** really describes.
To solve this problem,
you can convert values to be presented consistently and accurately in
a data type that makes sense for that type of data.

Another issue may arise when dealing with zero **(values)**,
particularly if the data could not possibly be a value of zero,
such as heart rate, for example.
In this case,
it would be a good idea to replace the zero values with more meaningful entries,
such as the average blood pressure for all the individuals in that table.

In general,
it is always important to deal with erroneous or **(NULL)** entries to
ensure an accurate analysis.
This can be done in one of two ways:
removing the entries containing missing/null values or
imputing the missing/null entries with
an **(average)** numeric value.

Another situation where you may have problems when dealing with
data that is not clean is table **(joining)**.
If you want to join two tables,
you must ensure that the column you are using to
join them is using the same data type format in order to avoid an error.

String values are also very common in **(databases)**.
An issue you may face is that within the same column,
values that are supposed to
represent the same value are written in a different way.

If a column contains values that are supposed to match,
but they are entered in a different **(format)**,
then they may not be grouped together as intended.
For example,
consider you have a **(column)** that contains data representing a type of
medical exam,
but the column contains different values that mean the same exam but
are entered differently.
If this column contains values such as “EKG” or “ECG,”
which are supposed to describe the same type of exam,
this may cause inaccuracy when **(grouping)** data.

The most common problem that arises when working with
data in a **(date)** or time format in SQL is that although
the entries appear in date or time format,
they are not actually saved as the appropriate **(data type)**.
A solution to this is casting the original entries into
the proper format to allow manipulation and analysis.

In general,
when cleaning data of any data type in SQL,
you must pay attention to a few key factors.
You must ensure that the data is in a proper format in
accordance with the quantity it represents.
You must make sure that all erroneous,
**(missing)**, or NULL values are accounted for.
You must make sure that the data across tables or within each column is consistent.

## Codio Coding Activity 6.4: Cleaning Data Using SQL (45:00)

### 1. Codio Coding Activity 6.4: Cleaning Data in SQL

#### Select The Database

To avoid mistakes,
you are strongly advised to select the database before attempting any question.

You can do so using the syntax:

```sql
USE database_name
```

If the database doesn’t load, type the following in the Terminal window:

```sql
source schools.sql
```

### 2. The School Database

#### The Schools Database

Throughout this activity,
you will be working with the Schools database.
In the Terminal window,
type the commands to select the database.

#### Solution

```sql
USE Schools;
```

### 3. Problems With Numbers and Dealing With Them

Let’s now take a look at the most common problems that
you may face if you don’t clean the messy data

#### Data Aggregation

Suppose that you have NULL entries for a numeric column and
you are calculating summary statistics
(like the mean, the maximum, or the minimum values) on that column.
Because of the NULL entries,
the results will not get conveyed accurately in this case.
There are several ways on how to address this problem:

* Remove the entries containing missing/null values (not recommended).
* Impute the null entries with a numeric value
  * (typically with mean or median of the respective column).

You will start by considering the entries table in the School database.

The resulting table should be:

```txt
+-----------+---------------+--------------+
| name      | weight_in_lbs | age_in_years |
+-----------+---------------+--------------+
| Christina |         80.60 |         NULL |
| Matthews  |          NULL |           19 |
| Gilbert   |        100.60 |           21 |
+-----------+---------------+--------------+
```

#### Solution

```sql
SELECT * FROM Entries;
```

### 4. Compute the Average Weight

In the file window,
type the correct commands to get the average weight value from the Entries table.
Make sure that the output entry has a column named average_weight_in_lbs.

The result should be:

```txt
+-----------------------+
| average_weight_in_lbs |
+-----------------------+
|             90.599998 |
+-----------------------+
```

#### Solution

```sql
USE Schools;
SELECT
  AVG(weight_in_lbs) AS average_weight_in_lbs
FROM Entries;
```

### 5. Introducing the COALESCE keyword

The MySQL `COALESCE()` function is used for
returning the first non-null value in a list of expressions.
If all the values in the list evaluate to NULL,
then the COALESCE() function returns NULL.

The COALESCE() function accepts one parameter which
is the list which can contain various values.
COALESCE() returns the first non-null value in a list of
expressions or NULL if all the values in a list are NULL.

The syntax for using this function is:

```sql
COALESCE(value_1, value_2, ...., value_n)
```

where value_1 is used to specify the first value in the list.

Rearrange the code blocks below so that
the table Entries contains an extra column,
corrected_weights, containing not NULL entries for
the weights of the students.

Round the average value computed in the previous questions to one decimal digit.

Hint: You won’t use all of the blocks.

The result should be:

```txt
+-----------+---------------+--------------+-------------------+
| name      | weight_in_lbs | age_in_years | corrected_weights |
+-----------+---------------+--------------+-------------------+
| Christina |         80.60 |         NULL |             80.60 |
| Matthews  |          NULL |           19 |             90.60 |
| Gilbert   |        100.60 |           21 |            100.60 |
+-----------+---------------+--------------+-------------------+
```

#### Solution

```sql
SELECT *,
  COALESCE(weight_in_lbs, 90.6) AS corrected_weights
  FROM Entries;
```

### 6. Table Joins I

Suppose now you want to work with
the tables `Students` and `Departments` from the `Schools` database.

For you convenience, the tables are displayed below:

`Students` Table

```txt
+-----------+-------+--------+
| studentID | name  | deptID |
+-----------+-------+--------+
|         1 | Rick  |    100 |
|         2 | Rosa  |    100 |
|         3 | Steve |    101 |
+-----------+-------+--------+
```

`Departments` table:

```txt
+--------+------------------+--------------+
| deptID | dept_name        | dept_head    |
+--------+------------------+--------------+
| 100    | Computer Science | Alex Manning |
| 101    | Economics        | Rosa Smith   |
+--------+------------------+--------------+
```

What is the data type in the column `deptID` in
the `Students` & `Departments` table?

#### Solution

```sql
USE Schools;
SHOW COLUMNS FROM Students;
SHOW COLUMNS FROM Departments;
```

**Answer**: deptID is of type integer in
the Students table and varchar in the Departments tables.

### 7. Table Joins II

Suppose that now you want to join these two tables and
want to produce a report which will contain the following columns:

* studentID
* name
* dept_name

Before joining the tables,
you must cast the `deptID` column in the Departments table to
the same data type as the one stored in the `deptID` column in
the Students table before performing the join.

To cast columns,
you can use the CAST function in MySQL.
The syntax for this function is:

```sql
CAST(table_name.column_name as data_type_name)
```

**NOTE:** MySQL does not support casting to integers.
Therefore the deptID column in Departments will
be converted to the data type UNSIGNED.

After typing the correct commands in
the Terminal window you should see the following:

```txt
+-----------+-------+------------------+
| studentID | name  | dept_name        |
+-----------+-------+------------------+
|         1 | Rick  | Computer Science |
|         2 | Rosa  | Computer Science |
|         3 | Steve | Economics        |
+-----------+-------+------------------+
```

#### Solution

```sql
USE Schools;
SELECT studentID, name, dept_name
FROM Students
JOIN Departments ON
Students.deptID = cast(Departments.deptID AS UNSIGNED);
```

### 8. Cleaning Strings

Cleaning string values is also something that comes up very often.
Let’s start this section by looking at the values of
a column `dept_name` taken from a table named `Student_details`:

Run the following query in the Terminal window:

```sql
SELECT * FROM  Student_details;
```

You should see the output:

```txt
+----+---------+------------------------+
| id | name    | dept_name              |
+----+---------+------------------------+
|  1 | Alex    | I.T.                   |
|  2 | Hugo    | Information Technology |
|  3 | Stephen | i.t                    |
|  4 | Anne    | C.S.E                  |
|  1 | John    | C.S.E                  |
+----+---------+------------------------+
```

String values like the above can cause a lot of unexpected problems.
`I.T`, `Information Technology`, and
`i.t` all mean the same department, Information Technology.

Suppose you want to count the number of students belonging to
the department of Information Technology and you run this query:

```sql
SELECT dept_name, count(dept_name) AS student_count
FROM Student_details
GROUP BY dept_name;
```

The above query returns:

```txt
+------------------------+---------------+
| dept_name              | student_count |
+------------------------+---------------+
| C.S.E                  |             2 |
| i.t                    |             1 |
| I.T.                   |             1 |
| Information Technology |             1 |
+------------------------+---------------+
```

This is not an accurate report as you know that
`I.T`, `Information Technology`, and `i.t` all mean the same department.

Let’s first identify the problem in a more detailed way:

* `Information Technology` is a value which should be converted to `I.T.`
* `i.t` is another value which should be converted to `I.T.`

After typing the correct commands in
the Terminal window you should see the following output:

```txt
+--------------+---------------+
| dept_cleaned | student_count |
+--------------+---------------+
| C.S.E        |             2 |
| I.T.         |             3 |
+--------------+---------------+
```

#### Solution

```sql
SELECT
  UPPER(REPLACE(dept_name, 'Information Technology', 'I.T.'))
    AS dept_cleaned,
  COUNT(dept_name) AS student_count
FROM Student_details
GROUP BY dept_cleaned;
```

## Mini Lesson 6.3 Functions to Handle Date & Time

The details of this document are handled by
[the notes on date & time in SQL][sql-date-zk].

## Client Server Interface Notes

The next few segments involve lectures/activities on
the client server architecture.
This involves understanding how a client and server communicate.
And how to use drivers to connect software stacks like Python to MySQL
as an example.

To read further, check out the
[overview notes on the client server architecture][client-server-zk].

## Knowledge Check 6.4: The Client–Server Interface (20:00)

* Q1: What is the program of choice to
interface the database before connecting to a server?
  * MySQL workbench
    * **Correct**
  * MySQL Server
  * MySQL
    * **INCORRECT**?
  * Python Server
* Q2: What is a server?
  * a computer that uses resources from a client
  * a computer that stores data
  * a computer that shares resources
    * **Correct**
  * a computer that is used to edit databases
* Q3: What is the primary function of a client-server interface?
  * compute small-scale computations
  * allow users on different servers' machines to access a db on a server machine
  * use diff drivers on diff clients' machines to access db on a server machine
  * allow users on diff clients' machines access a db on a server machine
    * **Correct**
* Q4: Drivers are:
  * software related to hard drive capacity
  * software related to hardware
    * **Correct**
  * software related to ram memory
  * software related to software

## Knowledge Check 6.5: Reading and Writing Tables Using a Driver (30:00)

* Q1: Which of the following is an example of
a command line client used for accessing a MySQL database?
  * MySQL Shell
    * **Correct**
  * not possible to connect to a db from cli client
  * MySQL Note
  * MySQL Workbench
* Q2: Which of the following can't be a filed in a connection string?
  * password
  * database
  * port
    * **Correct**
  * host
* Q3: Which python package is used to connect to the mysql database from Python?
  * connect
  * network_sql
  * connectwithmysql
  * mysql.connector
    * **Correct**
* Q4: When connecting to a database from Python which of the following is required?
  * All answers are correct
    * **Correct**
  * username & password
  * host name
  * database name

## Try It Activity 6.1

### Prompt

For this Try-It activity,
you will review Videos 6.16 and 6.17 and
follow the steps demonstrated by Dr. Sanchez to first read a table in
the Education database using a driver and
then write data using a driver.
Next,
you will write a query of your choice to practice writing data using a driver.

Discussion Prompt:

Now that you have experimented with Try-It Activity 6.1,
share your experience with your peers:

* What table did you choose and which query did you create?
* How would this query be useful?
* Did you run into any difficulty with either reading or writing data using a driver?
  * If so, how did you navigate a solution to the problem you encountered?
* Make sure you describe all the steps you have followed and include the code you have written.

Read the statements posted by your peers.
Engage with them by responding with
thoughtful comments and questions to deepen the discussion.

Suggested Time: 50 minutes

Suggested Length: 150-200 words

This is a required activity and will count toward course completion.

### Written Discussion

#### What table did you choose and which query did you create?

I chose the `Students` table to perform the query.
And the query I chose is actually quite simple:

```sql
SELECT * FROM Students;
```

I want to select all records from the Students table so
that I can create a list of dictionaries in python.
Because it's generally easier to transform data in python,
I wanted to try to play with all the records from this table in it.

### How would this query be useful?

Because it can sometimes be easier to play with data in python,
particularly when it comes to analysis,
this query is useful to pull all records' columns from a database so
that it can be stored into some kind of Python collection.
In this case I created a `students` list of dictionaries.
Each dictionary represents one student's record in the table,
and the dictionary has a key representing each column in the table.

Then to demonstrate how using this query can be useful because
it moves data processing into the realm of python instead of SQL,
I chose to print the full names of each students' friend which
is much more human readable than a `FriendID`.

### Did you run into any difficulty with either reading or writing data using a driver?

The code and results of the query is in the below section.
You'll note that each of these full names are template strings that
are much easier to perform in Python than SQL.
And it's generally, at least for me,
much easier to work with dictionaries than tables and columns so
it took little time for me to construct this program than if it was a SQL query.

So *no*,
I actually enjoyed playing with the data in Python more than in SQL by
using the python driver and cursor.
I even setup a little `input()` function above to enter my local MySQL server's
root password so it isn't getting stored in plaintext on
my private git repository that stores my course work.

### Make sure you describe all the steps and include the code you have written

Here is the Python code.

```python
password = input('Please enter your MySQL password: ')
cnx = mysql.connector.connect(user='root',
    password=password,
    host='127.0.0.1',
    database='education',
    auth_plugin='mysql_native_password')

cursor = cnx.cursor()
cursor.execute('SELECT * FROM Students;')
students = []
for record in cursor.fetchall():
    student = {}
    student['StudentID'] = record[0]
    student['CollegeID'] = record[1]
    student['FriendID'] = record[2]
    student['FirstName'] = record[3]
    student['LastName'] = record[4]
    student['BirthDate'] = record[5]
    student['Email'] = record[6]
    student['Phone'] = record[7]
    student['City'] = record[8]
    student['Region'] = record[9]
    student['Country'] = record[10]
    students.append(student)

for student in students:
    friendid = student['FriendID']
    if not friendid:
        continue
    full_name = lambda s: f"{s['FirstName']} {s['LastName']}"
    name = full_name(student)
    friend = {}
    for s in students:
        if friendid == s['StudentID']:
            friend = s
            break
    friend_name = full_name(friend)
    print(f"{name} is friends with {friend_name}")

cursor.close()
cnx.close()
```

And the result in my shell for running it:

```sh
$ python3 .pcde/mod6/playground.py
Please enter your MySQL password: **********
Nancy Davolio is friends with Ivy Johnson
Andrew Fuller is friends with Steven Buchanan
Janet Leverling is friends with Nancy Davolio
Margaret Peacock is friends with Anne Dodsworth
Steven Buchanan is friends with Andrew Fuller
Michael Suyama is friends with Laura Callahan
Robert King is friends with Janet Leverling
Laura Callahan is friends with Robert King
Anne Dodsworth is friends with Margaret Peacock
Ivy Johnson is friends with Michael Suyama
```

I ask for the MySQL password and store it in `password` by
using python's global function `input()`.
Then I pass that along in the connection string to connect to
the `education` database.
Then I create a cursor query `SELECT * FROM Students;` to
populate a variable `students`,
a list of dictionaries containing all their records by
iterating `cursor.fetchall()`.

Now I have all the records stored in a Python data structure.
Next I loop through each student,
pull out that student's `FriendID` if they have it,
and loop through each student again to find the student whose
'StudentID' matches the 'FriendID'.
Once found I can use the function `full_name()` and `print()` to
print out who is friends with whom.

## Knowledge Check 6.6: YAML Files (30:00)

* Q1: What is the use of YAML?
  * To send & receive info
  * To store data & configuration in a human readable format
    * **Correct**
  * To summarize data
  * To draw histograms in SQL
* Q2: What does the general structure of a YAML file look like?
  * maps & lists
    * **Correct**
  * a table
  * a tree
  * an array
* Q3: Which of the following is used to symbolize the beginning of a new YAML file?
  * `#?`
  * `---`
    * **Correct**
  * `<->`
  * `???`
* Q4: Why is it recommended that configuration files be written in YAML rather than JSON?
  * YAML can be written in plain English without any indentation
  * YAML has better readability and is more user-friendly
    * **Correct**
  * YAML is in XML format
  * YAML uses Java

## Knowledge Check 6.7: Database Memory (30:00)

* Q1: Which command is used to switch to the SQL mode in MySQL shell?
  * \gotosql
  * \transfer
  * \switch
  * \sql
    * **Correct**
* Q2: Which command is used to connect to the database in MYSQL Shell
  * \c username
  * \c username@port_num
  * username@hostname:port_num
    * **NOT**
  * \c username@hostname:port_num
    * **Correct**
* Q3: Which command would you use to exit from a database in the command line?
  * go
  * end
  * clear
  * quit
    * **Correct**
* Q4: Which python library is used to load the data from a table into a dataframe?
  * SQL
  * load_frame
  * pandas
    * **Correct**
  * mysql.connector

## References

### Web Links

* [Bad Sakila Database Schema File (from emeritus)][pcde-bad-sakila-schema-dl-emeritus]
* [Bad Sakila Database Data File (from emeritus)][pcde-bad-sakila-data-dl-emeritus]
* [EDA using SQL][eda-sql-kaggle]
* [Reddit: r/DataIsBeautiful][r-dataisbeautiful]
* [A Review on Coarse Warranty Data, Cleaning and Analysis (from Kent University by Shaomin Wu)][coarse-data-analysis-wu13]

<!-- Hidden References -->
[pcde-bad-sakila-schema-dl-emeritus]: https://classroom.emeritus.org/courses/1412/files/476581/download "Bad Sakila Database Schema File (from emeritus)"
[pcde-bad-sakila-data-dl-emeritus]: https://classroom.emeritus.org/courses/1412/files/476564/download "Bad Sakila Database Data File (from emeritus)"
[eda-sql-kaggle]: https://www.kaggle.com/code/olgaberezovsky/eda-using-sql/notebook "EDA using SQL"
[r-dataisbeautiful]: https://www.reddit.com/r/dataisbeautiful/ "Reddit: r/DataIsBeautiful"
[coarse-data-analysis-wu13]: https://kar.kent.ac.uk/32972/1/LatestVersionV01.pdf "A Review on Coarse Warranty Data and Analysis (from Kent University by Shaomin Wu)"

### Note Links

* [SQL Overview][sql-zk]
* [Exploratory Data Analysis in SQL][sql-eda-zk]
* [Visualizing Data in SQL][sql-vis-zk]
* [Cleaning Data in SQL][sql-clean-zk]
* [Cleaning Data in SQL: Overview Section][sql-clean-overview-sect-zk]
* [Dates & Time in SQL][sql-date-zk]
* [Client Server Architecture Overview][client-server-zk]

<!-- Hidden References -->
[sql-zk]: ./sql.md "SQL Overview"
[sql-eda-zk]: ./sql-eda.md "Exploratory Data Analysis in SQL"
[sql-vis-zk]: ./sql-visualize.md "Visualizing Data in SQL"
[sql-clean-zk]: ./sql-cleaning.md "Cleaning Data in SQL"
[sql-clean-overview-sect-zk]: ./sql-cleaning.md#cleaning-data-in-sql "Cleaning Data in SQL: Overview Section"
[sql-date-zk]: ./sql-date-time.md "Dates & Time in SQL"
[client-server-zk]: ./client-server.md "Client Server Architecture Overview"

### Referenced By

* [PCDE Course Overview][pcde-overview-zk]

<!-- Hidden References -->
[pcde-overview-zk]: ./pcde-course-overview.md "PCDE Course Overview"
