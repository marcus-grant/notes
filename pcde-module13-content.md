---
created: 2023-04-03T06:55:40.897Z
modified: 2023-04-05T09:09:09.567Z
tags: [pcde,cdc,change,data,capture,python,containers,module13,relational,database]
---
# PCDE Module 13: Change Data Capture (CDC)

## Knowledge Check 13.1: Change Data Capture (CDC)

* Q1: What does CDC stand for?
  * Change Data Capture **(Correct)**
* Q2: What are the components of CDC?
  * Change detection, change capture, change propagation **(Correct)**
* Q3: What are some disadvantages of using the database trigger CDC method?
  * All of the above **(Correct)**
* Q4: Which CDC method leverages timestamps?
  * Periodic Queries **(Correct)**
* Q5: What is the major disadvantage of using audit columns as a CDC method?
  * It is easy to make errors that can cause inconsistencies in data **(Correct)**

## Discussion 13.1: The Importance of Change Data Capture (CDC)

### Discussion Prompt

As you learned in Video 13.1, Video 13.2, and Mini-Lesson 13.1,
CDC is a software process that identifies and tracks changes to data in a database.
It has three components: change detection, change capture, and change propagation.

CDC *methods* are used to synchronize any changes in the system of
record (i.e., source of truth) for downstream consuming applications or databases.
Some CDC *methods* include dual writes by application,
network-level sniffing, database triggers, and periodic *queries*.
Each *method* has its advantages and disadvantages.
Periodic SQL *queries* are a popular *method* that
have a low overhead compared to other *methods*.

Please identify and discuss a use case where CDC techniques could be beneficial.
You may build your use case based on the database use cases you identified in Module 12.
When describing your use case,
be sure to include the following elements as they relate to your use case:

* Change detection
* Change capture
* Change propagation
* Audit columns
* Table deltas
* Periodic *queries*

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

**Suggested Time**: 60 minutes

**Suggested Length**: 250-300 words

This is a required activity and will count toward course completion.

### Discussion Write-Up

I've discussed before my interest in
building a combined media/text/url-shortener self-hosted bin system.
Basically you go to a URL, paste in a URL to content, or the content itself,
and it will store the data and produce a short URL that you can share.
Think a combined `bit.ly`, `pastebin.com`, `imgur.com`, etc. for personal use.

CDC could actually be quite useful in this scenario in multiple ways.
The way I'm most interested in is keeping local copies of the data on
whatever device I'm using to access the data.
Effectively caching it,
then synchronizing or capturing the changes to the data and propagating it online.
This is because while I'm on the go, I may not have access to the internet,
and I may want to keep local copies of the data I'm accessing or want to
insert content into the bin.

This would employ a the **Table deltas** CDC method.
A client application with a local SQLite database would be used to store a
local copy of the remote MySQL database, the *system of record*.
A `last_updated` column would be added to both the local and remote databases.
Then *periodic queries* would be used to check for changes in the local data.
When changes are detected,
the local client checks the table in the *source of truth*.
Records where the `last_updated` column is greater than the local copy's than in
the *source of truth* are updated with a series of `UPDATE` and `INSERT` statements.

So long as the period of the *periodic queries* is small enough,
the remote database should be reasonably up to date with the local copy.
And since the data is highly clustered around clients and users,
the odds of a an outdated query reaching the remote database are low.
This quality also improves the reliability of data access because
the local database is available and its `last_updated` column can be used to
create a least recently used cache discard policy for
keeping the files contents themselves stored locally on the client.

## Activity 13.1: Creating and Deleting Containers Using Python

### Activity 13.1 Introduction

In this activity, you will enhance Dr. Sanchez’s container.py program and
add commands to run MongoDB, Redis, and Cassandra databases.
Then, you will add commands to delete them.
Prior to beginning this activity,
be sure to review the submission instructions below to
ensure that you collect the required screenshots as
you progress through the activity.

### To complete this activity - follow these steps

1. Create a folder called `Activity13.1` and open it in VS Code.
Add a file called `container.py`,
and copy and paste the code for running MySQL containers.
Run the code from the command line passing `-create`.
2. Open the Docker desktop and verify that your MySQL container is running.
3. Add the `delete()` function shown to
you in Mini Lesson 13.2 in the `container.py` file to
run the `container.py` file with the `delete()` function with
the `-delete` argument.
Run the code from the command line passing -delete as an argument.
4. Verify on your Docker desktop that the MySQL container has been removed.
5. Modify the code in the file `container.py` to create MongoDB,
Redis, and Cassandra containers by issuing the docker run command for
the different databases if the user passes the `-create` argument in
the Terminal window after the syntax python3 `container.py`.
Verify that your code runs correctly.
6. Verify on your Docker desktop that all the MySQL containers have been created.
7. Modify the commands in your Terminal window to delete the MongoDB, Redis, and
Cassandra containers when `-delete` is passed as a parameter after
python3 `container.py`.
Verify that your code runs correctly.
8. Verify on your Docker desktop that
all the database containers have been deleted.

### Submission Instructions

Your submission for this assignment should be a Word document that
includes the following screenshots,
each labeled for the step that the screenshot represents:

1. Provide a screenshot of the `container.py` file in VS Code.
2. Provide a screenshot that shows you have run the `container.py` file from
the Terminal window and passed the `-create` argument as a parameter.
3. Provide a screenshot of your Docker desktop that shows MySQL running.
4. Provide a screenshot of the command prompt output when you run the code to
delete the MySQL container and run the `containers.py` Python program from
the Terminal window by passing `-delete` as a parameter.
5. Provide a screenshot of your Docker desktop to
show that the MySQL container has been deleted.
6. Provide a screenshot to show that you have included the code to
create the other database containers in MongoDB, Redis, and Cassandra.
7. Provide a screenshot of the command prompt output to
show that you have run the `containers.py` Python program from
the Terminal window passing `-create` as a parameter.
8. Provide a screenshot of your Docker desktop showing that the four database containers are running.
9. Provide a screenshot of VS Code after including the code to
delete the three database containers for MongoDB, Redis, and Cassandra to
show that you added the calls to delete these three databases.
10. Provide a screenshot of the command prompt output to
show that you have successfully run the `containers.py` Python program from
the Terminal window passing -delete as a parameter.
11. Provide a screenshot of your Docker desktop showing that
all the database containers have been deleted.

### Additional Details

**Estimated Time**: 60 minutes

This is a required activity and counts toward course completion.

## Knowledge Check 13.2: Containers in Python

* Q1: Which Python library is required to run shell commands through Python?
  * `os` **(Correct)**
* Q2: How do you write and execute a shell command to list files in Python?
  * `cmd = f'ls -l' \nos.system(cmd) \nprint(result)` **(Correct)**
* Q3: Can you create a docker container using Python?
  * Yes **(Correct)**
* Q4: What syntax would you use to write the shell command to stop a container in Python?
Assume that the name of the container you want to stop is `container_nm`.
  * `cmd = f'docker stop {container_nm}'` **(Correct)**
* Q5: Suppose you want to create 3 containers each of them running one of the following:
MongoDB, Cassandra, MySQL. Can this be achieved in Python?
  * Yes **(Correct)**
* Q6: What is the advantage of managing and creating containers using Python?
  * To speed up container management and avoid errors **(Correct)**

## Knowledge Check 13.3: Initializing Databases and Time Loops

* Q1: Which of the following databases do not need to be initialized?
  * MongoDB **(Correct)**
* Q2: What is a time loop?
  * When a function calls itself in a loop in a specified time interval **(Correct)**
* Q3: Which libraries are required to create a time loop in Python?
  * `time` and `threading` **(Correct)**
* Q4: What is the syntax to cancel a timer in Python?
  * `timer.cancel()` **(Correct)**


## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Change Data Capture][cdc-zk]
* [Python][py-zk]
* [Python Interaction with OS Shell][py-shell-zk]

<!-- Hidden References -->
[cdc-zk]: ./change-data-capture.md "Change Data Capture"
[py-zk]: ./python.md "Python"
[py-shell-zk]: ./python-os-shell.md "Python Interaction with OS Shell"
