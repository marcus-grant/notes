---
tags: [sql,database,data,backend,overview,pcde,module4]
---
# Overview of SQL

This is an overview of the **S**tructured **Q**uery **L**anguage or **SQL**.

## Preamble

### Learning Sample Database

To illustrate SQL syntax, the next few sections will use content from the
[Professional Certification in Data Engineering Course][pcde-overview-zk]
[module 4 example database][pcde-mod4-ex-db-zk].
This database has a `Students` & `Colleges` Entity with
properties as shown below:

* Students (Entity)
  * Properties
    * StudentID *(PK)*
    * FirstName
    * City
    * LastName
    * Email
    * Region
    * Country
    * CollegeID *(FK) (1:m)*
* Colleges (Entity)
  * Properties
    * CollegeID *(PK)*
    * Name
    * Students (#)
    * Region
    * Country

### Some Boilerplate SQL to Get us Started

To get us started and make the rest of the notes easier,
use this boilerplate SQL to get going:

```sql
DROP DATABASE IF EXISTS `education`;
CREATE DATABASE IF NOT EXISTS `education`;
SET NAMES UTF8MB4;
SET character_set = UTF8MB4;
```

This removes the `education` database if it already exists.
This way we can restart our work on a freshly restored state.
The it creates the database again with the same name.
Finally the last two lines sets the character set to the common `UTF8MB4`.

## USE a Database

The `USE` keyword in SQL tells the database management system exactly what
database to use for the next commands.
It's pretty simple,
merely type `USE` then the name of the database to use.

```sql
USE `education`;
```

## CREATE a Table

Tables are the heart of the relational database management system.
They need a table name, column names and keys.
To actually create a table you also need to decide the data types for each table.
There's other optional features for a table:

* Default values
* Column constraints
  * *primary keys*
  * Uniqueness
  * Constraint references

The `CREATE` keyword is how tables (and other units) are created.
To create a table use `CREATE TABLE` together.

```sql
CREATE TABLE `Colleges` (
    `CollegeID` int NOT NULL,
    `Name`      varchar (20) NOT NULL,
    `Students`  int NULL,
    `City`      varchar (15) NULL,
    `Region`    varchar (15) NULL,
    `Country`   varchar (15) NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;
```

Now how when definining the columns and constraints of each column the pattern is:
A parentheses to enclose the table column definitions,
A quoted string for the name of each property,
then data type,
then the constraints of the column like whether it can be `NULL`,
finally a delimiter `,` to seperate each column definition.
At the end of the parentheses are some common default values we'll get into later.
Use this to recreate the `Colleges` table any time it's needed.

## SHOW TABLES

The `SHOW` keyword will show different units of the database system.
The `SHOW TABLES` keywords together will tell the database to
show all the tables present in the database.
Whenever you need to tell a database to do operations on a table,
first you need to tell it which table it is and
this allows you to see all the table names.
This is useful as well when exploring a database and finding its structure.

```sql
SHOW TABLES
```

## DROP TABLE

Sometimes when creating databases you will need to
delete an entire table, of course being careful about it.
`DROP TABLE` is a keyword to allow you to delete a table in
a database in `USE`.
It is followed by a name string for a table

```sql
DROP TABLE `Colleges`;
SHOW TABLES;
```

Now you see after the `SHOW TABLES` command the table `Colleges` is gone.

## Using USE, DROP, CREATE together to Recreate Database State

By combining these previous commands `USE`, `DROP`, `CREATE` together,
it's now possible to keep recreating a database as you work on it.
Now the initial state you want for a database before you modify it can be recreated.
So when changes to it are made while working on it,
you always have a script to return it to a clean state.
When combined it would look something like this

```sql
USE `education`;

DROP DATABASE IF EXISTS `education`;

CREATE TABLE `Colleges` (
    `CollegeID` int NOT NULL,
    `Name`      varchar (20) NOT NULL,
    `Students`  int NULL,
    `City`      varchar (15) NULL,
    `Region`    varchar (15) NULL,
    `Country`   varchar (15) NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;
```

## SELECT Records FROM a Table

The `SELECT` keyword lets us select the records from
existing database tables.
Using the `Colleges` table in the `education` database:

```sql
USE education;
SELECT * FROM Colleges;
```

This will return a tabulated result of all the records in the `Colleges` table.
This includes their columns and cells for any data stored in there.
The `*` wildcard operator tells `SELECT` to select all columns.
There could however be a parentheses enclosed `(ColumnA, ColumnB)` used instead.
The `FROM` keyword at the end directs the `SELECT` command to select from
the `Colleges` table only.
All `SELECT` commands need a following `FROM` to specify the table.

### SELECT WHERE a Record IS a Value

The `WHERE` keyword following `SELECT` then `FROM` defines what
constraints the selection should follow when selecting records.
This means that a(n) column(s) can be specified `WHERE`
you expect a certain value IS present.

```sql
SELECT * FROM Colleges WHERE
  Students IS NULL;
```

This `SELECT`s all columns `FROM` the `Colleges` table `WHERE`
the number of `Students` `IS` zero, or in this case `NULL`.

### WHERE a Column IS a Value

The `IS` keyword in the example above specifies a constraint
defined by `WHERE` should be equal to something.
In the case above that is for empty `Colleges`,
represented by the `NULL` value.

## Add a PRIMARY KEY to a Table

A *primary key* as mentioned in the [database design][db-design-zk] overview,
is a constraint that uniquely identifies each row/record in that table.

```sql
DROP DATABASE IF EXISTS `education`;
CREATE TABLE `Colleges` (
    `CollegeID` int NOT NULL AUTO_INCREMENT,
    `Name`      varchar (20) NOT NULL,
    `Students`  int NULL,
    `City`      varchar (15) NULL,
    `Region`    varchar (15) NULL,
    `Country`   varchar (15) NULL,
    PRIMARY KEY (`CollegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;
```

Here we recreate the `Colleges` table.
Note how the keyword `PRIMARY KEY` specifies `CollegeID` to be the primary key.
You'll also note that the `CollegeID` definition line above has a new keyword.
That keyword is `AUTO_INCREMENT`.
This is needed to specify the primary key specific constraint on
how it will behave for every new record.
In this case it will increase the value by 1 on every new record.

## Database Datatypes

When you create tables you need to make decisions on
the datatypes of each column.
There are several types & they may differ for each database management system.
However, the most common ones show up in most of them.
Here is a table of the MYSQL ones and
the common names for them on other platforms.

| Types on other DBs   | MySQL Type |
| -------------------- | ---------- |
| BOOL                 | TINYINT    |
| BOOLEAN              | TINYINT    |
| CHARACTER_VARYING(M) | VARCHAR(M) |
| FIXED                | DECIMAL    |
| FLOAT4               | FLOAT      |
| FLOAT8               | DOUBLE     |
| INT1                 | TINYINT    |
| INT2                 | SMALLINT   |
| INT3                 | MEDIUMINT  |
| INT4                 | INT        |
| INT8                 | BIGINT     |
| LONG_VARBINARY       | MEDIUMBLOG |
| LONG_VARCHAR         | MEDIUMTEXT |
| LONG                 | MEDIUMTEXT |
| NUMERIC              | MEDIUMINT  |
| MIDDLEINT            | DECIMAL    |

As time goes by,
you will get more comfortable with all the nuances between them.
Don't focus too much on picking exactly the right type.
Just pick something simple that works.
Worry about optimization later.

### Most Important MySQL Types

| Type                | Description                                                            |
| ------------------- | ---------------------------------------------------------------------- |
| CHAR(size)          | Fixed-length string, size parameter specifies length in characters.    |
| VARCHAR(size)       | Variable-length string, size param specifies length in characters      |
| BINARY(size)        | Equal to CHAR(), but stores binary byte strings.                       |
| BIT(size)           | Bit-value type, parameter size specifies # bits in ea. record (1...64) |
| BOOL/BOOLEAN        | In this datatype, 0 is considered false, any other val is true.        |
| ​​INT(n)/INTEGER(n) | Integer value, size param describes how many digits to visualize.      |
| FLOAT(p)            | Floating-point value, * read asterisk footnote below                   |
| DATE                | A date in the format: YYYY-MM-DD.                                      |
| DATETIME(fsp)       | A date and time value in the format: YYYY-MM-DD hh:mm:ss.              |
| TIME(fsp)           | A time in the format: hh:mm:ss.                                        |

>**NOTE**: the `*` above is to move the long description here:
>Floating-point value,
>param p used to determine if
>the record should be a regular floating-point number or a value.

### Futher Reading

Many other datatypes are supported by MySQL and
an exhaustive list can be found in the
[Official MySQL Documentation][mysql-docs-dtypes].

In addition to what you have learned about datatypes,
here is a suggestion for a related topic you can
explore on your own as you adopt the engineering mindset.

[Datatypes][dtypes-usage-janbask]

## INDEXing Tables

When reading a book you wouldn't read the whole thing to
find a key word you're interested in.
We instead take a shortcut by using indices to
certain words that point to the page they're in.

The same is true in databases.
As the data size increases it's going to take increasingly longer time to
access any particular data.
This scales worse than linearly in some cases.
With an index, the database can
quickly determine the position *in log(n) time*.

So why wouldn't we index every column?
Same reason for a book, it means the index is larger than the book.
Adding or removing data from an index costs a lot and
an index in persistence takes extra space.
However there are some situations where they really help.
Ideally **WORM** data or *Write Once Read Many* really benefits from an index.

### WORM Data Considerations

* Heavily read columns *primary keys*
  * Primary keys get used to look up records, key index candidate
* Columns used in joins
  * Joins get to become expensive after a while, indexes help a lot
* Columns accessed in sort order
  * When performing a sort, having an index turns *n2* into *nlog(n)*
* Columns searched for a range of values
  * Not having to find each record means going from *nlog(n)* to *log(n)*

### Adding Indices

Let's revisit the `Colleges` table from before and rebuild it from scratch with
the new indices:

```sql
DROP DATABASE IF EXISTS `education`;
CREATE TABLE `Colleges` (
    `CollegeID` int NOT NULL AUTO_INCREMENT,
    `Name`      varchar (20) NOT NULL,
    `Students`  int NULL,
    `City`      varchar (15) NULL,
    `Region`    varchar (15) NULL,
    `Country`   varchar (15) NULL,
    PRIMARY KEY (`CollegeID`),
    INDEX `CollegeID` (`CollegeID`, ASC)
    INDEX `Name` (`Name`, ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;
```

The `INDEX` keyword specifies that `CollegeID` should be indexed in
`ASC`ending order.
And that's all there really is to it.
You add a comma delimited field in `CREATE TABLE` for the `INDEX` constraint.
Then give the name of the column to index by.
Then inside a `()` parenthesis closure specify the column again and
the order to index it in.
The sort order can also be in `DSC` or *descending* order.

You'll also note the `Name` column is `INDEX`ed.
This is because it will rarely change.
But it will often be read in a sorted order when someone
is trying to order the colleges by name.
Therefore it's a good candidate for an `INDEX`.

Now that there are two indices in the `Colleges` table,
accessing any data from it will go much faster.

### CREATE INDEX after the Fact

You can also `CREATE` `INDEX`es after the table is made.

```sql
CREATE INDEX stats_index ON stats (average_fare,average_trip_duration)
```

### Types of Indices

There are two types of *indexing* in SQL: clustered & non-clustered.

Clustered *indexes* are the unique *index* that uses the *primary key* to
organize the data within the table.
Clustered *indices* are generated automatically when
the table is created, and they use the *primary key* sorted in
`ASC`ending order.

One could open the book at "Thom Smith" &
find all the info for all the people that have "Smith" as
their last name next to each other.

This makes clustered *indices* great for
retrieving data on range-based *queries* since
all the data is located close together.
Because clustered indices are related to how the data is stored,
there can only be one possibility for each table.

On the other hand,
a non-clustered *index* is different because
you can have many of them and
they all point to the data in the clustered *index*.

Considering again the phone book example,
one could define a non-clustered *index* keyed on `town`.

Suppose now you had to search through the phone book for
all the people who live in "London".
If you only used the clustered *index* from
the previous example,
you would have to search every single item in
the phone book because
the key on the clustered *index* is `lastname`, `firstname`.

As a result,
the people living in London are scattered randomly throughout
the *index* and, therefore,
the *query* would not run efficiently.

If you have a non-clustered *index* on `town`,
then these *queries* can be performed much more quickly.

## `ALTER`ing a Table

The `ALTER` keyword allows you to modify a table after
you have defined the columns that you would like to have there.

For example, the correct syntax to add
a *primary key* to the column `column_name` in table `table_name` is:

```sql
ALTER TABLE table_name ADD PRIMARY KEY(column_name)
```

This is true for every other `CREATE` then a constraint syntax.

```sql
ALTER TABLE table_name ADD column_b int NOT NULL
```

### `ALTER` a Table by `DROP`ing a Column

Sometimes you need to `DROP` a column to `ALTER` it.
One example is when changing the *primary key* of the table.
First you need to `DROP` the  *primary key* constraint for a column.
Then you need to `ALTER` the column that should be the *primary key*.

```sql
ALTER TABLE table_name DROP PRIMARY KEY;
```

This `DROP`s `table_name`'s *primary key*.
Next you need to `ALTER` which column will be the new *primary key*.

```sql
ALTER TABLE table_name ADD PRIMARY KEY(column_name)
```

Exactly as before, this above command `ALTER`s the column,
`column_name` to be the *primary key*.

### ADD a Foreign Key

Here we'll show how to `ADD` *foreign keys*.
The `ALTER` keyword can be followed by the `ADD` one to
`ADD` a constraint to a column.

```sql
ALTER TABLE table_name ADD FOREIGN KEY (parent_column_name) REFERENCEs parent_table_name(parent_column_name);
```

* `table_name` is the name of the table where you want to add the *foreign key*
* `parent_table_name` is the name of
the parent table where the *foreign key* will link
* `parent_column_name` is the name of the column in
the parent table that will be linked to the *foreign key*


### Further Reading

For more information it might be good to read up on
[MySQL's documentation on indexes][mysql-docs-index].

Also, [Red-Gate's tutorial on SQL syntaxed indexing][index-basics-redgate],
and
[the Data School's article on query usage of indexes][indexing-data-school].

## References

### Web Links

* [Data Types (from dev.mysql.com/doc)][mysql-docs-dtypes]
* [What are Data Types & Their Usage in SQL Server Tables? (from janbasktraining.com by Sanchayan Banerjee)][dtypes-usage-janbask]
* [How MySQL Uses Indexes (from dev.mysql.com/doc)][mysql-docs-index]
* [SQL Server Index Basics (from red-gate.com by Robert Sheldon)][index-basics-redgate]
* [Indexing (from dataschool.com)][indexing-data-school]

<!-- Hidden Reference Links Below Here -->
[mysql-docs-dtypes]: https://dev.mysql.com/doc/refman/8.0/en/data-types.html "Data Types (from dev.mysql.com/doc)"
[dtypes-usage-janbask]: https://www.janbasktraining.com/blog/sql-server-tables/ "What are Data Types & Their Usage in SQL Server Tables? (from janbasktraining.com by Sanchayan Banerjee)"
[mysql-docs-index]: https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html "How MySQL Uses Indexes (from dev.mysql.com/doc)"
[index-basics-redgate]: https://www.red-gate.com/simple-talk/databases/sql-server/learn/sql-server-index-basics/ "SQL Server Index Basics (from red-gate.com by Robert Sheldon)"
[indexing-data-school]: https://dataschool.com/sql-optimization/how-indexing-works/ "Indexing (from dataschool.com)"

### Note Links

* [Professional Certification in Data Engineering Course Overview][pcde-overview-zk]
* [Example Database (from PCDE Notes Module 4 Materials)][pcde-mod4-ex-db-zk]
* [Database Design][db-design-zk]

<!-- Hidden Reference Links Below Here -->
[pcde-overview-zk]: ./pcde-course-overview.md "Professional Certification in Data Engineering Course Overview"
[pcde-mod4-ex-db-zk]: ./pcde-module4-content.md#Example-Education-Database "Example Database (from PCDE Notes Module 4 Materials)"
[db-design-zk]: ./database-design.md "Database Design"

### Referenced By

***TODO*** Fill in this section with references to:
* The course outline
* The module 4 overview
* database-design.md
<!-- Hidden Reference Links Below Here -->