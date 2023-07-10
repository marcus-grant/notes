---
created: 2023-06-26T13:29:12.766Z
modified: 2023-07-10T16:01:15.093Z
tags: [apache,python,workflow,pipeline,automation,data,schedule,pcde,module23]
---
# Airflow (Apache Python Platform for Automation Workflows)

>**Apache Airflow** is an open-source workflow management platform for
>data engineering pipelines.
>It started at Airbnb in October 2014 as a solution to
>manage the company's increasingly complex workflows.
>Creating Airflow allowed Airbnb to programmatically author and
>schedule their workflows and monitor them via
>the built-in Airflow [user interface][-gui].
>From the beginning, the project was made open source,
>becoming an Apache Incubator project in March 2016 and
>a top-level Apache Software Foundation project in January 2019.
>Airflow is written in [Python][-py], and workflows are created via Python scripts.
>Airflow is designed under the principle of *"configuration as code"*.
>While other *"configuration as code"* workflow platforms exist using
>markup languages like [XML][-xml],
>using Python allows developers to import libraries and
>classes to help them create their workflows.
>
>--[(Wikipedia 2023)][wiki-airflow]

***TODO:*** Include the module notes in module 22.

>***TODO***: There should be a data engineering topics index.
>The PCDE course outline is a good place to pull from.
>Create one with some conceptual outlines and
>new documents with core concepts and
>include a lot of the links relevant from the PCDE outline therein.
>Note that this document mentions it and should be linked as such.

## Basics

### Workflows as Code

The main characteristic of Airflow workflows is that all
workflows are defined in Python code.
*"Workflows as code"* serves several purposes:

* **Dynamic**: Airflow pipelines are configured as python code,
  allowing for dynamic pipeline generation.
* **Extensible**: The Airflow framework contains operators to connect with
  numerous technologies.
  All Airflow components are extensible to easily adjust to your environment.
* **Flexible**: Workflow parameterization is built-in leveraging the
  [Jinja templating engine][-jinja].

### Directed Acyclic Graphs (DAG)

To demonstrate a **DAG** let's examine the below code.

```python
from datetime import datetime

from airflow import DAG
from airflow.decorators import task
from airflow.operators.bash import BashOperator

# A DAG represents a workflow, a collection of tasks
with DAG(dag_id="demo", start_date=datetime(2022, 1, 1), schedule="0 0 * * *") as dag:

    # Tasks are represented as operators
    hello = BashOperator(task_id="hello", bash_command="echo hello")

    @task()
    def airflow():
        print("airflow")

    # Set dependencies between tasks
    hello >> airflow()
```

* A **DAG** named `demo`,
  starting on 2022-01-01 and running once day.
* A **DAG** is airflow's representation of a workflow.
* Two tasks, a `BashOperator` running a Bash script and
  a Python function defined using the `@task` decorator.
* `>>` between the tasks defines dependency and controls in which
  order the tasks will be executed.

## References

### Web Links

* [Wikipedia.org. "Apache Airflow". Accessed 2023-06-26][wiki-airflow]

<!-- Hidden References -->
[wiki-airflow]: https://en.wikipedia.org/wiki/Apache_Airflow "Wikipedia.org. Apache Airflow"

### Note Links

* [Graphical User Interface (GUI)][-gui]
* [Python][-py]
* [eXtensible Markup Language (XML)][-xml]
* [Jinja Templating Engine][-jinja]

<!-- Hidden References -->
[-gui]: gui.md "Graphical User Interface (GUI)"
[-py]: python.md "Python"
[-xml]: xml.md "eXtensible Markup Language (XML)"
[-jinja]: jinja.md "Jinja Templating Engine"
