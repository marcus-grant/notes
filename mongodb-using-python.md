---
created: 2022-12-05T10:08:05.765Z
modified: 2023-03-27T11:21:03.607Z
tags: [python,mongodb,backend,database,driver,data]
---
# Control MongoDB Using Python

It's possible to create server logic within python directly interacting with
[MongoDB](document-databases.md) servers.
First, a driver is needed.
In python this MongoDB driver package is known as `pymongo`.
Install it using pip like this:

```sh
pip3 install pymongo
```

## Creating a Database Using MongoDB

To create a database in MongoDB start by creating a Python file.
Then add an import statement for `pymongo`,
instantiate a `MongoClient` class and select a database using that client.

```python
import pymongo
myclient = pymongo.MongoClient('mongodb://localhost:27017')
mydb = myclient['mydatabase']
```

### Check if Database Exists

```python
print(myclient.list_database_names())
```

In MongoDB tables are called *collections*.
To create a *collection* in MongoDB,
use the database object created previously and
specify the name of the *collection* to create.

The code below shows how to create a *collection* named `customers` in
the `mydatabase` database defined above.

```python
import pymongo
myclient = pymongo.MongoClient('mongodb://localhost:27017')
mydb = myclient['mydatabase']
mycol = mydb["customers"]
```

You can check whether a *collection* exists in a database by listing all *collections*.
To do so add the following line to your python script.

```python
print(mydb.list_collection_names())
```

In MongoDB, records are called *documents*.
To insert a *document* into a *collection*, you can use the `insert_one()` method.

The first parameter of the `insert_one()` method is a *dictionary* containing
the names and values of each field in the *document* that you want to insert.
See the example below:

```python
import pymongo
myclient = pymongo.MongoClient("mongodb://localhost:27017")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]
mydict = {"name": "John", "address": "Highway 37"}
x = mycol.insert_one(mydict)
```

To insert multiple *documents*, you will need to use the `insert_many()` method.

```python
import pymongo
myclient = pymongo.MongoClient("mongodb://localhost:27017")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]
mylist = [
    {"name": "Amy", "address": "Apple st 652"},
    {"name": "Hannah", "address": "Mountain 21"},
    {"name": "Michael", "address": "Valley 345"},
]
x = mycol.insert_many(mylist)
print(x.inserted_ids)
```

## References

MongoDB is a powerful tool that you can use to create databases using Python code.
For more examples visit the  [PyMongo Tutorial Page][pymongo-tutorial].
For the official documentation,
visit [PyMongo API Reference Page][pymongo-api-ref]

* [PyMongo Tutorial Page][pymongo-tutorial]
* [PyMongo API Reference Page][pymongo-api-ref]

<!-- Hidden References -->
[pymongo-tutorial]: https://pymongo.readthedocs.io/en/stable/tutorial.html "PyMongo Tutorial"
[pymongo-api-ref]: https://pymongo.readthedocs.io/en/stable/api/index.html "PyMongo API Reference Page"
