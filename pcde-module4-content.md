---
tags: [pcde, module4, quiz, discussion, course]
---
# PCDE Module 4 Discussions & Quizzes

## Discussion 4.1 - Examples of Big Data Applications

### Prompt

Do some research & identify a big data application that you find interesting.
First,
share your understanding of the application.
Describe why you have chosen that particular application and
make sure to include a link or citation to the application.

1. How big is the data?
2. What are the application objectives?
3. What technologies are being used in the application?
4. Can you brainstorm any potential ideas for
further enhancements for the application or analytics?

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

### Answer

I've worked on software for retail companies before,
mainly on the frontend.
The data collected by retailers can be huge.
You need the order history of customers.
The supplier history of pricing.
The customer habits on the store.
There's many other sources but I'll focus on these.

The primary objectives of Big Data in retail is to
analyze customer behavior and improves sales with that information.
This data can then be used to gain insights in customer preferences,
buying patterns, supplier pricing, supplier inventory and market trends.
This data then gets used to:
personalize marketing efforts, improve inventory management, and
optimize pricing and sales strategies.

The store site,
customer order system and inventory management side of the system will
typically consist of some relational database.
These datasets are usually highly related and
need quick access via software.
They might even include in memory key value databases to manage user sessions.

The **Big Data** will typically get warehoused by
the likes of *Hadoop*, *MongoDB*, or *Spark*.
This data is less live like the kinds stored in relational databases.
Typically the data warehouses are used to periodically perform analytics
whose results end up in the faster databases.

Since the lectures have mentioned the use of IoT for
data collection,
I personally brainstormed an idea of using more sensors in retail stores to
get better insights into customer behavior to
better optimize the physical stores.
Does this new layout hurt the likelihood that
someone will find a product they want?
Do these displays improve the likelihood of a purchase?
These are the kinds of retail applications that could be improved
by employing Big Data analytics with data from new sources like IoT.

## Discussion 4.2: Entities & Properties: Applications

### Prompt

At the end of Video 4.5,
Dr. Sanchez challenges you to come up with
an example of a simple database with entities and
properties that suits an area of your interest.
Following the example presented in the video about colleges and students,
find an application that you are interested in and
come up with at least two entities,
each with at least three corresponding properties.
In your post, include:

1) why the application interests you,
2) a detailed description of the entities and properties, and
3) a description of the potential relationships between these entities.

For example, you may want to define a Houses table with properties SquareFootage,
NumOfBedrooms, and Basement that describe, respectively,
the square footage of the house, how many bedrooms it has,
and whether it has a basement or not.
Next, you could define another table,
Neighborhoods, with properties Houses, Schools, and DistanceFromDowntown.
In this second table, each property describes a particular house that
belongs to that neighborhood, how many schools are in the neighborhood,
and the average distance of the house in the neighborhood to downtown.
A potential application for this example would be to
help a real estate agent keep track of the types of listings they have available.

Your initial response should be 100 to 125 words.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and questions to deepen the discussion.

Suggested Time: 45 minutes

Suggested Length: 100-125 words

This is a required activity and will count toward course completion.

### Response

I have worked a lot on frontends in the e-commerce sector so my thoughts were on
a set of database entities and properties that often get used there.
So it's interesting to me to potentially get into the data layer of
all the front end code I've written in this field over the years.
Below is a nested list version of them for easier reading.

* `Customers`
  * To represent each customer using the store
  * Properties would include:
    * `Name`
    * `Address`
    * `Email`
* `Products`
  * To represent individual orderable products,
potentially even packs of products like a 12-pack of soda.
  * Properties would include:
    * `SKU`
    * `ProductName`
    * `Price`
    * `Stock`

The three most important entities I thought of are:
`Customers`, `Products`, and `Orders`.
These three together can represent a lot about an online store.

`Customers` will hold information about the customer.
Information like:
`Name`, `Address`, and `Email` would be included as properties.
This data would depend on which `Customer` is on that record.

`Products` would represent all the products in the store.
Each product would have:
an `SKU`, `ProductName`, `Price`, and `Stock`.
An `SKU` is a *Stock Keeping Unit* and
it is a common numbering system which gets used in retail.
Almost any physical product in a store will have one or something like it.
This will be important to track each individual product.
The `ProductName` should be seperate from the `SKU` since
it has a tendency to change,
*believe me it can be a pain when it does*,
so it should be a seperate property from `SKU`.
The `Price` & `Stock` fields are fairly simple.
`Price` is there to track a product's ever changing price.
The `Stock` is there to track how many of them are available for order.

## Quiz 4.1 - NoSQL vs SQL

### Q1

Which industry in Video 4.1 proves to be data-rich but
struggles to obtain good predictions based on data?

* Automobile
  * **Not Correct**
* Climate
  * **Not Correct**
* Athletic
  * **Correct**
* Retail

### Q2

Which industry or domain is not mentioned in Video 4.1 that
has many data applications?

* Retail
  * **Correct**
* Transit
* Agriculture
  * **Not Correct**
* Energy
  * **Not Correct**

### Q3

If a website generates data in the form of JSON documents,
what type of database would you use to store these JSON documents?

* It's not possible to store JSON documents
* You must process the JSON documents before storing in SQL or NoSQL databases
  * **Not Correct**
* NoSQL
  * **Correct**
* SQL

### Q4

What type of database would you use to store airline data containing
passangers' travel history information with
columns showing date of travel origin, destination, etc...?

* Both SQL & NoSQL
* SQL
  * **Correct**
* It is not possible to store this data
* NoSQL

### Q5

Which database can be used to store data with key-value pair format?

* Terradata
* SQL Server
* MySQL
* HBase
  * **Correct**

## Quiz 4.2 - Entities, Properties, Primary Keys, & Relationships Between Tables

### Q1

What are *entities* in a data model?

* Potential data types
* Potential *keys*
* Potential columns
* Potential tables
  * **Correct**

### Q2

What are referred to as *properties*?

* Table logical structures
* Table storage
* Table name
* Table columns
  * **Correct**

### Q3

What is the purpose of a unique identifier?

* To uniquely identify any row
  * **Correct**
* To uniquely identify table design
* To uniquely identify any column
* To uniquely identify table name
  
### Q4

What should you do if a table doesn't contain a unique identifier?

* Delete a column from the table
* Add a column whose value is unique for every row
  * **Correct**
* Nothing needs to be done
* Add a row with unique values

### Q5

Suppose there are two *entities* called `Employees` and `Organizations`.
The *entity* `Employees` has a *primary key* called `OrganizationId`.
The `OrganizationId` column is also present in the *entity* `Employees`.

In the *entity* `Employees`, the `OrganizationId` column is treated as what?

* *Tertiary key*
* *Primary key*
* *Second key*
* *Foreign key*
  * **Correct**

### Q6

What is the meaning of *cardinality*?

* It defines column structure
* It defines the number of tables in the data model
* It defines how one table relates to another
  * **Correct**
* It defines the row-column relationship within a table
  * **Not Correct**

### Q7

What are the possible relationships between two tables?

* N-to-N
* 1-to-1
* 1-to-N
* All answer options describe possible relations between tables
  * **Correct**

### Q8

Suppose there are two tables called `Employee` and `Organization`.
Suppose further that one employee can only work for a single company at a time.
`Employee` has a *primary key* of `EmployeeId` and `Organization` has a
*primary key* of `OrganizationId`.
Additionally,
`OrganizationId` is a *foreign key* in the `Employee` table.

What kind of relationship exists between the `Organization` and `Employee` tables?

* 1-to-N
  * **Correct**
* No relationship is possible in this case.
* N-to-N
* 1-to-1
  * **Not Correct**

### Q9

Suppose you have two tables: `Students` and `Results`.
`Students` has a *primary key* of `roll_num` and
`Results` has a *primary key* of `result_id`.
Additionally, `result_id` is a *foreign key* in the `Students` table.
The `result_id` is unique for ea. student.
No two students can have the same `result_id`.

* 1-to-1
  * **Correct**
* There is no clear relationshop in this case
* N-to-N
* 1-to-N

## Self Study Drag & Drop Activity 4.1: Database Design

### Initial Statements to Be Filled in

One fundamental step when designing a database is to
identify its entities and *(?)*.

An entity can be thought of as *(?)* defined within a database.
On the other hand,
properties are simply defined as the *(?)*,
or attributes, that each table *(?)*.

When defining the entities and properties of a database,
it’s important to check if any table has been *(?)* in the design process and if
all the properties are *(?)* to the correct table.

The next step in database design is to identify a *(?)* for each table.
Primary keys are also called *(?)* and they are useful to
access any *(?)* record in your table.

Defining a primary key is of paramount importance.
In fact, failing to define one can cause problems in your database *(?)*.

A strategy to ensure that a unique identifier is present is to
add an extra *(?)* to your table that will act as a unique identifier.

Finally, before physically designing a database,
it’s important to understand
the *(?)* between the different entities in your database.
This is particularly useful because it allows you to
establish how *(?)* between the tables can be *(?)*.

There are three types of relationships:
1-to-1 (one-to-one),
*(?)* (one-to-many),
and N-to-N *(?)*.

### Complete Statement with all Blanks Filled in

One fundamental step when designing a database is to
identify its entities and ***properties***.

An entity can be thought of as a **table** defined within a database.
On the other hand,
properties are simply defined as the **columns**,
or attributes, that each table **captures**.

When defining the entities and properties of a database,
it’s important to check if any table has been **forgotten** in the design process and if
all the properties are **attached** to the correct table.

The next step in database design is to identify a ***primary key*** for each table.
Primary keys are also called **unique identifiers** and they are useful to
access any **unique** record in your table.

Defining a primary key is of paramount importance.
In fact, failing to define one can cause problems in your database **manipulation**.

A strategy to ensure that a unique identifier is present is to
add an extra **column** to your table that will act as a unique identifier.

Finally, before physically designing a database,
it’s important to understand
the **relationships** between the different entities in your database.
This is particularly useful because it allows you to
establish how **records** between the tables can be **accessed**.

There are three types of relationships:
1-to-1 (one-to-one),
**1-to-N** (one-to-many),
and N-to-N **(many-to-many)**.

### Responses

## Quiz 4.3: Naming Practices

### Q1

In Video 4.10,
what noun form is recommended for use in table names?

* Either plural or singular
* Singular
* Plural
  * **Correct**
* No suggestion provided

### Q2

In Video 4.10,
the professor suggested using what type of form for column names?

* Either plural or singular
* Plural
* Singular
  * **Correct**
* No suggestion provided

### Q3

One of the table names in a database is `Books` &
the db designer would like to have a `book ID` as
the *primary key* of this table.
Which of these names follow
the naming convention that was reviewed in Video 4.10?

* `bookID`
* `Bookid`
* `BookID`
  * **Correct**
* `BooksID`

### Q4

There are two tables in a database:
`Books` & `Authors`.
Which name is most likely to be a *foreign key* name in the `Books` table?

* `authorID`
* `AuthorID`
  * **Correct**
* `authorsID`
* `AuthorsID`

## Mini Lesson 4.1: Normalization

As part of a self learning exercise from the subject of
[database normalization][db-design-normal-zk],
Follow along this Mini Lesson.

### What is Normalization?

*Normalizing* data involves a set of practices that
primarily aim to avoid redundancy in the data,
improve integrity, and eliminate duplicate records.

When building out the details of a table,
you may run into anomaly issues whenever adding,
updating, or deleting data.
*Normalization*,
with its set of database organization practices,
can help prevent that.

A database that has been *normalized* is considered a *Normalized Form*.

### What Types of Normalized Forms Exist?

There are three types of *normalized forms*:
*First Normal Form (1NF)*,
*Second Normal Form (2NF)*,
*Third Normal Form (3NF)*.
Let's review ea. of them in more detail.

The *1NF* ensures that any cell in your table contains only a single value.
This can also be referred to as *atomicity* and
it ensures that records can be accessed individually without
the risk of unintentionally retrieving multiple values.

The *2NF* builds on the first form.
The *2NF* can't be enforced w/o having implemented the *1NF*.
The goal of the *2NF* is to guarantee that
every non-key depends on the entire *PK*.
In certain cases,
one may want to separate a single table into smaller tables and
assign a *PK* to ea. table.
Doing so guarantees the dependence of ea. value on a key.

Like the relation between the *2NF* & the *1NF*,
the *3NF* builds on the *2NF*.
In other words,
if a column,
say `A`,
depends on the *PK* column,
then you cannot have another column,
say `B`,
also depend on column `A` &
indirectly on the *PK* column.
As with *2NF*,
a popular strategy to avoid this issue is to separate the original table into
smaller ones and assign new *PKs* to guarantee independence.

### Further Reading

More can be learned about the nuances of
normalization in SQL and its many types,
by reading this [edureka article][normalization-types-edureka]
on the subject.

## Quiz 4.4: Cardinality Between Tables and Normalization

### Q1

Suppose that you have two tables called `Students` & `Subjects`,
where `Students` has a *primary key* of `studentId` and
`Subjects` has a *primary key* of `subjectId`.
Each student can opt for multiple subjects and
each subject can be opted for by multiple students.

What kind of relationship can be established between
the tables `Students` and `Subjects`?

* No relationship is possible between the two tables
* 1-to-N
* 1-to-1
* N-to-N
  * **Correct**

### Q2

Suppose that you have two tables called `Employees` & `Vehicles`,
where `Employees` has a *PK* of `employeeId` and
`Vehicles` has a *primary key* of `vehicleId`.
Each employee can have multiple vehicles &
each vehicle belongs to only one employee.
What kind of relationship can be established between
the tables `Employess` & `Vehicles`?

* No relationship is possible between the two tables
* 1-to-N
  * **Correct**
* 1-to-1
* N-to-N

### Q3

Suppose you have two tables called `Publishers` & `Books`,
with *PK* set as `pubId` & `bookId` respectively.
Also,
assume that a 1-to-N relationship exists between the two tables.
How would you map and represent the data in
these tables to reduce redundancy in the data?

* Add a column called `bookDate` to the `Books` table
* Add a column called `pubId` to the `Books` table
  * **Correct**
* There is no need to add a column to either table.
The tables can be represented as is.
* Add a column called `bookId` to the `Publishers` table.

### Q4

What is a *foreign key*?

* It is a field that is linked to
another table's *primary key* field in a relationship between
two tables.
  * **Correct**
* There is no such thing called as *foreign key*
* *Foreign keys* are custom created columns to store only date values.

### Q5

What is the goal of *normalization*?

* All answer options describe goals of normalization
  * **Correct**
* To split up tables that can be put together with *joins*
* To reduce data redundancy within the tables
* To provide data integrity by avoiding data duplication

### Q6

Which normal form requires that each cell in the table should
have an atomic value?

* *Third Normal Form*
* *First Normal Form*
  * **Correct**
* This rule is not required by any form of *normalization*
* *Second Normal Form*

### Q7

Which of the following is related to the *Second Normal Form*?

* Every non-key should be independent
* Some of the non-keys can be dependent on the entire *primary key*
* Every non-key must depend on the entire *primary key*
  * **Correct**
* Every *primary key* should depend on a non-key

### Q8

What does the *Third Normal Form* require?

* A non-key column must not depend on another non-key column
  * **Correct**
* A non-key column can depend on other non-key columns
* A non-key column cannot depend on the *primary key*
* The *primary key* column should depend on a non-key column.

## Example Education Database

For the rest of the course,
a simple example database for tracking students and colleges will be used.

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

## Discussion 4.3: Database Application Design

### Prompt

For this discussion,
you will continue to add more complex design aspects to
the database that you started in Discussion 4.2.

In your discussion post,
identify and describe the relationship between
the entities and properties in your database.
Then define and include details about the primary keys and
foreign keys of all of your tables.

Finally,
identify and discuss three potential use cases of the database that you designed.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

Suggested Time: 60 minutes

Suggested Length: 150 words

This is a required activity and will count toward course completion.

### Answer

I wrote about retail being a common use of big data,
so I'll design a database around a theoretical online retailer.
To me the most important tables or entities sounds like:

* `Customers`
  * To represent each customer using the store
  * Properties would include:
    * `CustomerID` **(PK)**
    * `Name`
    * `Address`
    * `Email`
* `Products`
  * To represent individual orderable products,
potentially even packs of products like a 12-pack of soda.
  * Properties would include:
    * `SKU` - Or *Stock Keeping Unit* - **(PK)**
    * `ProductName`
    * `Price`
    * `Stock`
* `Orders`
  * All purchase orders that customers have made
  * Properties would include:
    * `OrderID` **(PK)**
    * `CustomerID` **(FK)**
* `ProductOrders`
  * This is a *mapping table* to establish
the *many-to-many* relationship between `Products` & `Orders`
  * To work it needs these properties
    * `ProductOrderID` **(PK) = (FK) + (FK)**
    * `OrderID` **(FK)**
    * `ProductID` **(FK)**
    * `Quantity`

A quick summary about the entities, properties and relations.
In the `Customer` entity, which represents each customer with an account.
Its *primary key* is the `CustomerID`.
Although the `Email` property is unique for every `Customer`,
it makes sense to have a separate *primary key* in case they want to change email.
Online retailers also often allow associating via multiple email addresses.
This means the second normal form is broken because each primary key needs to
be unique entirely to one entity.
The rest of the properties are non-keys describing the `Customer`,
that are entirely dependent on the *primary key*.

Next the `Proucts` entity,
The first property is the `SKU`.
In retail,
almost everyone uses some `SKU` or *Stock Keeping Unit* system.
Each `SKU` is unique by design so it only makes sense to make this
the *primary key* for `Products`.
The rest of the properties are *non-key* properties describing the product.
There are no *foreign keys* because `Products` are *many-to-many* related to
`Orders` which necessitates a join table `ProductOrders`.
The relationship for a *many-to-many* entity and its join table is *1-to-many*.
Meaning the *foreign key* should reside in the join table.

Now for the `Order` entity, which describes any given order a customer has made.
Its *primary key* is an `OrderID`.
It has a *1-to-many* relationship with customers.
One `CustomerID` can have many orders,
but single `Orders` don't make sense being related to multiple `Customers`.
Because `Orders` is the *many* in *1-to-many* it makes most sense to
put the *foreign key* to `Customers`,
`CustomerID` inside `Orders` to avoid duplication of data.
Just like with `Products` which `Orders` has a *many-to-many* relation with,
the relationship for an entity to its join table is *1-to-many*.
This means `Orders` only duplicates data by
putting a `Product` related *foreign key* within it.

Finally, the `ProductOrder` join table.
This is the join table that maps `Products` & `Orders` together.
Because `ProductID` & `OrderID` are each unique within their tables,
compositing their values by concatenation guarantees `ProductOrderID`,
the *primary key*,
is also unique.
And since the relation between a join table and
its joining entities is *1-to-many* with the *many* on the join table side,
this means the *foreign keys* in the relationship should reside here.
So this table will have two *foreign keys*;
the `ProductID` and `OrderID` being mapped together.
There's also another piece of information that
depends on both `Products` & `Orders`, `Quantity`.
The `Quantity` of `Products` in `Orders` depends on both `Entities`.
This means in the *third normal form* it makes most sense to
place that property here.

There's tons more complexity involved in any e-commerce site.
However, I thought these most simply describe some of the
database modeling topics we've encountered so far.

## Quiz 4.6: Datatypes

### Q1

While creating a table in a database, which of the following needs to be defined?

* Table name
* Properties name
* All answer options must be defined
  * **Correct**
* Properties datatypes

### Q2

What can happen if a field has the wrong datatype in a table?

* Risk of losing the database
* Risk of losing the table
* Risk of data loss in that field
  * **Correct**
* There would be no negative impact. It’s okay to have the wrong datatype in a field.

### Q3

Which datatype is the best when there are leading zeroes in the data,
such as ZIP codes used in U.S. addresses?

* Boolean
* Any datatype would work fine
* Numeric Types
* Character Types
  * **Correct**

### Q4

Which keyword is used to order the dataset in ascending order in a MySQL query?

* ASC
  * **Correct**
* ASCEND
* ORDER
* INCREASE

## References

### Web Links

* [What is Normalization in SQL & What Are its Types? (from edureka.co by Prateek TL)][normalization-types-edureka]

<!-- Hidden Reference Links Below Here -->
[normalization-types-edureka]: https://www.edureka.co/blog/normalization-in-sql/ "What is Normalization in SQL & What Are its Types? (from edureka.co by Prateek TL)"

### Note Links

<!-- Hidden Reference Links Below Here -->

### Referenced By

* [Database Design: Normalization][db-design-normal-zk]

<!-- Hidden Reference Links Below Here -->
[db-design-normal-zk]: ./database-design.md#Normalization "Database Design: Normalization"
