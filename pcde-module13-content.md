---
created: 2023-04-03T06:55:40.897Z
modified: 2023-04-03T13:15:45.319Z
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
