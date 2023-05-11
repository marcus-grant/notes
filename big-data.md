---
created: 2023-05-11T09:26:58.556Z
modified: 2023-05-11T19:37:26.178Z
tags: [data,big,warehouse,database,system,architecture,operation,pcde,module18]
---
# Big Data

## Introduction

While it's most common to perform ETL and other data processes on
relatively small datasets.
Data science and engineering are increasingly being applied to
giant data warehouses in place of relatively simple [databases][-db].
This means new approaches to data management and operations are needed.

This change is a direct result of more powerful computer systems and
software platforms that use large amounts of data to
train [machine learning (**ML**)][-ml] models.
As ML becomes more powerful and widespread,
the data used to train the models must adapt as well.
Data is the backbone to a successful predictive modeling tool,
and the cleaner and more organized the incoming dataset is,
the more accurate the ML [algorithm][-algo] will be.
If you are unfamiliar with ML techniques, don’t worry,
you will learn more about this topic in future lessons.
This section will focus on the information needed to write an ML algorithm.

## Definition of Big Data

Big Data comes in many forms.
Facebook, for example, keeps a log of every click that users make on their apps.
Tesla uploads the coordinates and velocity of their entire fleet to their servers.
These implementations, at scale,
account for terabytes of data being transmitted and processed every day.
Such massive data *flows* cannot be handled with
traditional data processing software,
so new tools are designed for the task.
These new tools have **the five V's** of big data in mind.

### The Five V's of Big Data

#### Value

Big data is practically useless until its value is discovered.
Many organizations collect vast data without clear plans for its use and
much of it stays in data systems till a **valuable** use is discovered.
New technologies have made it inexpensive to store all this extra data.
Thus this is what is done almost unanimously industry-wide.

#### Variety

Data must be accepted in many forms.
Variety means large amounts of data can arrive in variably structured forms,
as structured as relational database entities or as unstructured as media files.
Video feeds are a semi-structured type of data that must be processed and
broken down into machine-understandable form.
This is so it can make sense of data like images, video or audio.
This adds a layer of considerable complexity to data systems.

#### Veracity

Data must be accurate and truthful.
When collecting big data veracity in these forms must be considered.
It must ensure it's representative of all aspects of its use case.
It must be unbiased.
It must be able to be processed to be consistent with how the data is used.

#### Volume

Big data arrives in massive volumes easily using terabytes of
structured and unstructured data.
This can include: click streams from apps, sensor data, video/audio streams, etc.
[(Oracle 2021)][oracle21]
  
## Big Data Applications

There's a number of use cases for big data in various industries.
Some major ways that big data can shape customer experiences and
business analytics include the following scenarios:

### Product Development

Social media organizations develop products that
need to interpret data and predict what users are going to want to see next.
For example,
Youtube develops entire algorithms to predict what users want to
watch as their video ends. [(Ghorui 2019)][ghorui19]
To ensure accurate suggestions,
the predictive algorithms must take many factors into consideration,
such as previously watched videos,
what a user tends to click on next,
or even why some users choose to close the application after a video ends.

### Predictive Maintenance

Being able to predict when
a product will have systemic failures is vital in today's economy.
Predicting failure is important especially with more complex systems,
such as those required by modern vehicles.
Predictive algorithms can predict the average hold time a customer will
have to wait on a call,
which can lead to better staffing in
customer service centers [(Ghorui 2019)][ghorui19].

### Operational Efficiency

Amazon uses big data in order to understand customer shopping trends.
Big data enables Amazon to ship a package within a day because
they have analytical tools that can predict what people are going to need.
Often they'll have predicted this order before the customers realize it themselves.

### Medical Innovation

Having access to a large patient dataset allows universities and institutions to
examine causes of illness to a degree that was not previously possible.
Simply storing and analyzing millions of
common patient temperature readings allows for
insights and critical medical breakthroughs.

## References

### Web Links

* [Ghorui, Krishnendu. “What Is Big Data?” GeeksForGeeks. 2019. https://www.geeksforgeeks.org/what-is-big-data/.][ghorui19]
* [Oracle Cloud Infrastructure. “What Is Big Data?” Big-Data. 2021. https://www.oracle.com/big-data/what-is-big-data/.][oracle21]

<!-- Hidden References -->
[ghorui19]: https://www.geeksforgeeks.org/what-is-big-data/ "What Is Big Data?"
[oracle21]: https://www.oracle.com/big-data/what-is-big-data/ "What Is Big Data?"

### Note Links

* [Database][-db]
* [Machine Learning][-ml]
* [Algorithm][-algo]

<!-- Hidden References -->
[-db]: database.md "Database"
[-ml]: machine-learning.md "Machine Learning"
[-algo]: algorithm.md "Algorithm"
