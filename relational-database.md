---
created: 2022-11-15T13:55:04.498Z
modified: 2023-04-20T13:57:38.324Z
tags: [data,backend,storage,database,mysql,mariadb,postgres,sql,relational,pcde]
---
# Relational Databases

Relational databases models data in the form of tables.
Notably the tables are expected to have relationships with each other.
Primary keys indicate unique entries in each table and
foreign keys indicate relationships to unique entries in
other tables it's related to.

The way most *relational-databases* are interacted with or **queried** is through
[SQL (Structured Query Language)][-sql].
SQL is a domain specific language used to interact with *relational-databases*.

## Relational Database Management Systems

* [MySQL][-mysql]
* [PostgreSQL][-postgres]
* [SQLite][-sqlite]

## Concepts

### Tables

A table is a collection of data organized into rows and columns.
Each row is a record and each column is a field.

### Cursors

A cursor allows processing the results of a query row by row within a database.
In other words, a cursor is used to write the command returned from
a query in a database.
By using a cursor, you can iterate,
or step through the results of a query and perform certain operations on each row.

In the simplest case a cursor can be defined in Python from your driver using the following syntax:

```python
cursor.execute(query)
```

Where `query` is the command you wish the cursor to perform.
The `query` must be written in SQL for
the code to understand what you want the cursor to do.

```python
query = ("INSERT INTO fruit (name, average_weight)"
  " VALUES (%s, %s))
data = ("Apple", 200)
cursor.execute(query, data)
```

In the above example,
a query is defined to insert some entries into a database called `fruit`.
This query defines the data that row will contain and
uses a cursor to populate the data.

Naturally, the `cursor` class in Python has many attributes that you can use to
manage data.
More info about cursors in the [Python Official Documentation][python-official-cursor]

## Interacting with Relational Databases in Python

### Database Driver

When working with relational databases in python,
in this case `mysql` a connector is needed to
be installed called `mysql-connector-python` which is a driver to
interact with the database in python.
When writing python to interact with a database,
that module also needs to be imported at the top of the file like below:

```python
import mysql.connector
```

### Connecting to Databases

```python
cnx = mysql.connector.connect(user='root',
                                password='MyNewPass',
                                host='127.0.0.1',
                                database='',
                                auth_plugin='mysql_native_password')
```

### Create Cursor

```python
cursor = cnx.cursor()
```

### Read Databases

```python
query = ('SHOW DATABASES')
cursor.execute(query)
for row in cursor.fetchall():
    print(row)
```

### Use DB

```python
query = ("USE PLUTO")
cursor.execute(query)
```

### Insert

```python
import uuid
id = str(uuid.uuid4())
time = datetime.now().strftime('%Y-%m-%d %H:%M%S')
query = (f'INSERT INTO `posts` VALUES("{id}", "{time}")')
cursor.execute(query)
```

### Delete Previous DB

Useful when recreating databases especially for testing functionality when state needs to be reset.

```python
query = ("DROP DATABASE IF EXISTS `pluto`;")
cursor.execute(query)
```

### Cleanup

```python
cursor.close()
cnx.close()
```

## Example: Library Management System

In [module 12][-pcde-mod12] of the PCDE course,
there's a discussion about how to design a library management system as a prompt
for coming up with their own database design.
In this section, is a good example of different designs.

## Database Containerization

See [Database Containerization][-container] for more details.
To summarize, containers are basic execution environments that
are sandboxed and contained within sandboxed portions of an operating system.
They are very useful for developing, testing and even deploying databases.
Because of these properties,
being able to consistently recreate the state of a database is very useful.

## References

### Web References

* [Python Official Documentation: Cursors in SQL Drivers][python-official-cursor]
<!-- Hidden References -->
[python-official-cursor]: https://www.psycopg.org/docs/cursor.html "Python Official Documentation: Cursors in SQL Drivers"

### Note References

* [Structured Query Language (SQL)][-sql]
* [MySQL][-mysql]
* [PostgreSQL][-postgres]
* [SQLite][-sqlite]
* [PCDE Course: Module 12 Materials][-pcde-mod12]
* [Database Containerization][-container]

<!-- Hidden Reference Links Below Here -->
[-sql]: sql.md "Structured Query Language (SQL)"
[-pcde-mod12]: ./pcde-module12-content.md "PCDE Course: Module 12 Materials"
[-container]: ./database-continerization.md "Database Containerization"
[-mysql]: mysql.md "MySQL"
[-postgres]: postgres.md "PostgreSQL"
[-sqlite]: sqlite.md "SQLite (Embedded Relational Database)"
