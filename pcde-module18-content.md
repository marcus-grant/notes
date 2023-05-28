---
created: 2023-05-10T19:13:34.917Z
modified: 2023-05-16T14:49:48.465Z
tags: [pcde,module18,big,data,hadoop,docker,java,database,warehouse]
---
# PCDE Course Module 18 Content

## Introduction

In this module,
you will learn about the importance of big data and the components that
must be considered when working with big data.
You will be introduced to Hadoop,
an open-source software platform for
distributed storage and distributed processing for big data.
You will learn about the architecture of Hadoop,
including the MapReduce framework and
the **Hadoop Distributed File System** (**HDFS**).
Next, you will learn how to create Hadoop Docker images and how to
set up Hadoop in a Docker container.
Then, you will learn how to use Hadoop to handle big data.
You will use Hadoop to create and execute a word count program and
then inspect the resulting output data.
In the final assignment,
you will write a Java program to access the Hadoop database.

To follow along with the videos in this module,
feel free to download the [Module 18 Slide Deck][pcde-mod18-slides].
This additional resource contains all the slides used by
Dr. Sanchez in this module’s videos.

>**Note**: If you can't reach the slide deck,
>the course archive should have it under the module 18 `extras` folder.

## Discussion 18.1: The Importance of Big Data

### Discussion 18.1 Prompt

You’ve learned how complex big data can become.
At scale, **the five V’s of big data** don’t allow for
traditional software to be useful in processing.
In many cases, handling big data requires the addition of
whole technology teams for data collection, data storage, data processing,
and database management.
Requirements for modern hardware must be met as well.
This all adds up to a substantial business cost for technology,
even when there is sometimes unclear direction for
how the big data will be utilized.

With today’s emerging technologies,
many large organizations will collect just about
any data they can legally obtain.
These organizations will collect, process,
and store the big data in data warehouses until
they can decide on a business use later on.
There are many factors to consider when
deciding how important the data collection is in the first place.
In this discussion, you will examine a few of these deciding factors.

In your discussion post,
choose a large technology organization that interests you.
Provide detailed responses to the following questions:

* What is the organization?
How long has it existed?
Do you see any major change coming for the future of this organization?
* What big data do you suspect the organization will collect
(or is currently collecting)?
* Does the collected data align with the five V’s of big data?
Provide a justification for how your data represents each of the five V’s:
  * value
  * variety
  * velocity
  * veracity
  * volume
* How much data do you expect is coming in from...?
  * all users daily
  * monthly
  * and annually
  * How long should the organization you selected keep the data, and why?
* How can the organization utilize the data to its advantage?
* Is it practical to collect and store this data? Why or why not?

Read the statements posted by your peers.
Engage with them by responding with
thoughtful comments and questions to deepen the discussion.

**Suggested Time:** 60 minutes

**Suggested Length:** 250-300 words

### My Response to Discussion 18.1 Prompt

I chose to examine Google's data collection practices.
Going from a search engine to a computing services conglomerate,
their data flows have grown substantially,
possibly more than any other organization in the world.

## Knowledge Check 18.1: Big Data and the Architecture of Hadoop

* Q1: Which of the following are the three main characteristics of big data?
  * Variety, value, and veracity **(WRONG)**
  * Variety, veracity, and volume **(WRONG)**
  * Velocity, variety, and volume **(Correct)**
* Q2: What does HDFS stand for?
  * Hadoop Distributed File System **(Correct)**
* Q3: What are the stages of a MapReduce process when working with big data?
  * input, split map, sort, reduce **(Correct)**
* Q4: What does YARN stand for?
  * Yet Another Resource Negotiator **(Correct)**
* Q5: What is the most accurate definition of Hadoop?
  * Hadoop is an open-source platform for distributed data storage and
processing of large datasets. **(Correct)**
* Q6: What does MapReduce do?
  * Split large amounts of data into smaller chunks for
efficient data manipulation. **(Correct)**
* Q7: Which steps take place between the `Map` and `Reduce` tasks?
  * Combine and Partition **(Correct)**
* Q8: What is the function of the Reduce task in MapReduce?
  * Takes the output from the Map as an input,
then shuffles and sorts the data into a smaller set of tuples **(Correct)**
* Q9: Which of the following is false about the Combine function in
the MapReduce framework?
  * Whether the combine function is performed depends on the complexity of
the data. **(WRONG)**
  * Combine is an optional step in the MapReduce framework. **(WRONG)**
  * The combine function must always be performed. **(Correct)**

## References

### Web Links

* [PCDE Module 18 Lecture Slide Deck][pcde-mod18-slides]

<!-- Hidden References -->
[pcde-mod18-slides]: https://classroom.emeritus.org/courses/1412/files/847772/download "PCDE Module 18 Lecture Slide Deck"

### Note Links

* [Big Data][-big-data]
* [Hadoop][-hadoop]

<!-- Hidden References -->
[-big-data]: big-data.md "Big Data"
[-hadoop]: hadoop.md "Hadoop"
