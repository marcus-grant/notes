---
created: 2022-12-05T14:22:49.623Z
modified: 2023-06-29T12:41:24.265Z
tags: [document,database,nosql,mongodb,firebase,backend,data,pcde,module12]
---
# Document Databases

These are [databases][-db] that use documents as
the main organizing unit of the datastore.
NoSQL as it's known is a schema-less way to
store data in documents and collections.

## MongoDB

>**Note:** See [MongoDB][-mongo] notes for more details.

MongoDB is a NoSQL database,
which means that the data is not modeled in
the tabular relationships used in relational databases.
MongoDB is a *document*-oriented database that
stores information in several *document collections*.

A *document collection* in MongoDB would be the equivalent of a table in
a relational database, also known as just a *collection*.
MongoDB stores *documents*, the equivalent of MySQL records in JSON format,
and it doesn't need the structure or the schema of a relational database.

*Documents* are organized into *collections* where they can be *queried*.
Data that is frequently accessed together is typically stored in
the same document so
read operations are extremely fast because no *joins* are required.

MongoDB knows how to coordinate multiple *servers* to store data.
That makes MongoDB called a distributed database,
which provides fault tolerance by keeping redundant copies of
the same data in different *servers*,
so a single *server* failure does not affect the application.
MongoDB also scales across multiple *servers* to store data so,
as data volume increases and performance requirements grow,
you can just add more servers.

MongoDB is a widely used open source *document* database.
In fact, you will be taking advantage of *containers* to
run MongoDB in order to install it and the run it on your machine.

## Firebase

>**Note:** See [Firebase][-firebase] notes for more details.

Firebase is an application platform that
simplifies significant amounts of backend application service development.
This includes common backend logic like security authentication and authorization.
[Database management][-db] using its NoSQL Document Database Management System.

## The Data Structure

Ultimately the data structure of MongoDB is a [JSON document][-json].

## Creating a Database Using MongoDB

Python can be used in database applications.
MongoDB is one of the most popular NoSQL database tools.
In this mini-lesson, you will learn about how to use MongoDB to create databases.

For more details check out the [MongoDB Using Python](mongodb-using-python.md).

## References

### Note References

* [Database][-db]
* [JSON][-json]
* [MongoDB (NoSQL Document Database)][-mongo]
* [Firebase][-firebase]

<!-- Hidden Reference Links Below Here -->
[-db]: database.md "Database"
[-json]: ./json.md "JSON"
[-mongo]: mongodb.md "MongoDB (NoSQL Document Database)"
[-firebase]: firebase.md "Firebase"
