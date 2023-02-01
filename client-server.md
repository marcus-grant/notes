---
created: 2023-02-01T12:23:49.211Z
modified: 2023-02-01T16:06:54.481Z
tags: [client,server,architecture,overview,python,sql,database,data,driver,pcde,module6]
---
# Client Server Architecture Overview

As an example, from the [PCDE course][pcde-overview-zk],
we often connect to a [SQL][sql-zk] **server** via
some **client**.
Often it was using *MySQL Workbench* a GUI desktop application.
This may be a local database **server** & workbench **client**.
However, this was still a **server-client** interface going on.

This common interface allows having **servers** located anywhere in the world,
while still being able to connect with any **client** in
the world so long as each **client** is using a compatible interface.
In the [SQL][sql-zk] world,
this is using the built-in SQL HTTP interface.
MySQL actually comes with its own [command line interface][cli-zk] that
gives you a terminal **client** to connect to the database.

## What Is a Server? What Is a Client?

Within a network,
a computer machine that shares resources,
such as memory, hard drives, and printers, with other computers is called a *server*.
*servers* also provide access to data or particular services,
such as large-scale computations. Within the same networks,
any other computer that is not a *server* is called a *client*.
*Clients* are generally capable of receiving information or
using a particular service from the *server*.

Therefore,
*servers* are usually more powerful and
expensive machines because they share their resources with
other computers in the network.
*Clients* are less powerful machines,
and you can think of them as personal computers that
users operate to connect to a *server*.
The *clients*’ machines don’t need to be extremely powerful because,
generally, they don’t need to share resources with other computers.

## What Is a Client-Server Interface?

As you know,
a user can perform data analysis on a database using SQL locally.
This means that the database is stored on
the user machine and all the operations happen on the user’s computer.
However,
SQL works particularly well on a *client*-*server* system.
In this case,
users on different *clients*’ machines can access a database that
is stored on a *server* machine via
wired communications (i.e., LAN) or online channels.

In this specific case,
the computer you are using to manipulate a database and
where you have installed MySQL Workbench is the *client* and,
so far, you have only performed operations locally.

You learned how to extend the applications of SQL by
using a different type of *client* by
using a Python driver that acts on the database.

## What Is a Driver?

Let’s try to understand what a driver is with an example.

You have probably heard of the word driver when
installing a printer on your machine.
Imagine you are working in an office where
multiple printers are connected to a network and
you want to print a certain document from a specific printer.

It would be convenient to simply say "print this document" but,
of course, because each printer is unique,
the signal cannot be exactly the same for all the printers in your office.
In fact, as you probably know,
if you don’t specify which printer you want to connect to,
you won’t be able to print anything.

Here’s where drivers become useful.
Rather than having to send a different signal to each type of printer
(and hoping that one works for you),
it is more convenient to locally install a driver for
a particular printer that translates the "print this document" command into
something more specific that the desired printer hardware needs to understand.

In other words,
a driver is a piece of software related to hardware that
contains a mapping/translation so that
an operating system can communicate with hardware.
It's a piece of code that sits between a program and hardware.

In conclusion,
both *servers* and *clients* can use drivers for
communication whenever it is necessary.

## Connecting to a Database using a Driver

Using the `mysql.connector` module for python,
we'll start connecting to a database using python.

First we do this using a *connection string*.
A *connection string* is a string that provides information about
a data server and how the connection to it is made.

```python
cnx = mysql.connector.connect(user='root',
    password='MyNewPass',
    host='127.0.0.1',
    database='education',
    auth_plugin='mysql_native_password')
```

As you see here we have `user`, `password`, `host`, `database`, and
an authentication type we want to use.
This is the *connection string* we want to use to connect to a database.
Note the `education` database is the same database we've used before.

## Reading a Table Using a Driver

Now let's run a simple `SELECT * FROM colleges` query.

```python
cursor = cnx.cursor()
query = ('SELECT * FROM colleges')
cursor.execute(query)
```

This uses a `cursor` class, which allows code to execute SQL commands in
a database session.
Most database drivers for most languages will have this notion of a *cursor*.
We simply define the SQL query for the `cursor` object,
using a SQL query string,
then `cursor.execute` that query to get the results.
Now to print out those results:

```python
#print all the rows
for row in cursor.fetchall():
    print(row)

cursor.close()
cnx.close()
```

The `cursor` object has a `fetchall` function to
provide an iterator for each resulting records' row.
Simply iterate the `fetchall` row return then print the result.
**Note that** you also want to remember to `close` both the
`cursor` & `cnx` objects when you're done with them.
The results from this code should look something like this:

```txt
1, 'MIT', 11, 'Cambridge', 'MA', 'USA')
(2, 'Brown', 9, 'Providence', 'RI', 'USA')
(3, 'Dartmouth', 6, 'Hanover', 'NH', 'USA')
(4, 'Stanford', 17, 'Stanford', 'CA', 'USA')
(5, 'Yale', 12, 'New Haven', 'CT', 'USA')
(6, 'Columbia', 31, 'New York', 'NY', 'USA')
(7, 'Harvard', 23, 'Cambridge', 'MA', 'USA')
(8, 'Princeton', 9, 'Princeton', 'NJ', 'USA')
(9, 'Johns Hopkins', 24, 'Baltimore', 'MD', 'USA')
(10, 'Northwestern', 21, 'Evanston', 'IL', 'USA')
(11, 'Duke', 15, 'Durham', 'NC', 'USA')
(12, 'Cornell', 22, 'Ithaca', 'NY', 'USA')
(13, 'Notre Dame', 9, 'Notre Dame', 'IN', 'USA')
(14, 'UCLA', 32, 'Los Angeles', 'CA', 'USA')
(15, 'Berkeley', 42, 'Berkeley', 'CA', 'USA')
(16, 'Georgetown', 5, 'Washington', 'DC', 'USA')
(17, 'Michigan', 45, 'Ann Arbor', 'MI', 'USA')
(18, 'USC', 44, 'Los Angeles', 'CA', 'USA')
(19, 'Tufts', 11, 'Medford', 'MA', 'USA')
(20, 'NYU', 51, 'New York', 'NY', 'USA')
```

## Writing Data Using a Driver

Before we read data from the database using a *driver*.
Now let's write to it.
As before use the *connection string* to connect to the database.

```python
cnx = mysql.connector.connect(user='root',
    password='some_password',
    host='127.0.0.1',
    database='education',
    auth_plugin='mysql_native_password')
```

Then use the python global function `input()` to
allow manual entry of new `College` entities into the table from the terminal.
We will use that information to build the `cursor` that will
send the data to the database.

```python
college = input('Enter the college name: ')
students = input('Enter the student population: ')

cursor = cnx.cursor()
query = (f'INSERT INTO `Colleges` VALUES(NULL, "{college}, {students});')
cursor.execute(query)
```

This will enter the new data you specify into the database,
with NULLs for the properties not included.
Then it will execute the `INSERT INTO` mutator query to
add this value into the `Colleges` table.
Now let's verify it worked by reusing the code from before to
Read all the records from that table and close the connection.

```python
#print all the rows
for row in cursor.fetchall():
    print(row)

cursor.close()
cnx.close()
```

## Connecting to a Database Using Secrets File in YAML

When connecting to a database or any server really,
usually some kind of authentication is required.
Before we would usually do this by
putting the password into a python file as plaintext.
This is **really bad** security practice.
Better to have a credentials file that's ignored by git and other programs.
Then reading into the client program that credentials file to connect.
Let's do this with a YAML file.

```yaml
host: 'localhost'
user: 'root'
passwd: 'mYpAsSw0rD'
db: 'education'
```

Then you can go into a python client program and use the `yaml` module.

```python
import yaml
import mysql.connector

db = yaml.safe_load(open('secrets.yml'))
config = {
  'user': db['user'],
  'password': db['passwd'],
  'host': db['host'],
  'database': db['db'],
  'auth_plugin': 'mysql_native_password',
}
cnx = mysql.connector.connect(**config)
```

This will now use the connection string created from the `secrets.yml` file
created above.
The `config` object you'll note has all of
the named parameters `connect()` expects exactly as they are named.
This means that when `connect()` is called with `config`,
using the destructuring dictionary keywords operator `**config` then
will replace all of the named parameters of
the function with the `config` object passed in.
You'll also note that `yaml.safe_load()` is used to read the `secrets.yml` file.
Then using the `db['yaml_key']` syntax is used to assign `config` values.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [SQL Overview][sql-zk]
* [CLI Overview][cli-zk]

<!-- Hidden References -->
[sql-zk]: ./sql.md "SQL Overview"
[cli-zk]: ./cli.md "CLI Overview"

### Referenced By

* [PCDE Course Overview][pcde-overview-zk]
* [PCDE Course Module 6 Content][pcde-mod6-zk]

<!-- Hidden References -->
[pcde-overview-zk]: ./pcde-course-overview.md "PCDE Course Overview"
[pcde-mod6-zk]: ./pcde-module6-content.md "PCDE Course Module 6 Content"
