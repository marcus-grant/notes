---
created: 2023-06-21T16:35:08.034Z
modified: 2023-06-26T15:21:19.692Z
tags: [pcde,python,javascript,data,project,d3,graphic,visual,pipeline]
---
# PCDE Project 23.1: Creating a Sense-Making Data Pipeline

## Introduction

In this project, you will use the [Python][-py] [urllib library][-py-url] to
pull data from MIT’s course catalog.
The data being pulled from the web will be unstructured,
so you will have to clean it first to extract the course names.
Once the course names are extracted and the data is structured,
you will perform some [data analysis][-eda] to
learn how many times each word occurs throughout all of the course names.
This analysis will be saved as a [JSON file][-json],
which will then be referenced by your [D3][-d3] web application.
Lastly, the web application will generate a visual analysis of
the JSON data that you just collected.

To streamline the data analysis process,
you will use software tools that you have learned about in previous modules,
such as [Docker][-docker] and [Airflow][-py-airflow].
You will be responsible for instantiating an Airflow web server within
a Docker container to handle each Python task that you define.
These tasks will divide the project into smaller, more manageable pieces.
In the end,
you will experiment with different D3 libraries to customize your project.

As you write the code for this project,
it is strongly recommended that you run each method independently as
it is created so that you can verify that each task works as expected.

This project is worth a total of 100 points.

## Instructions

### Part 1: Code Development

#### Step 1

Create a folder titled `project-23`.
Place the [code visualization][pcde-23-1-vis-code-dl] folder within
the `project-23` folder, and create another empty folder titled `airflow-docker`.
Then, create a new `assignment.py` file,
which will contain your coding throughout the project.
Provide a screenshot of the `project-23` folder with
the code `visualization folder`, `airflow-docker` folder,
and `assignment.py` file within it.

## Submission

### Submission: Part 1: Code Development

1. Provide a screenshot of the `project-23` folder with
    the `code-visualization` folder, `airflow-docker` folder,
    and `assignment.py` file within it.

## References

### Web Links

* [PCDE Course Project 23-1 Visualization Code Download][pcde-23-1-vis-code-dl]
<!-- TODO: Once the pastebin service is up and running,
place this code (which will be in the PCDE archive) into it
and change the link to the bin -->
<!-- Hidden References -->
[pcde-23-1-vis-code-dl]: https://classroom.emeritus.org/courses/1412/files/1004584/download "PCDE Course Project 23-1 Visualization Code Download"

### Note Links

* [Python][-py]
* [URLLib (Python Std.Lib.)][-py-url]
* [Exploratory Data Analysis (EDA)][-eda]
* [JavaScript Object Notation (JSON)][-json]
* [Javascript][-js]
* [Data Driven Documents (D3, a Javascript Library)][-d3]

<!-- Hidden References -->
[-py]: python.md "Python"
[-py-url]: python-urllib.md "Python urllib Library"
[-eda]: exploratory-data-analysis.md "Exploratory Data Analysis (EDA)"
[-json]: json.md "JavaScript Object Notation (JSON)"
<!-- [-curl]: curl.md "cURL" -->
[-js]: javascript.md "Javascript"
[-d3]: d3.md "Data Driven Documents (D3, a Javascript Library)"
[-docker]: docker.md "Docker"
[-py-airflow]: python-airflow.md "Python Airflow"
