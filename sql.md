---
tags: [sql,database,data,backend,overview,pcde,module4,module5]
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

### Further Reading

For more information it might be good to read up on
[MySQL's documentation on indexes][mysql-docs-index].

Also, [Red-Gate's tutorial on SQL syntaxed indexing][index-basics-redgate],
and
[the Data School's article on query usage of indexes][indexing-data-school].

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

## Module 5 Starts Here

For some reason there's a lot of repeat information here
Consider breaking this up and removing duplicated info.

## Education Database SQL Script

To continue,
use the complete education database complete with sample records.
Use this script whenever you need to reset the database state.

```sql
DROP DATABASE IF EXISTS `education`;
CREATE DATABASE IF NOT EXISTS `education`; 
USE `education`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

-- --------------------------------------
--  TABLE COLLEGES
-- --------------------------------------

CREATE TABLE `Colleges` (
 `CollegeID`   int NOT NULL AUTO_INCREMENT,
 `Name`     varchar (20) NOT NULL,
 `Students`    int NULL, 
 `City`     varchar (15) NULL ,
 `Region`    varchar (15) NULL , 
 `Country`    varchar (15) NULL ,
   PRIMARY KEY (`CollegeID`), 
 INDEX `CollegeID` (`CollegeID` ASC),
 INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------
--  TABLE STUDENTS
-- --------------------------------------

CREATE TABLE `Students` (
 `StudentID`   int NOT NULL AUTO_INCREMENT,
 `CollegeID`   int NOT NULL, 
 `FriendID`    int NULL,  
 `FirstName`   varchar (20) NOT NULL ,
 `LastName`    varchar (20) NOT NULL , 
 `BirthDate`   date NULL , 
 `Email`    varchar (30) NULL ,
 `Phone`       varchar (24) NULL , 
 `City`     varchar (15) NULL ,
 `Region`    varchar (15) NULL ,
 `Country`    varchar (15) NULL ,
   PRIMARY KEY (`StudentID`), 
 INDEX `StudentID` (`StudentID` ASC),
 INDEX `LastName` (`LastName` ASC),
 INDEX `FirstName` (`FirstName` ASC), 
 FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------
--  POPULATE COLLEGES
-- --------------------------------------

INSERT INTO `Colleges` VALUES(1,'MIT',11,'Cambridge','MA','USA');
INSERT INTO `Colleges` VALUES(2,'Brown',9,'Providence','RI','USA');
INSERT INTO `Colleges` VALUES(3,'Dartmouth',6,'Hanover','NH','USA');
INSERT INTO `Colleges` VALUES(4,'Stanford',17,'Stanford','CA','USA');
INSERT INTO `Colleges` VALUES(5,'Yale',12,'New Haven','CT','USA');
INSERT INTO `Colleges` VALUES(6,'Columbia',31,'New York','NY','USA');
INSERT INTO `Colleges` VALUES(7,'Harvard',23,'Cambridge','MA','USA');
INSERT INTO `Colleges` VALUES(8,'Princeton',9,'Princeton','NJ','USA');
INSERT INTO `Colleges` VALUES(9,'Johns Hopkins',24,'Baltimore','MD','USA');
INSERT INTO `Colleges` VALUES(10,'Northwestern',21,'Evanston','IL','USA');

INSERT INTO `Colleges` VALUES(11,'Duke',15,'Durham','NC','USA');
INSERT INTO `Colleges` VALUES(12,'Cornell',22,'Ithaca','NY','USA');
INSERT INTO `Colleges` VALUES(13,'Notre Dame',9,'Notre Dame','IN','USA');
INSERT INTO `Colleges` VALUES(14,'UCLA',32,'Los Angeles','CA','USA');
INSERT INTO `Colleges` VALUES(15,'Berkeley',42,'Berkeley','CA','USA');
INSERT INTO `Colleges` VALUES(16,'Georgetown',5,'Washington','DC','USA');
INSERT INTO `Colleges` VALUES(17,'Michigan',45,'Ann Arbor','MI','USA');
INSERT INTO `Colleges` VALUES(18,'USC',44,'Los Angeles','CA','USA');
INSERT INTO `Colleges` VALUES(19,'Tufts',11,'Medford','MA','USA');
INSERT INTO `Colleges` VALUES(20,'NYU',51,'New York','NY','USA');


-- --------------------------------------
--  POPULATE STUDENTS
-- --------------------------------------

INSERT INTO `Students` VALUES(1,1,10,'Nancy','Davolio','1948-12-08','nancy@gmail.com','(360) 234-8488','Seattle','WA','USA');
INSERT INTO `Students` VALUES(2,9,5,'Andrew','Fuller','1952-02-19','andrew@yahoo.com',NULL,'Dallas','TX','USA');
INSERT INTO `Students` VALUES(3,8,1,'Janet','Leverling','1963-08-30','janet@hotmail.com','(786) 634-4522','Miami','FL','USA');
INSERT INTO `Students` VALUES(4,3,9,'Margaret','Peacock','1937-09-19','maggie@outlook.com',NULL,'Phoenix','AZ','USA');
INSERT INTO `Students` VALUES(5,4,2,'Steven','Buchanan','1955-03-04','steve@apple.com',NULL,'Denver','CO','USA');
INSERT INTO `Students` VALUES(6,7,8,'Michael','Suyama','1963-07-02','mike@icloud.com','(541) 544-7733','Portland','OR','USA');
INSERT INTO `Students` VALUES(7,6,3,'Robert','King','1960-05-29','rob@gmail.com',NULL,'San Francisco','CA','USA');
INSERT INTO `Students` VALUES(8,5,7,'Laura','Callahan','1958-01-09','laura@gmail.com','(901) 425-8913','Memphis','TN','USA');
INSERT INTO `Students` VALUES(9,2,4,'Anne','Dodsworth','1966-01-27','anne@msn.com',NULL,'Portland','ME','USA');
INSERT INTO `Students` VALUES(10,1,6,'Ivy','Johnson','1986-01-20','ivy@gmail.com',NULL,'Chicago','IL','USA');

INSERT INTO `Students` VALUES(11,1,NULL,'Ana','Trujillo','1998-10-08','ana@gmail.com','(360) 457-2258','Seattle','WA','USA');
INSERT INTO `Students` VALUES(12,9,NULL,'Thomas','Hardy','1992-12-09','tom@yahoo.com',NULL,'Austin','TX','USA');
INSERT INTO `Students` VALUES(13,5,NULL,'Antonio','Moreno','1993-03-23','tony@hotmail.com',NULL,'Miami','FL','USA');
INSERT INTO `Students` VALUES(14,7,NULL,'Elizabeth','Brown','1997-01-11','beth@outlook.com','(480) 324-2178','Phoenix','AZ','USA');
INSERT INTO `Students` VALUES(15,3,NULL,'Ann','Devon','1995-04-24','ann@apple.com',NULL,'Denver','CO','USA');
INSERT INTO `Students` VALUES(16,2,NULL,'Ariel','Cruz','1993-02-12','ariel@icloud.com','(541) 652-4565','Portland','OR','USA');
INSERT INTO `Students` VALUES(17,6,NULL,'Giovanni','Rovelli',
  '1990-09-19','gio@gmail.com','(415) 665-2255','San Francisco','CA','USA');
INSERT INTO `Students` VALUES(18,10,NULL,'Marie','Bertrand','1998-09-29','marie@gmail.com',NULL,'Memphis','TN','USA');
INSERT INTO `Students` VALUES(19,4,NULL,'Philip','Cramer','1996-07-17','phil@msn.com','(207) 4436-6524','Portland','ME','USA');
INSERT INTO `Students` VALUES(20,8,NULL,'Michael','Holz','1996-02-25','michael@gmail.com',NULL,'Chicago','IL','USA');
```

## Types of SQL Statements

We've seen some basic SQL so far, let's go further

There's 3 kinds of SQL statements

* Data Query Language **DQL**
  * The most common one
  * Used for *query*ing data
  * *ie* `SELECT`
* Data Definition Language **DDL**
  * Used to create & modify data
  * Tables, Views, Other objects
* Data Control Language **DCL**
  * Mainly used by admins for access control
* Data Manipulation Language **DML**
  * Used to act on the data itself
  * Used for physical implementation
  * `INSERT`, `UPDATE`, `DELETE`

## The SELECT Statement and its Clauses

`SELECT` is an important *statement* and
can contain several SQL *clause* that
allows you to bring data together in a *query*.
Other *clauses* can be combined with the `SELECT` *clause* like:
`FROM`, `WHERE`, `GROUP BY`, `HAVING` and `ORDER BY`.
Depending on the *clause* used you can select columns,
retrieve data, filter data, group rows together, filter groups and sort rows.

| Clause   | Purpose                                       |
| -------- | --------------------------------------------- |
| SELECT   | Determines which columns to include           |
| FROM     | Specifies the table data values get retrieved |
| WHERE    | Filters out unwanted data                     |
| GROUP BY | Groups rows together                          |
| HAVING   | Filters groups                                |
| ORDER BY | Sorts rows in ascending or descending order   |

>**Note**: the order matters for clauses

### Select Queries

Using the education database let's try some sample queries.

```sql
SELECT *
FROM  Colleges
```

This selects all columns of the `Colleges` table,
filtering nothing out so you see every record and every column.

```sql
SELECT FirstName, LastName
FROM Students
```

This `SELECT`s the `FirstName` & `LastName` columns `FROM` the `students` database.
Let's rename `Colleges`' `Name` column to be `University`.

### Labeling Queried Columns with the AS Clause

```sql
-- rename column
SELECT Name AS University
FROM Colleges
```

The `AS` *clause* following a `SELECT`ed column allows you to
rename the resulting column `Name` to `University` `FROM` the `Colleges` table.

### Combining Multiple Queried Columns AS New Labels

You might want to further process the *query* results to
include other columns and to change how the data is displayed.
The `Colleges` database has a `Students` column as well.
Maybe the database should be storing student counts as units of 1000 students.
And maybe to make the results more clear
`number of students` is a better label.

```sql
SELECT Name AS University, Students*1000 AS 'number of students'
FROM Colleges;
```

Entering a comma `,` after the first `AS` *clause* allows
specifying a new *clause*, `AS` again for a new relabelling *clause*.
This time to relabel `Students` `AS` `number of students` for clarity.
It's also possible to perform operations like multiplying the resulting *query*.

### Bringing Columns together with AS clauses and SQL Functions

A common reason to bring together columns is to
present data like `FirstName`s & `LastNames` together as a `FullName`.

```sql
SELECT FirstName, LastName,
  CONCAT(FirstName, ' ', LastName) AS FullName
FROM Students;
```

Using a *SQL function* like `CONCAT()` allows you to
concatenate strings together to
create a `FullName` column label along with `AS`.

### Exercise using AS Clause  

#### Problem

Try and get this following table using the `SELECT` `AS` `FROM` *clauses*.

| FirstName | LastName  | BirthDate  | Age |
| --------- | --------- | ---------- | --- |
| Nancy     | Davolio   | 1948-12-08 | 74  |
| Andrew    | Fuller    | 1952-02-19 | 70  |
| Janet     | Leverling | 1963-08-30 | 59  |
| Margaret  | Peacock   | 1937-09-19 | 85  |
| Steven    | Buchanan  | 1955-03-04 | 67  |
| Michael   | Suyama    | 1963-07-02 | 59  |
| Robert    | King      | 1960-05-29 | 62  |
| Laura     | Callahan  | 1958-01-09 | 65  |
| Anne      | Dodsworth | 1966-01-27 | 56  |
| Ivy       | Johnson   | 1986-01-20 | 37  |
| Ana       | Trujillo  | 1998-10-08 | 24  |
| Thomas    | Hardy     | 1992-12-09 | 30  |
| Antonio   | Moreno    | 1993-03-23 | 29  |
| Elizabeth | Brown     | 1997-01-11 | 26  |
| Ann       | Devon     | 1995-04-24 | 27  |
| Ariel     | Cruz      | 1993-02-12 | 29  |
| Giovanni  | Rovelli   | 1990-09-19 | 32  |
| Marie     | Bertrand  | 1998-09-29 | 24  |
| Philip    | Cramer    | 1996-07-17 | 26  |
| Michael   | Holz      | 1996-02-25 | 26  |

#### Solution

```sql
-- Get Student FirstName, LastName, BirthDate and
-- Compute Age column from now to their birthdate
SELECT FirstName, LastName, BirthDate,
    DATE_FORMAT(
        FROM_DAYS(
            DATEDIFF(
                NOW(),
                BirthDate
            )
        ),
        '%Y'
    ) + 0 AS Age
FROM Students;
```

By using several SQL *functions* it's possible to compute
the `Age`, in years, of all the students.

* `DATE_FORMAT` formats a specified date
  * The specified formatter string `'%Y` for the year number.
* `FROM_DAYS` finds the date from the numberic date value computed by...
* `DATE_DIFF` which finds the difference between two dates passed to it like...
* `NOW` which returns the current date.
* `+ 0` coerces the normally string value of `DATE_FORMAT` to an `INT`
  * This removes the leading zeroes from the result

### Arithmetic Operators

When performing arithmetic operations in SQL, the order of operations matter.
Let's explore this with some sample queries.

```sql
SELECT Name, Students * 1000 - 100 AS modified
FROM Colleges;
```

Clearly, some form of [PEMDAS][order-math-ops-wiki] is at play.

### The WHERE Clause

The `WHERE` clause is one of the most important clauses when
it comes to *query*ing data.
`SELECT` specifies the columns to *query* and
`WHERE` allows us to filter the results of those columns.

```sql
SELECT *
FROM Students
WHERE Region='TX'
```

Here the `WHERE` *clause* asks for a column to meet a condition.
So the result of the *query* is whatever rows result in *true* for
the boolean expression(s) `WHERE` specifies in its *clause*.
Here, the conditional expression is `='TX'` or *is TX*.
There are several other boolean conditionals that can be used:

| Condition Categories | Example                     |
| -------------------- | --------------------------- |
| Comparison operators | `=`,`<=`,`>=`,`<`,`>`       |
| Logical operators    | `AND`, `OR`, `NOT`          |
| Ranges               | `BETWEEN` and `NOT BETWEEN` |
| Lists                | `IN`, `NOT IN`              |
| Unknown Values       | `IS NULL`, `IS NOT NULL`    |
| Character matches    | `LIKE`, `NOT LIKE`          |

#### Exercise: WHERE Birthdate After Jan 1st 1990

Try redoing the above SQL *query*,
but this time `WHERE` all students are born **after** `1990-01-01`.

##### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE BirthDate>'1990-01-01'
```

### Logical Operators

SELECT *statements* can be combined with logical *operators* to
refine the results returned by your *query*.
Logical *operators*,
such as AND, NOT, or OR
can combine multiple expressions to
return the desired record with much more nuance.
These are the boolean logic operators:

| Operator    | Description   |
| ----------- | ------------- |
| `AND`, `&&` | Logical AND   |
| `NOT`, `!`  | Negates value |
| OR, `||`    | Logical Or    |
| XOR         | Logical XOR   |

Let's see how we can combine multiple `WHERE` conditions together using
logical operators to increase the nuance of the *query* filter.

```sql
SELECT *
FROM Students
WHERE (
    Birthdate > '1990-01-01' 
    AND Region='TX'
);
```

Note how `AND` gets used in the `WHERE` condition above.
It means only one Student is selected of `StudentID` `12`.

Also note, there is a precedence for these operations:

1. Parenthesis
2. Multiplication or division
3. Subtraction or addition
4. NOT
5. AND
6. OR

#### Further Reading

To read more about the details on logical operators in sql,
here are some [detailed notes][sql-logic-ops-zk]
about logical operators in SQL.

#### Exercise

Write a *query* that selects all students born after 1950 from Texas and Austin.

#### Solution

```sql
SELECT *
FROM Students
WHERE (
    Birthdate > '1950-12-31' 
    AND Region = 'TX'
    AND City = 'Austin'
);
```

### The IN & NOT IN *Operators*

Although we can express most of our queries in
terms of logical and comparison operators,
oftentimes we want to make use of the built-in syntax to
simplify and make our queries more transparant.

One of these *built-in* syntaxes is the `IN` & `NOT IN`.

| Operator | Syntax                                        |
| -------- | --------------------------------------------- |
| `IN`     | *expr* `IN` (value1, value2, ..., valueN)     |
| `NOT IN` | *expr* `NOT IN` (value1, value2, ..., valueN) |

Let's see how we use them in a *query*:

```sql
SELECT *
FROM Students
WHERE (
    Region = 'AZ' OR
    Region = 'TX' OR
    Region = 'FL'
);
```

We could write our *query* like above.
It does work in selecting `Students` from `AZ,TX,` or `FL`.
However,
using `IN` in this *query* cleans it up considerably.

```sql
SELECT *
FROM Students
WHERE Region IN ('AZ', 'TX', 'FL');
```

This achieves exactly the same *query* results.
However,
this is much more readable, transparent, and performant.

```sql
SELECT *
FROM Students
WHERE Region NOT IN ('AZ', 'TX', 'FL');
```

To get the inverse set of the previous *query*,
use the `NOT IN` keyword in the `WHERE` *clause* of the `SELECT` *statement*.

### The BETWEEN *Operator*

The `BETWEEN` *operator* could be compared to
a combination of a
comparison and logical *operator*.
Below is its syntax table.

| Operator  | Syntax                                         |
| --------- | ---------------------------------------------- |
| `BETWEEN` | *expr* `BETWEEN` *min_value* `AND` *max_value* |

This significantly cleaner than the other ways you'd express this condition.
Say we were trying to match a range of IDs when it comes to `Students`.
One of the things we could do is to enter `StudentID >= 1 AND StudentID <= 5`.

```sql
SELECT *
FROM Students
WHERE StudentID >= 1 AND
    StudentID <= 5;
```

However,
it would be much simpler, transparent, and performant if
instead we used the below *query*.

```sql
SELECT *
FROM Students
WHERE StudentID BETWEEN 1 AND 5;
```

The same output comes from both these queries,
though again, the latter one is much better to use in this case.

### The NULL *Operator*

NULL may behave a little different than you might think.
That is because NULL is a placeholder for *unknown* information.
It's not representing a zero or blank.

Let's take a look at an example query using it.

```sql
SELECT *
FROM Students
WHERE Country IS NULL;
```

If you run the above *query*,
you will see there are no results.
All records of the `Country` column have a value and it isn't `NULL`.

We could also say a record `IS NOT NULL` to get the inverse.

```sql
SELECT *
FROM Students
WHERE Country IS NOT NULL;
```

Now you get *all* the records since all of them have non-`NULL` values in
their `Country` column.

Something that may throw you at first is that
operations with anything that is `NULL` are `NULL` themselves.
That is,
they are *unknown*.

Say, FirstName, and multiply that by `NULL`, let's see what we get

```sql
SELECT FirstName*NULL
FROM Students
WHERE Country IS NOT NULL;
```

We get a single column of `NULL` values.
That is because this is again,
not blank, zero or an empty string.
It's a seperate kind of entity to represent an *unknown* value.
So if you take an operation that takes an *unknown* value,
you get an *unknown* value.

### The LIKE Operator

When we search for data,
many times we want a pattern.
Sometimes a specific number or specific number of characters.
As you can see here the `LIKE` *operator* allows us to
match any number of characters.

| Operator | Syntax                                                               |
| -------- | -------------------------------------------------------------------- |
| `LIKE`   | *expr* `LIKE` pattern (`'%'` any No. chars., `'_'` matches only one) |

Let's see how we use this in practice.
So say we're looking for names starting with an '`a`'.

```sql
SELECT *
FROM Students
WHERE FirstName LIKE 'A%'
```

We want `LIKE` to match `FirstName`s starting with `A`,
then any number of characteres.
So we use the `%` operator after the `A`.

All the `FirstName`s in the result start with `A`.
Let's say we wanted to be a little bit more explicit.

```sql
SELECT *
FROM Students
WHERE FirstName LIKE 'An%'
```

When we change the `An%`,
the `Ariel` name no longer shows up.

Let's say we wanted `Ariel` back in the results.

```sql
SELECT *
FROM Students
WHERE FirstName LIKE 'A%l'
```

We can match the closing and ending character sequences and
leave the middle as a wildcard.

Let's say we wanted to match a specific number of
*unknown* characters,
maybe four unknown characters that end in `y`?

```sql
SELECT *
FROM Students
WHERE FirstName LIKE '____y'
```

In the `Students` table `Nancy` matches that `LIKE` operator pattern.

## Regular Expressions

The `LIKE` expression *clause* can be used with
**Regular Expressions** or **RegEx**.
A **RegEx** is a sequence of characters that
defines a pattern to search through text.

### Regular Expressions in SQL

The `REGEXP` keyword in a query *clause*
can be used along with a regular expression string to find results matching
a pattern defined in the regular expression.

```sql
SELECT *
FROM Students
WHERE LastName REGEXP 'a|m|c';
```

This will return all `Students` with a `LastName` matching
the *RegEx*, `a|m|c`, or all last names containing an `a`, `m`, or `c`.

## Joins

In databases we model information using tables and
relationships between tables.
So when we need to answer questions about our data that
means bringing together tables.
We call that **joining**.
And there five basic types of joins:
**Inner joins**, **Self Joins**,
**Left Joins**, **Right Joins** and **Full Joins**.

### A Simple Joining Tables Example

To make it easier to explain joins,
use this basic example of a table:

#### Students Table

| StudentID | Name    | Phone        | Email           |
| --------- | ------- | ------------ | --------------- |
| 1         | John    | 123-345-4567 | john@mit.edu    |
| 2         | Alex    | 000-034-6758 | alex@mit.edu    |
| 3         | Mary    | 345-768-4959 | mary@mit.edu    |
| 7         | Jessica | 485-936-9485 | jessica@mit.edu |

#### Courses Table

| CourseID | StudentID |
| -------- | --------- |
| 123      | 1         |
| 456      | 2         |
| 789      | 3         |
| 486      | 8         |

### Inner Join

There are a number of joins and we'll start here with the **inner join**.
**Inner joins** bring two tables together based on
a common column both share.

```sql
SELECT table1.column, tabl2.column
FROM table1
INNER JOIN table2
ON table1.column = table2.column
```

Let's try an **inner join** on the `Education` database.
Remember `Students` has a *foreign key* `CollegeID` in `Colleges`.
We'll take advantage of that fact to bring these two tables toegether.

```sql
SELECT
    S.FirstName, S.LastName,
    C.CollegeID, C.Name
FROM Students S
INNER JOIN Colleges C
ON S.CollegeID = C.CollegeID
```

As you can see you get a results table with
columns for `FirstName`, `LastName`, `CollegeID`, & `Name`.
Note how you need to specify the table each column comes from.
This is easier by *aliasing* the table to shorten the name.
Here `Colleges` is aliased to `C` & `Students` to `S`.

The `FROM` & `INNER JOIN` *clauses* specify the tables being joined.
`ON` Then sets up the condition for how the `INNER JOIN`
brings the tables together, by matching with the `CollegeID` column from each.

### Self Join

**Self joins** can seem a bit counter intuitive because
they combine the data from the same table.
The purpose is to combine then compare data within a table.
The `SELF JOIN` keyword in SQL follows this pattern in a *query* *statement*.

```sql
SELECT column_name
FROM table AS t1
INNER JOIN table AS t2
ON table1.column = table2.column
```

It gets simpler when you think of them as two separate tables.
And if you compare this pattern using the `INNER JOIN` discussed before,
but you perform the *inner join* on two instances of the same table,
it starts to make more sense.
The pattern is the same if you have two tables,
one aliased `AS` a different label as the other.

In the `Students` table there is a column `FriendID`.
This might've seen counter-intuitive before.
But with **self joins** it makes a lot more sense.
With a self join between `StudentID` & `FriendID`
you suddenly get a useful result from the relationship that
is self referential from the `Students` table's perspective.

```sql
SELECT
    S.StudentID, S.FirstName, S.LastName, F.FirstName, F.LastName
FROM Students AS S
INNER JOIN Students AS F
ON S.FriendID = F.StudentID
```

You get the results table below, which shows first the
`FirstName` & `LastName` of a student,
then the `FirstName` & `LastName` of that student's friend.

| StudentID | S.FirstName | S.LastName | F.FirstName | F.LastName |
| --------- | ----------- | ---------- | ----------- | ---------- |
| 1         | Nancy       | Davolio    | Ivy         | Johnson    |
| 2         | Andrew      | Fuller     | Steven      | Buchanan   |
| 3         | Janet       | Leverling  | Nancy       | Davolio    |
| 4         | Margaret    | Peacock    | Anne        | Dodsworth  |
| 5         | Steven      | Buchanan   | Andrew      | Fuller     |
| 6         | Michael     | Suyama     | Laura       | Callahan   |
| 7         | Robert      | King       | Janet       | Leverling  |
| 8         | Laura       | Callahan   | Robert      | King       |
| 9         | Anne        | Dodsworth  | Margaret    | Peacock    |
| 10        | Ivy         | Johnson    | Michael     | Suyama     |

### Left Join

The left join returns all rows of the table on the left side of the join
and the matching rows on the right side of the join.

### Right Join

Same thing but the left side rows must match, and the right shows all rows.

### Full Join

Combines the results of both the left and right joins.
This means there will be a lot of data that can't be matched.
Those extra columns are added to the result and
for the rows that have no data for both the left and right joins,
the value `NULL` is given.

## Module 6 of PCDE Starts Here

Database Analysis involves a lot of SQL.
Those notes belong below this section.
**TODO**: this needs to be cleaned up into a more coherent organization of sections.

### Further Reading

This topic is expansive and nuanced,
see [Regular Expressions][regex-zk] for more details.

## References

### Web Links

* [Data Types (from dev.mysql.com/doc)][mysql-docs-dtypes]
* [What are Data Types & Their Usage in SQL Server Tables? (from janbasktraining.com by Sanchayan Banerjee)][dtypes-usage-janbask]
* [How MySQL Uses Indexes (from dev.mysql.com/doc)][mysql-docs-index]
* [SQL Server Index Basics (from red-gate.com by Robert Sheldon)][index-basics-redgate]
* [Indexing (from dataschool.com)][indexing-data-school]
* [Order of Operations (from Wikipedia, the free encyclopedia)][order-math-ops-wiki]

<!-- Hidden Reference Links Below Here -->
[mysql-docs-dtypes]: https://dev.mysql.com/doc/refman/8.0/en/data-types.html "Data Types (from dev.mysql.com/doc)"
[dtypes-usage-janbask]: https://www.janbasktraining.com/blog/sql-server-tables/ "What are Data Types & Their Usage in SQL Server Tables? (from janbasktraining.com by Sanchayan Banerjee)"
[mysql-docs-index]: https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html "How MySQL Uses Indexes (from dev.mysql.com/doc)"
[index-basics-redgate]: https://www.red-gate.com/simple-talk/databases/sql-server/learn/sql-server-index-basics/ "SQL Server Index Basics (from red-gate.com by Robert Sheldon)"
[indexing-data-school]: https://dataschool.com/sql-optimization/how-indexing-works/ "Indexing (from dataschool.com)"
[order-math-ops-wiki]: https://en.wikipedia.org/wiki/Order_of_operations "Order of Operations (from Wikipedia, the free encyclopedia)"

### Note Links

* [Professional Certification in Data Engineering Course Overview][pcde-overview-zk]
* [Example Database (from PCDE Notes Module 4 Materials)][pcde-mod4-ex-db-zk]
* [Database Design][db-design-zk]
* [Logical Operators in SQL][sql-logic-ops-zk]
* [Regular Expressions (RegEx)][regex-zk]

<!-- Hidden Reference Links Below Here -->
[pcde-overview-zk]: ./pcde-course-overview.md "Professional Certification in Data Engineering Course Overview"
[pcde-mod4-ex-db-zk]: ./pcde-module4-content.md#Example-Education-Database "Example Database (from PCDE Notes Module 4 Materials)"
[db-design-zk]: ./database-design.md "Database Design"
[sql-logic-ops-zk]: ./sql-logical-operators.md "Logical Operators in SQL"
[regex-zk]: ./regex.md "Regular Expressions (RegEx)"

### Referenced By

***TODO*** Fill in this section with references to:

* The course outline
* The module 4 overview
* database-design.md
<!-- Hidden Reference Links Below Here -->