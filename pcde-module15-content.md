---
created: 2023-04-13T09:53:39.796Z
modified: 2023-04-17T16:25:06.225Z
tags: [pcde,module15,project,authorization,python,flask,web,dictionary,api]
---
# PCDE Module 15 Course Content

## Introduction

In this module,
you will be working on two new projects that
you will be able to add to your portfolio.
The projects are divided into three components.
Project 15.1 will use JSON web *server* authentication and authorization that
allows you to control who can use the application and what they are allowed to
do once inside the application.
Project 2 is divided into two parts:
in Project 2 Part 1, you will work with a database using *lists*, *functions*,
and *dictionaries* to compute student grades.
Essentially employing [Python Collections][-py-collections] when
dealing with [relational databases][-db-relational].
In Project 2 Part 2,
you will compute student grades using *redundant dictionaries* and
improve the *functions* in your database.

This module includes two main projects,
divided into three different project submissions:

The first project is Project 15.1: Project 1: Creating a Books Web Application.

In Project 15.1,
you will expand on the concepts you learned in Module 11 to
create a website that shows a *collection* of books.
First, you will learn how to add images to your website.
Next,
you will practice adding more users along with
their respective usernames and passwords.
You will also learn how to allow users with different roles,
such as `admin` or `reader`,
to perform different actions on the website.

The anticipated time to complete this project is
approximately **4 hours and 30 minutes**.

The second project is divided into two submissions:

The first submission for the second project is Project 15.2:
Project 2 Part 1: Creating a Student Grades Database.

In Project 15.2,
you will work in Codio to practice using [Python][-py] *lists*, *functions*,
and *dictionaries* to create a database that contains student names,
information about problem sets that were given to them,
and their grades for each problem.
First, you will work with a simplified version of
the database that is constructed using *lists*.
Next, you will create a more advanced, faster,
and more efficient version of the database that
uses *dictionaries* to store its entries.
Finally,
you will be asked to define some advanced Python *functions* that
compute the weighted average for each student in the database.

The anticipated time to complete this project is approximately four hours.

The second submission for
the second project is Project 15.3:
Project 2 Part 2: Redundant *Dictionaries* in Python.

In Project 15.3,
you will work in Codio to build on your Project 15.2 submission using Python *lists*,
*functions*, and redundant *dictionaries* to enhance your student grades database.
The goal of this project is for you to improve the *functions* to
create the database by using redundant *dictionaries* to define a database that
contains the weighted average for each student in the database.

The anticipated time to complete this project is approximately **2 hours**.

Although the time to complete each project component may vary,
be sure to set aside enough time to
complete each portion of the project for submission.

To review the project details,
please see the full descriptions of each project at the links below:

* [PCDE Project 15.1: Creating a Books Web App][-pcde-project-15-1]
* [PCDE Project 15.2: Creating a Student Grades Database][-pcde-project-15-2]
* [PCDE Project 15.3: Redundant Dictionaries in Python][-pcde-project-15-3]

## Learning Outcomes

1. Define a web *token* architecture.
2. Create an application using web *tokens*.
3. Describe applications of authorization *servers*.
4. Identify key components of relations databases in Python.
5. Create a relational database using Python.
6. Identify key components of relational databases in Python.
7. Implement redundant *dictionaries* in Python.

## Activities

### Key Activities

* **Knowledge Checks**
  * Knowledge Check 15.1: Authorization Servers
  * Knowledge Check 15.2: Relational Databases in Python
  * Knowledge Check 15.3: Redundant Dictionaries in Python
* **Discussion**
  * Discussion 15.1: Applications of Authorization Servers
* **Project Assignments**
  * Project 15.1: Project 1: Creating a Books Web Application
  * Project 15.2: Project 2 Part 1: Creating a Student Grades Database
  * Project 15.3: Project 2 Part 2: Redundant Dictionaries in Python

### Self-Study Activities

* Self-Study Discussion 15.2:
Thinking Like a Data Scientist:
Using Advanced Python Programming to Create Web Applications
* Self-Study Flashcards: Module 15 Flashcards

## Knowledge Check 15.1: Authorization Servers

* Q1: When a user sends a login *request* to an authorization server,
what kind of *token* is sent back to the user by the authorization server?
  * JSON web *token* **(Correct)**
* Q2: Which of the following is shared by
the application server and authorization server?
  * Secret key **(Correct)**
* Q3: What does JWT stand for?
  * JSON web *token* **(Correct)**
* Q4: What kind of request does a user send to the application server during
the authentication and authorization process?
  * `POST` request with username and password **(WRONG)**
  * `GET` request **(WRONG)**
  * `HTTP GET` request with JWT **(Correct)**
* Q5: Where is the JWT inserted within the `HTTP` request for authorization?
  * `Authorization` header **(Correct)**
* Q6: What is the term for the data within the JWT payload?
  * *Claims* **(Correct)**
* Q7: What fields is a serialized web token composed of?
  * Header, payload, and signature **(Correct)**

## Knowledge Check 15.2: Relational Databases in Python

* Q1: Which of the following can be used to represent a relational database in Python?
  * an array of dictionaries **(WRONG)**
  * a dictionary of arrays **(Correct)**
* Q2: Suppose you have created a database using a dictionary of arrays.
The name of the dictionary is `retail`.
There are three arrays within the `retail` dictionary:
`customer_details`, `order_details`, and `product_details`.
How would you add data to the `product_details` array?
  * `retail["product_details"].append("product_name")` **(Correct)**
* Q3: What do you to ensure when creating a relational database in Python?
  * That the entries have the same keys **(WRONG)**
  * That the entries in the tables are defined with
a repeated identifier **(WRONG)**
  * That the entries in the tables are defined with
a unique identifier **(Correct)**
* Q4: Which of the following can be used to represent a database in Python?
  * all the above **(Correct)**
* Q5 Suppose that you want to store student names and
that there are duplicate student names in the data.
Which field can you add to ensure that all the student records are unique?
  * `StudentId` **(Correct)**

## Knowledge Check 15.3: Redundant Dictionaries in Python

* Q1: What is the main benefit of using Python redundant dictionaries?
  * Fast Access **(Correct)**
* Q2: How would you write code to define and
initialize a blank redundant dictionary with column names `column1` & `column2`?

```python
def empty():
    return {"column1": [], "column2": []}
db = empty()
```

* Q3: Can you add keys and values to a redundant dictionary?
  * Yes, you can write a function to append keys & values to a dictionary **(Correct)**
* Q4: How can you add values to a redundant dictionary key?
  * You can use the `append` function **(WRONG)**
  * You can write helper functions to add values to a redundant dictionary **(Correct)**
* Q5: What operations & functions must be defined and called to
define a redundant dictionary?
  * The operations you define and call depends on
the structure of the redundant dictionary **(Correct)**
* Q6: Are separate user-defined functions needed to perform different types of
data manipulation on redundant dictionaries?
  * Yes, you need to define separate functions for
each type of data manipulation **(Correct)**

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [PCDE Project 15.1: Creating a Books Web App][-pcde-project-15-1]
* [PCDE Project 15.2: Creating a Student Grades Database][-pcde-project-15-2]
* [PCDE Project 15.3: Redundant Dictionaries in Python][-pcde-project-15-3]
* [Python][-py]
* [Python: Collections][-py-collections]

<!-- Hidden References -->
[-pcde-project-15-1]: pcde-project-15-1.md "PCDE Project 15.1: Creating a Books Web App"
[-pcde-project-15-2]: pcde-project-15-2.md "PCDE Project 15.2: Creating a Student Grades Database"
[-pcde-project-15-3]: pcde-project-15-3.md "PCDE Project 15.3: Redundant Dictionaries in Python"
[-py]: python.md "Python"
[-py-collections]: python-collections.md "Python Collections"
[-db-relational]: relational-databases.md "Relational Databases"
