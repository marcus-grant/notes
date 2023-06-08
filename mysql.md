---
created: 2023-04-11T15:30:04.963Z
modified: 2023-06-08T17:43:45.835Z
tags: [mysql,mariadb,sql,relational,database,data,relational-database,pcde]
---
# MySQL / MariaDB

## Introduction

[According to Wikipedia][mysql-wiki], MySQL is a [kind of database][db-types-zk]:

>MySQL (/ˌmaɪˌɛsˌkjuːˈɛl/)[^5][what-mysql]
>is an [open-source][foss-zk]
>[relational database management system (RDBMS)][rel-db-zk].[^5][what-mysql][^6][db-rank]
>Its name is a combination of "My",
>the name of co-founder Michael Widenius's daughter My,[^7][history-mysql] and
>"**SQL**", the acronym for [Structured Query Language][sql-zk].

## Data Types

### Data Type Categories

MySQL supports [SQL][sql-zk] data types in
several categories [MySQL Reference][mysql-datatypes-docs]:

* Numeric Types
* Date and Time Types
* String (Character and Byte) Types
* Spatial Types
* JSON Types

### Numeric Types

* `INTEGER` - A 4-byte signed integer.
* `SMALLINT` - A 2-byte signed integer.
* `DECIMAL` - A fixed-point number.
* `NUMERIC` - A synonym for `DECIMAL`.
* `FLOAT` - A floating-point number.
* `REAL` - A synonym for `FLOAT`.
* `DOUBLE` - A synonym for `FLOAT`.

## Date and Time Types

* `DATE` - A date in `YYYY-MM-DD` format.
* `TIME` - A time in `HH:MM:SS` format.
* `DATETIME` - A date and time in `YYYY-MM-DD HH:MM:SS` format.
* `YEAR` - A year in `YYYY` or `YY` format.

## String Types

The string types are:

* `CHAR` - A fixed-length string.
* `VARCHAR` - A variable-length string.
* `BINARY` - A fixed-length binary string.
* `VARBINARY` - A variable-length binary string.
* `BLOB` - A binary large object.
* `TEXT` - A text large object.
* `ENUM` - A string object that has only one value from a predefined list of values.
* `SET` - A string object that can have 0 or more values from a predefined list of values.

## MySQL Clients

### PHPMyAdmin

[PHPMyAdmin][-pma] is a web-based MySQL client.
You can do most of the things you can do with the MySQL command line client,
but in a web browser based GUI.

## References

### Web Links

* [MySQL (from Wikipedia, the free encyclopedia)][mysql-wiki]
* ["What is MySQL?". MySQL 8.0 Reference Manual. Oracle Corporation.][what-mysql]
* ["DB-Engines Ranking of Relational DBMS". DB-Engines. solidIT consulting & software development GmbH. Retrieved 2020-04-03.][db-rank]
* ["History of MySQL". MySQL 8.0 Reference Manual. Oracle Corporation. Retrieved 2020-04-03. MySQL is named after co-founder Monty Widenius's daughter][history-mysql]
* ["Chapter 11 Data Types". MySQL 8.0 Reference Manual. Oracle Corporation. Retrieved 2020-04-03.][mysql-datatypes-docs]

<!-- Hidden References -->
[mysql-wiki]: https://en.wikipedia.org/wiki/MySQL#cite_note-6 "MySQL (from Wikipedia, the free encyclopedia)"
[what-mysql]: https://dev.mysql.com/doc/refman/8.0/en/what-is-mysql.html "What is MySQL?"
[db-rank]: http://db-engines.com/en/ranking/relational+dbms "Database Ranking"
[history-mysql]: https://dev.mysql.com/doc/refman/8.0/en/history.html "MySQL History"
[mysql-datatypes-docs]: https://dev.mysql.com/doc/refman/8.0/en/data-types.html "MySQL Data Types"

### Note Links

* [Types of Databases][db-types-zk]
* [Relational Databases][rel-db-zk]
* [Structured Query Language (SQL)][sql-zk]
* [Free and Open Source Software (FOSS)][foss-zk]
* [PHPMyAdmin (MySQL Client)][-pma]

<!-- Hidden References -->
[db-types-zk]: types-of-database.md "Types of Databases"
[rel-db-zk]: relational-database.md "Relational Databases"
[sql-zk]: sql.md "Structured Query Language (SQL)"
[foss-zk]: FOSS.md "Free and Open Source Software (FOSS)"
[-pma]: phpmyadmin.md "PHPMyAdmin (MySQL Client)"

## Footnotes

[^5][what-mysql]
[^6][db-rank]
[^7][history-mysql]
