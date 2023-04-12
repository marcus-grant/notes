---
created: 2023-04-05T16:08:31.423Z
modified: 2023-04-12T14:08:19.116Z
tags: [pcde,content,module14,java,cdc,debezium,containers,data,database,change,capture]
---
# PCDE Module 14 Content: Java & Debezium

## Discussion 14.1: Compare and Contrast Java and Python

### Prompt

As you continue to learn the differences between
[Java][java-zk] and [Python][py-zk] programming,
it is important to consider the use cases for each.
Java has statically set variable types and a faster runtime because
it is a compiled language.
However, Python can usually be written with fewer lines of code and
is an interpreted language, so there is no need to compile.
Regardless of their differences,
both are among the most commonly used programming languages in the industry.

In this discussion,
you will select **two** projects from the list below and
give **three** reasons why each project should be written in Python, Java, or
some combination of the two.
Consider factors such as scalability, modularity, speed, and
configurability when deciding which technology to use.

#### Project Scenarios

1. Product Pre-Order Website:
Your organization has just released a new product,
and they need to take pre-orders.
This web interface will have to communicate to a back-end project,
relay data to and from a database, accept credit card payments, and
it is expected to have high traffic at the time of the product’s release.
2. Weather Predictor:
You’re working on a pre-existing website that
displays the weather for the next 10 days.
You get data from a centralized API, and you wish to
further enhance the API’s predictions.
The website is already designed,
your team has tasked you with analyzing incoming data and
communicating new predictions with the web interface.
3. Data Collection and Management:
Your team collects specific data from
a competitor’s website and places it in a .csv file.
Your task is to write a program that reads the file,
does any necessary processing, and then places the data in a database.
Your program will be run on an automated schedule and will have no interface.
4. Online Chess:
The task is to make an online chess game where
players can compete against their friends.
You also want to add chess bots with differing levels of difficulty.
The game is also expected to be the best of its kind and very popular,
so scalability is crucial.
5. Tracking COVID-19 Trends:
Your organization has tasked you with writing a program that
will look at employee infection data and attempt to predict when
the next case spike will occur.
This will help manufacturing prepare for the loss in the workforce.
The tool will be used by management and
will use a very large data set since the organization has over 100,000 employees.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

**Suggested Time**: 60 minutes

**Suggested Length**: 300 words

This is a required activity and will count toward course completion.

### My Response

#### Project 1: Product Pre-Order Website

For a website that is going to receive a lot of traffic,
the gut reaction might be to use the faster language ecosystem of Java.
However, because this is only a pre-order website,
that will not have high-traffic for long,
my guess is that it might actually be cheaper to implement using Python.
The reason for this is that developers are more expensive.
Because the period of high traffic is probably going to be short,
you may only need to over-provision servers to accept the traffic for a short time.
That means it might actually be more expensive to
pay for the extra development time to implement the website in Java.
In Python, you just run more servers behind a load balancer and
as the traffic reduces after the initial rush of pre-orders,
you start to reduce the number of active servers and save some development costs.
Very likely, the database system might be the bottleneck, in this case.

#### Project 4: Online Chess

Since the backend for this project is likely going to be relatively simple,
but require of long-term scalability, I'm choosing Java.
The extra development time to
implement the backend in Java is probably going to be worth it.
There isn't much extra complexity to this service,
other than the chess-playing bots which can add a lot of CPU and memory usage.
For that reason it seems worth it to make the backend faster and use less memory at
the cost of more development time.

## Knowledge Check 14.1: Data Types, Classes, Objects, and Packages in Java

* Q1: Which of the programming languages below is more structured?
  * Java **(Correct)**
* Q2: Which command would you use to install a nano editor in your container?
  * `apt install nano` **(Correct)**
* Q3: Which command would you use to update the packages installed in
your container through the command line?
  * `apt-get update` **(Correct)**
* Q4: Which of the following is correct about file names in Java?
  * The file name must match the class name **(Correct)**
* Q5: Which of the following is the basic I/O package in Java?
  * `java.io` **(Correct)**
* Q6: Which command would you use to
compile a Java Program called hello_world.java?
  * `javac hello_world.java` **(Correct)**
* Q7: Which of the following files will be created after
compiling a Java program hello_world.java?
  * hello_world.class **(Correct)**
* Q8: What is the command used to print the string `text` to the console in Java?
  * `System.out.println("text");` **(Correct)**
* Q9: What is an object in Java?
  * An object is an instance of the class variable **(Correct)**
* Q10: What is casting java?
  * Casting is changing the data type of a variable **(Correct)**
* Q11: Which of the following statements is true about packages?
  * Packages allow a programmer to instantiate classes into
objects within other classes **(Correct)**

## Knowledge Check 14.2: Java Applications

* Q1: What is the correct syntax to copy a file from the host to a container?
Assume file named `hello.txt` and the container name `container1`.
  * `docker cp hello.txt container1:/home` **(Correct)**
* Q2: Which of the following is correct about Spring?
  * Spring is an application framework used to create Java applications **(Correct)**
* Q3: What is the use of Spring Boot?
  * Spring Boot makes it easy to create stand-alone Spring Applications **(Correct)**
* Q4: What is change data capture (CDC)?
  * CDC is a process that captures changes made in a database and
replicates those changes to destination(s) **(Correct)**
* Q5: What is the advantage of using periodic queries to capture changes in a database?
  * Periodic queries are safer to use **(WRONG)**
  * Periodic queries have low overhead on well-indexed databases **(Correct)**
* Q6: What is the disadvantage of using transaction log processing for CDC?
  * Hard to implement for every database **(Correct)**
* Q7: Which of the following is required for production-grade CDC?
  * All the above **(Correct)**
* Q8: Which of the following is a CDC package?
  * Debezium **(Correct)**
* Q9: Which Python library is used to perform CDC using a Python program?
  * pymysqlreplication **(Correct)**

## Knowledge Check 14.3: Debezium

* Q1: What is Debezium?
  * Debezium is an open-source distributed platform for CDC **(Correct)**
* Q2: The CDC package for Debezium application is written in which language?
  * Java **(Correct)**
* Q3: How can 2 docker containers running on the same host see each other?
  * By creating a Docker network and adding both containers to it **(Correct)**
* Q4: What is the command used to create a docker network named `netlabel`?
  * `docker network create netlabel` **(Correct)**
* Q5: Which of the can be used to create a Docker image?
  * Dockerfile **(Correct)**
* Q6: How does Debezium interact with different types of databases?
  * Debezium uses a **connector** for each database type **(Correct)**
* Q7: Which of the following databases is compatible with Debezium?
  * All the above **(Correct)**
* Q8: Which of the following is not a connector capability of Debezium?
  * Transforming (?) **(Correct)**

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Change Data Capture][cdc-zk]
* [Java][java-zk]
* [Debezium][debezium-zk]
* [Python][py-zk]
* [Java Spring][java-spring-zk]
* [Docker][docker-zk]
* [Nano Editor][nano-zk]

<!-- Hidden References -->
[cdc-zk]: ./change-data-capture.md "Change Data Capture"
[java-zk]: java.md "Java"
[debezium-zk]: debezium.md "Debezium"
[py-zk]: python.md "Python"
[java-spring-zk]: ./java-spring.md "Java Spring"
[docker-zk]: docker.md "Docker"
[nano-zk]: nano-editor.md "Nano Editor"
