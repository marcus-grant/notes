---
created: 2023-03-15T16:37:30.361Z
modified: 2023-04-20T13:20:26.413Z
tags: [pcde,module12,database,data,container,docker,mongodb,mysql,redis,document,key,value]
---
# PCDE Module 12 Content

## Discussion 12.1: Use Cases for Relational Databases

### Discussion Prompt

The library management system is usually a software solution based on
the concept of a *relational database* management system (RDBMS).
It consists of several *entities*, also called tables,
and the relationship between these tables is identified by
the *entity*-relationship model.
Some of these tables are `Books`, `Borrowers`, `Borrowing_status`, etc.

The `Books` table can be composed of the following properties:
`book_id`, `book_name`, `book_author`, and `book_subject`.
The primary *key* of
the table through which a book is uniquely identified is `book_id`.

The `Borrowers` table can consist of properties related to the borrower.
For example, some fields may be
`borrower_id`, `name`, `contact_info`, and `address`.
The primary *key* of this table is `borrower_id`.

The `Borrowing_status` table can be the table that stores the current status of
all books that are currently borrowed.
It will show the current status of each book that was borrowed,,
the due date and the borrowing history.
You can also check who borrowed the book,
whether the book was returned, and determine whether
the borrower still has time to return the book or it is past the due date.

This table may contain the following fields:
`book_id`, `borrow_date`, `due_date`, `return_date`, `borrower_id`, and `book_status`.
In this table, you need a composite *key*,
which includes a combination of fields, to uniquely identify each row.
This is because there can be multiple records with
the same `book_id`, `borrower_id` or even a combination of both as the primary *key*.
Rather, you can use a combination of `book_id`, `borrow_date`, and `book_status`
to be the composite primary *key* of this table,
as one book can't be borrowed by multiple people on the same day.
`Book_id` is the foreign *key* in this table,
as one book can't be borrowed by multiple people on the same day.
`Book_id` is the foreign *key* in this table,
as the `book_id` property is related to the `book_id` field in the Books table,
which is the primary *key* in the `Books` table.

Whenever a book is borrowed from the library,
a new entry is created in the `Borrowing_status` table with
all the details and the expected return date.
Similarly, when a book is returned,
the same entry is modified to update the `return_date` and `borrowing_status` properties.

If a book is more than two weeks overdue,
the librarian can retrieve the borrower information from
the `Borrowers` table and send the reminder email.

This use case provides you with an example of how a RDBMS is implemented in real life.
Based on what you've learned, identify a use case in a domain that you are familiar with.
The use case that you describe can be a hypothetical scenario,
so you do not have to know and identify the properties for an actual existing database.

### Discussion Response

I've wanted to build a self-hosted set of microservices that hashes,
indexes and stores any arbitrary content you give it, whether it's a URL to a site,
a picture file, or lines of text.
The way I see it services like `bit.ly`, `pastebin.com`, and `imgur.com`
perform roughly the same operations on its data but present them in different ways.
Think a combined URL shortener, paste bin, and media file host.
It would all revolve around a database that stores the content references,
think of the shortened URL in this case,
a hashed string like `abc123` would be the content ID and would point to
a reference like `https://www.google.com/` or a file stored in the service.
Then other properties like content type, creation date, expiration date, and
permissions can expand on its functionality.

I think a `References` table would be the linchpin to the whole thing.
It would store a hash that serves as the content ID, maybe call it `content_id`
and it probably should be the primary key since it's unique for every entry.
Then whatever common properties all the content types have in common would be
stored in this table, like the original reference.
If it's a URL that reference would be the URL, like `https://www.google.com/`.
If it's a file or lines of text it would be a reference to
an S3 endpoint or filesystem path holding the content.

Then for URL content,
a `URLs` table would use the same primary key as
the `References` table since URL references are a subset of all references.
Then it would have all the properties necessary to have a feature-rich URL shortener.
Maybe you want to track visits, so you'd have a `visits` field that's an integer.
Maybe you want an expiration date for a URL, so you'd have an `expiration_date` field.

For image content, you'd again have the same primary key as the `References` table.
You also might want to reference a thumbnail file that's generated for
the original image to enable image previewing.
You might also want to know the original source of the image or its resolution.

For a paste bin type analogous service you'd have a `Texts` table that,
again would have the same primary key as the `References` table.
You might want to know the language of the text, so you'd have a `language` field and
this could include programming languages like python or javascript to
change syntax highlighting or spell-checking for prose text.

Writing this out I'm realizing I've never encountered a use case where
the primary key of a table is the same for several other tables. I think
what I'm most interested about hearing from my peers is if
this is a good idea or if there are any pitfalls I'm not thinking of.
I think it might actually be beneficial in terms of `SELECT` queries
where joins are inherently simplified.

## Knowledge Check 12.1: Containers

* Q1: Which of the following have their own operating systems?
  * Virtual Machines **(Correct)**
* Q2: Which of the following options lists the correct order of
steps required to run a MySQL database using containers on your machine?
  * a. Install Docker on machine.
b. Download MySQL Docker image from Docker registry.
c. Execute `docker run` command to start container using MySQL image.
**(Correct)**
* Q3: What is a container?
  * Containers provide isolated environment with
share operating system & come with executable & libs as needed. **(Correct)**
* Q4: Which of the functions can you perform on a running container?
  * All the above **(Correct)**
* Q5: What is the basic syntax to define a cursor in Python?
  * `cursor.execute(query)` **(Correct)**

## Mini Lesson 12.2: MongoDB

### What Is MongoDB?

MongoDB is a NoSQL database,
which means that the data is not modeled in
the tabular relationships used in relational databases.
MongoDB is a *document-oriented* database that stores information in
several *document* *collections*.
A *document* *collection* in MongoDB would be the equivalent of
a table in a relational database.
MongoDB stores *documents*, the equivalent of MySQL records, in JSON format,
and it does not need the structure or the schema of a relational database.

*Documents* are organized into *collections* where they can be *queried*.
Data that is frequently accessed together is stored in the same place so
read operations are extremely fast because no joins are required.

MongoDB knows how to coordinate multiple servers to store data.
That makes MongoDB what is called a distributed database,
which provides fault tolerance by keeping redundant copies of
the same data in different servers,
so a single server failure does not affect the application.
MongoDB also scales across multiple servers to store data so,
as data volume increases and performance requirements grow,
you can just add more servers.

MongoDB is a widely used open-source *document* database.
In fact, you will be taking advantage of containers to run MongoDB in
order to install it and then run it on your machine.

### Creating a Database Using MongoDB

Python can be used in database applications.
MongoDB is one of the most popular NoSQL database tools.
In this mini-lesson, you will learn about how to use MongoDB to create databases.

As you saw in Video 12.6,
the first thing you need to do in order to connect to
MongoDB using a Python driver is to install it on your machine.
To accomplish this run the following command in your Terminal window:

```sh
pip3 install pymongo
```

To create a database in MongoDB,
start by creating a Python file in your code editor of choice (e.g., VS Code).

Next, you need to create a MongoClient object,
then specify a connection URL with the correct IP address and the name of
the database you want to create. See the code below:

```python
import pymongo
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["mydatabase"]
```

To check whether a database exists by listing all databases in your system,
you can run the following code:

```python
print(myclient.list_database_names())
```

In MongoDB, tables are called *collections*.
To create a *collection* in MongoDB,
use the database object you created previously and specify the name of
the *collection* you want to create.

The code below shows how to create a *collection* named customers in
the `mydatabase` database defined above.

```python
import pymongo
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]
```

You can check whether a *collection* exists in
a database by listing all *collections*.
To do so, add the following line to your Python script:

```python
print(mydb.list_collection_names())
```

In MongoDB, records are called *documents*.
To insert a *document* into a *collection*, you can use the `insert_one()` method.

The first parameter of
the `insert_one()` method is a dictionary containing the name(s) and value(s) of
each field in the *document* that you want to insert.
See the example below:

```python
import pymongo
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]
mydict = { "name": "John", "address": "Highway 37" }
x = mycol.insert_one(mydict)
```

To insert multiple *documents*,
you will need to use the `insert_many()` method.

```python
import pymongo
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]
mylist = [
  { "name": "Amy", "address": "Apple st 652"},
  { "name": "Hannah", "address": "Mountain 21"},
  { "name": "Michael", "address": "Valley 345"}
]
x = mycol.insert_many(mylist)
print(x.inserted_ids)
```

MongoDB is a powerful tool that you can use to
create databases using [Python][py-zk] code.

## Knowledge Check 12.2: Document, Key-Value, and Distributed Scalable Databases

* Q1: Which of the following are advantages of document stores?
  * All the above **(Correct)**
* Q2: What kind of database is MongoDB?
  * Document-based **(Correct)**
* Q3: What document format is used in MongoDB?
  * JSON **(Correct)**
* Q4: How does MongoDB provide fault tolerance?
  * Keeps multiple copies of same data on different servers **(Correct)**
* Q5: What are tables called in MongoDB?
  * Collections **(Correct)**
* Q6: What is Redis?
  * An in-memory, key-value data store **(Correct)**
* Q7: What is the difference between keys in Redis & keys in dictionaries?
  * In Redis keys are always strings, Python any datatype **(Correct)**
* Q8: What does the `DEL` method do in Redis?
  * It removes the specified key **(Correct)**
* Q9: Which of the following is an advantage of the Cassandra database?
  * It's highly scalable **(Correct)**
* Q10: What are keyspace in Cassandra?
  * A keyspace is like an RDBMS database **(Correct)**

## Discussion 12.2: Document, Key-Value, and Distributed Scalable Databases

### Discussion 12.2 Prompt

As you have seen, databases can be of different types depending on your needs.
For example, you can have document, key-value, and distributed scalable databases.
In this discussion, you will be asked to provide a short description of
the differences, pros, and cons of these different types of databases.
Additionally, you will be challenged to propose examples of
how each database can be used.

Make sure that you include the following in your post:

Using your own words,
include a description of what each of the three database types are:
document, key-value, and distributed scalable databases.
Focus on the differences, pros,
and cons of these databases.
Present a short case study for each of
the three types of databases above using data that interests you,
and explain why it would be a good decision to
choose different databases depending on your data.

### Discussion 12.2 Comment Prompt

Read the statements posted by your peers.
Engage with them by
responding with thoughtful comments and questions to deepen the discussion.

**Suggested Time:** 60 minutes

**Suggested Length:** 300 words

This is a required activity and will count toward course completion.

### Discussion 12.2 Answer

#### Document Databases

Document databases are databases that store data in the form of documents.
In the case of MongoDB, documents are stored in special kind of JSON format.
This confers some unique advantages and disadvantages over relational databases.

* **Advantages**
  * Separate documents means that it's easier to scale horizontally.
    * Because data is subdivided this way,
splitting and syncing the data across servers becomes easier,
thus scaling horizontally becomes easier.
  * The flexible markup of documents makes it easier to store data without
any overriding schema.
    * That makes it easier to write software for the datastore.
    * It also makes ingesting data from other sources easier.
* **Disadvantages**
  * Not great at modeling relationships between data.
    * This is because the data is stored in separate documents.
    * Queries become more complex as you often have to join data from
different documents and unpredictable schemas.
  * Not ACID compliant.
    * This means that it's not transactional.
    * Extra software necessary to ensure data integrity.
* Use-cases
  * Highly user-facing applications.
    * Since it's easier to shard data by each user
  * Situations where it's hard to know a schema in advance.
  * Situations where it's hard to scale vertically anymore than you have.

#### Key-Value Databases

Key-value databases are databases that store data in the form of key-value pairs.
Much like the dictionaries and hash tables that you have seen in programming languages.
On the spectrum of complexity, key-value databases are the simplest.

* **Advantages**
  * Due to their simplicity, they are very fast.
    * The nature of hash tables means all CRUD operations scale in constant time.
    * Their simplicity also makes them ideal for in-memory storage (fast).
  * Scale horizontally since keys are easy to shard across load balancers.
  * They are very easy to use.
    * Since they work similarly to dictionaries, they're easy to use.
* **Disadvantages**
  * Not great at modeling relationships between data.
    * No schema, means there's no fixed relationship between keys.
  * Not ACID compliant.
  * Name-spacing is difficult.
    * Because there's no schema, some way to uniquely namespace keys is needed.
* Use-cases
  * Caching for another kind of database.
  * Session storage (login-sessions, shopping carts, etc.).

#### Distributed Databases

Distributed databases are built from the ground up to split and replicate data
across multiple servers.
This can even include splitting the workload across multiple data centers.
This makes them ideal for large datasets and fault tolerance.

* **Advantages**
  * Fault tolerance.
    * Keeps multiple copies of same data on different servers.
    * If one server goes down, the data is still available.
    * This can include geographically distributed servers.
  * Scalability.
    * Can scale horizontally by adding more servers.
  * Better at handling larger datasets.
    * Because of the way data is natively distributed across servers,
it has built-in methods to ease larger data processing, think map, filter reduce.
* **Disadvantages**
  * Not ACID compliant.
    * Sometimes they are but replication time can be slow.
  * Complex to set up.
    * Requires a lot of configuration and setup across many servers.
* Use-cases
  * Data lakes for offline analysis.
  * Highly scalable applications.

## Discussion 12.3: Use Cases for Serverless Cloud Databases

### Discussion Prompt

As you have seen, Firebase is a serverless cloud database.
Although it is one of the most famous and easy to use,
it is not the only serverless cloud database offered by
the data engineering community.
In this discussion, you will be proposing an example of
a use case of your choice using Firebase,
and you will give a brief introduction about the other types of
serverless cloud databases offered on the internet.

Make sure that you include the following in your post:

Using your own words,
include a description of what a serverless cloud database is.
Present a short case study using data that interests you and
explain why it would be a good choice to write your data to Firebase,
a serverless cloud database.

After doing some research on the internet,
choose a different serverless cloud database other than Firebase and
give a brief description of how it works.
Focus on the differences, pros, and cons of it compared to Firebase.
For example,
you could research the AWS Serverless Cloud Database or the Aurora Serverless
(Links to an external site.) Cloud Database.

### Comment Prompt

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

**Suggested Time**: 60 minutes

**Suggested Length**: 300 words

This is a required activity and will count toward course completion

### Discussion Answer

#### Serverless Cloud Databases

Serverless cloud databases, like any other form of serverless resources,
is a database whose infrastructure, configuration, maintenance, scaling,
and security are all managed by a third-party.
To you the developer, it's just a set of APIs that you interact with.
The end result is a database that you can write to and read from,
but everything else is being handled behind the scenes.

In my previous discussion post I discussed building a kind of content bin or
URL shortener using relational database.
Let's compare its implementation between Firebase the industry gold-standard and
a serverless database I've had my cloud on Planetscale.

#### Firebase

Firebase is a serverless cloud database that is owned by Google.
It's a document database that uses JSON to store data.
Beyond just its serverless nature,
it comes with a lot of benefits baked in.
There's add-on features to ease development of authentication,
real-time data syncing, analytics (it's Google after all), and more.

In my use-case the primary disadvantage I can think of is that
there is no way to define schemas with relationships which will complicate queries.
However, it offers good pricing for small projects and
a lot of features like authentication which can be useful.

#### Alternatives to Firebase

I've been interested in both Supabase and Planetscale for a while now.
Since someone has already mentioned Supabase, I'll focus on Planetscale.
The main difference between both and Firebase is that they are SQL databases.
Planetscale is built on MySQL and a horizontal scaling architecture, Vitess.
Supabase is based on PostgreSQL.
What Planetscale offers that Firebase doesn't is the ability to define schemas
and relationships between tables.
To me that's a big deal because I can relate predictable data to each other.
It also offers authentication, serverless functions, and object storage.
The other big difference is it's built with open source tooling.
Using Firebase locks you into the Google ecosystem.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Python][py-zk]
* [Types of Databases][db-types-zk]
* [Relational Databases][relational-db-zk]
* [Document Databases][doc-db-zk]
* [MongoDB Using Python][mongo-py-zk]
* [Key-Value Databases][key-value-db-zk]
* [Distributed Databases][dist-db-zk]
* [Cassandra (Distributed Database)][cassandra-zk]

<!-- Hidden References -->
[py-zk]: ./python.md "Python"
[db-types-zk]: ./types-of-database.md "Types of Databases"
[relational-db-zk]: ./relational-database.md "Relational Databases"
[doc-db-zk]: ./document-database.md "Document Databases"
[mongo-py-zk]: ./mongodb-using-python.md "MongoDB Using Python"
[key-value-db-zk]: ./key-value-database.md "Key-Value Databases"
[dist-db-zk]: ./distributed-database.md "Distributed Databases"
[cassandra-zk]: ./cassandra.md "Cassandra (Distributed Database)"
