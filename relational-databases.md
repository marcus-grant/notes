---
tags: #data,#backend,#storage,#db,#sql,relational,#database
---
# Relational Databases

## Concepts

### Cursors

A cursor allows processing the results of a query row by row within a database. In owther words, a cursor is used to write the command returned from a query in a database. By using a cursor, you can iterate, or step through the results of a query and perform certain operations on each row.

In the simplest case a cursor can be defined in Python from your driver using the following syntax:

```python
cursor.execute(query)
```

Where `query` is the command you wish the cursor to perform. The `query` must be written in SQL for the code to understand what you want the cursor to do.

```python
query = ("INSERT INTO fruit (name, average_weight)"
  " VALUES (%s, %s))
data = ("Apple", 200)
cursor.execute(query, data)
```

In the above example, a query is defined to insert some entries into a database called `fruit`. This query defines the data that row will contain and uses a cursor to populate the data.

Naturally, the `cursor` class in Python has many attributes that you can use to manage data. More info about cursors in the [Python Official Documentation][python-official-cursor]

## Interracting with Relational Databases in Python

### Database Driver

When working with relational databases in python, in this case `mysql` a connector is needed to be installed called `mysql-connector-python` which is a driver to interact with the database in python. When writing python to interact with a database, that modlue also needs to be imported at the top of the file like below:

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

## References

* [Python Official Documentation: Cursors in SQL Drivers][python-official-cursor]
<!-- Hidden References -->
[python-official-cursor]: https://www.psycopg.org/docs/cursor.html "Python Official Documentation: Cursors in SQL Drivers"
