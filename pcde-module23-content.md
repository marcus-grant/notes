---
created: 2023-06-21T16:32:04.292Z
modified: 2023-06-26T15:24:02.494Z
tags: [pcde,data,javascript,pipeline,visual,graphic]
---
# PCDE Course Module 23 Content

## Introduction

In this module,
you will be working on another project that you can add to your portfolio.
In the first section, you will be introduced to Project 23.1,
in which you will create a sense-making data pipeline.
In the next section, you will learn about visualization, unstructured data,
and JavaScript.
First, you will learn how unstructured data differs from structured data.
Next, you will learn how JavaScript can be used for web development and
will research specific use cases for JavaScript.
You will also learn how the document object model (DOM) and
HTML tags can be used to enhance web pages.
Finally,
you will practice visualization using the Data-Driven Documents (D3) library to
visualize word frequency data.
In Project 23.1,
you will perform data analysis on unstructured MIT course catalog data and
use the D3 library to create a visualization of word frequency data.

Note: Make sure you have installed the tools you will need for Modules 23-24 in
the Course Tools Module before beginning this module.

## Lecture 23.2: Sense-making Using Course Catalog Data

***TODO:*** consider turning the sense-making pipeline into a document

Sense-making is something that we're always doing.
We're always trying to make sense of the world.
And in this project we're going to be doing precisely that with data.
And we'll be looking at data from MIT's course catalog.
During that process we'll try to *sense-make* from the data within
the online course catalog,
we're going to learn this process to
create a [sense-making data pipeline][-sense-pipe].

MIT's course catalog exists on this address
[https://student.mit.edu/catalog/index.cgi][mit-catalog].
To explore the data, a good start might be to use [cURL][-curl].

```sh
curl http://student.mit.edu/catalog/index.cgi
```

Then we get some HTML back that acts as an index to the catalog.
We should be able to collect those and crawl deeper into the site map.
For that though we should probably use [Python][-py] or another scripting language.
Specifically, we're going to use [Python's Standard Library URL-Lib][-py-url].
Then we'll parse the response which is an [HTML document][-html].
Then we'll extract the necessary data.
Then we'll create a sense-making data pipeline.
Finally, visualize the data using word frequency representations.

## References

### Web Links

* [MIT Course Catalog Index][mit-catalog]

<!-- Hidden References -->
[mit-catalog]: https://student.mit.edu/catalog/index.cgi "MIT Course Catalog Index"

### Note Links

* [PCDE Course Project 23.1][-pcde-proj-23-1]
* [cURL (C HTTP Client)][-curl]
* [Sense-Making Pipelines][-sense-pipe]
* [Python][-py]
* [URL-Lib (Python StdLib)][-py-url]
* [HyperText Markup Language (HTML)][-html]
* [Exploratory Data Analysis (EDA, Data Science)][-eda]

<!-- Hidden References -->
[-pcde-proj-23-1]: pcde-project-23-1.md "PCDE Course Project 23.1"
[-curl]: curl.md "cURL (C HTTP Client)"
[-sense-pipe]: sense-making-pipeline.md "Sense-Making Pipelines"
[-py]: python.md "Python"
[-py-url]: python-urllib.md "URL-Lib (Python StdLib)"
[-html]: html.md "HyperText Markup Language (HTML)"
[-eda]: ./exploratory-data-analysis.md "Exploratory Data Analysis (EDA, Data Science)"
