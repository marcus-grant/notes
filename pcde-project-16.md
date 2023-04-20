---
created: 2023-04-20T13:26:25.000Z
modified: 2023-04-20T15:26:05.165Z
tags: [pcde,module16,project,transit,api,web,flask,mysql,mongodb,cdc,data,database,container]
---
# PCDE Project 16: Build a Transit Data Application

## Introduction

In Video 16.1,
Dr. Sanchez demonstrated how to create a prototype of a web application that
uses Mapbox to display the positions of buses along Route 1 for the MBTA.
The longitude and latitude for the buses are hardcoded for the prototype and
are incremented periodically to simulate movement.

Before working through the steps of this project,
be sure to review the Submission Instructions and Project 16.1 Rubric to
ensure that you collect all required screenshots as you work through the project.

For this project, you will add the following enhancements to the prototype:

1. You will create a MySQL database in a Docker container to
store data returned by the MBTA API.
2. You will make calls to the MBTA API for Route 1 periodically (every 10 seconds).
You will parse the JSON results returned and will store the data in
a MySQL database for further analysis.
3. You will perform change data capture (CDC) on the MySQL database.
Your application will monitor the MySQL database for
changes and propagate any changes to a MongoDB database.
4. Let the server run for a period of 12 hours,
storing data in the MySQL database.
Use the [Project 16.1 Jupyter Notebook template][pcde-project16-jupyter] to
load and analyze the data stored in the database.
Make sure you answer the following questions in your Jupyter Notebook submission:
    * What is the average time it takes for a bus to complete Route 1?
    * Include a plot-type visualization based on the data.
The type of plot you choose to include is up to you.
    * Give an estimate of the speed of the bus from `current_stop_sequence=1` to
the last `current_stop_sequence`.
**Note**: You can use the [haversine][pypi-haversine]
Python library to calculate the distance between
two points given two longitude and latitude coordinates.

There will be two submissions for this project:
The first submission is a Word document that includes the screenshots listed in
the Submission instructions, each labeled for the step that the screenshot represents.
The second submission is a Jupyter Notebook, using the provided template,
to answer the three questions listed above.

This project is worth a total of 100 points.
The screenshots in the Word document submission are worth a total of
50 points with the point distribution that is delineated in the Project 16.1 Rubric.
The Jupyter Notebook is worth a total of 50 points with
the point distribution that is delineated in
the [Project 16.1 Jupyter Notebook template][pcde-project16-jupyter] and
in the Project 16.1 Rubric.

## Instructions

Your project should utilize [Docker containers][-docker] running on
the same Docker network.
Your project should contain the following components:

### Step 1

Create a Docker network called `MBTANetwork`.
Associate all Docker containers to this network.
Provide a screenshot to show that
you have successfully created the `MBTANetwork` network.

### Step 2

[MySQL][-mysql], the source of truth for this application:

Unzip and open the [mysql-docker][pcde-project16-mysql-docker-zip] folder.
Provide a screenshot to show that
you have successfully opened the `mysqlDocker` folder.

#### Step 2a

Using [VS Code][-vscode], open the `MBTA.sql` file.
Provide a screenshot to show that you have successfully opened the `MBTA.sql` file.

#### Step 2b

In a jupyter Notebook, run the following code:

```python
mbtaURL = "https://api-v3.mbta.com/vehicles?filter[route]=1&include=trip"

import urllib.request, json
with urllib.request.urlopen(mbtaURL) as url:
    data = json.loads(url.read().decode())
   
    with open('data.json', 'w') as outfile:
        json.dump(data, outfile)
   
    with open('data.txt', 'w') as outfile:
        json.dump(json.dumps(data, indent=4, sort_keys=True), outfile)
       
    print(json.dumps(data, indent=4, sort_keys=True))
```

Provide a screenshot to show that you have successfully run the code above
in a Jupyter Notebook.

This code will allow you to analyze calls to the MBTA API.
Decide which additional fields returned by the service should be included in your table.
Remember, you should not only think about the immediate needs of
your solution *(i.e., ID, latitude, longitude, etc.)*,
but also about the future needs of your application.
Add these additional fields to the `mbta_buses` table inside the `MBTA.sql` file.
Provide a screenshot to show that
you have successfully added at least five additional fields to the `mbta_buses` table.

If you want,
you can also use the same Jupyter Notebook to practice parsing through
the [JSON][-json] results and getting to the fields you will need to
insert data into the [database][-db].

Here are some additional links for you to familiarize yourself with
the MBTA API:

* [About the V3 MBTA API][mbta-api-ref-about]
* [MBTA Swagger][mbta-swagger]

#### Step 2c

After modifying the `MBTA.sql` file and adding the additional fields you have selected,
navigate from a shell prompt to the folder where the Dockerfile is stored and
run the Docker command to create a Docker image called `mysqlmbtamasterimg`.
Provide a screenshot to show that
you have successfully created the `mysqlmbtamasterimg` image.

#### Step 2d

Create a Docker container associated with the
`MBTANetwork` network that you created in Step 1.
Name the Docker container `mysqlserver`.
Provide a screenshot to show that
you have successfully created the `mysqlserver` container.

### Step 3

[MongoDB][-mongodb] Docker container:

Create a MongoDB Docker container to be used for [CDC][-cdc].
Be sure that the MongoDB container is part of the same network (`MBTANetwork`) as
the other containers in the project.
Name the container `some-mongo`.
Provide a screenshot to show that
you have successfully created the `some-mongo` container.

### Step 4

[Flask web server][-flask].
>**Note**: This will be running locally on your machine.

#### Step 4a

Unzip the [Module16ProjectFlask.zip][project16-flask-zip] folder on
your local machine and open it using VS Code.
Provide a screenshot to show that
you have successfully opened the `Module16ProjectFlask.zip` folder in VS Code.

#### Step 4b

Modify the code in the `mysqldb.py` file to add all the columns that
you added to the `mbta_buses` [SQL][-sql] [table][-rel-db] following
the template provided in the `mysqldb.py` file.
Provide a screenshot to
show that you have successfully modified the `mysqldb.py` file.

#### Step 4c

Modify the code in the `MBTAApiClient.py` file to add all the columns that
you defined in the `mbta_buses` SQL table following the template provided in
the `MBTAApiClient.py` file.

#### Step 4d

Modify the code in the `index.html` file inside
the `Module16ProjectFlask.zip` folder and
add your [Mapbox][-mapbox] access token.
Provide a screenshot to show that
you have successfully added your Mapbox access token in the `index.html` file.

#### Step 4e

Modify the code in the `server.py` file to initialize the buses list by
doing an API call to the MBTA database.
For this part, use the `callMBTAApi()` function from the `MBTAApiClient` library.
Provide a screenshot to show that
you have successfully initialized the buses list in the `server.py` file.

#### Step 4f

From VS Code, run the `server.py` file.
Provide a screenshot to show that you have successfully run the `server.py` file.

#### Step 4g

Open a browser and navigate to `http://localhost:3000/`.
Provide a screenshot to show that
you have successfully navigated to `http://localhost:3000/`.

### Step 5

[Debezium CDC][-debezium] monitor container:

#### Step 5a

Unzip the [DebeziumCDC.zip][project16-debezium-zip] folder on
your local machine and open it using VS Code.
Provide a screenshot to show that
you have successfully opened the `DebeziumCDC.zip` folder in VS Code.

#### Step 5b

From the `DebeziumCDC.zip` folder,
create a Docker image called `debeziummodule16`.
Provide a screenshot to show that
you have successfully created the `debeziummodule16` Docker image.

#### Step 5c

Create the Docker container for Debezium and make sure you associate it with
the `MBTANetwork` network.
Provide a screenshot to show that
you have successfully created the Docker container and
associated it with the `MBTANetwork` network.

#### Step 5d

Once the Debezium container is running,
open a shell (from `<CLI>` in the Debezium Docker container) and
go through the steps of installing the [`nano` text editor][-nano].
Provide a screenshot to show that
you have successfully installed the `nano` text editor in your shell.

#### Step 5e

From the Debian shell, navigate to the following file:
`/tmp/src/main/java/mit/edu/tv/listener/MongoDB.java`.
Use the `nano` text editor to edit the Java class to
modify the `insertRecord` method in the `MongoDB.java` class to write data to
the MongoDB database:

```java
MongoClient mongoClient = MongoClients.create(connectionString);
MongoDatabase database = mongoClient.getDatabase("myDatabase");
Document document = new Document();
document.append("recordId", "CDC");
document.append("value", record);
database.getCollection("myCollection").insertOne(document);
```

>**Note**: The code provided requires that
>your MongoDB container is titled `some-mongo`.
>If you decide to use another name, be sure to modify the code accordingly.

Provide a screenshot to show that
you have successfully modified the `MongoDB.java` class.

#### Step 5f

From the Debezium shell, navigate to the following file:
`/tmp/src/main/java/mit/edu/tv/listener/DebeziumListener.java`.

Inside the `handleChangeEvent` method,
use the `insertRecord` method of the MongoDB class to
insert a record inside the MongoDB database.
Pass the following argument to the `insertRecord` method:

```java
sourceRecord.value().toString()
```

Provide a screenshot to show that
you have successfully modified the `handleChangeEvent` method.

#### Step 5g

From the Debezium shell prompt,
run the [Maven SpringBoot][-spring] application using the following command:

```sh
mvn spring-boot:run
```

Provide a screenshot to show that
you have successfully run the Maven SpringBoot application.

### Step 6

Verify the MongoDB database is being populated:

#### Step 6a

Following the steps in [Mini-Lesson 16.4][pcde-ml16-4],
create a container called `javamaven` to query the MongoDB database.
Follow the steps to download the Java MongoDB classes and
copy the files to the container.
Provide a screenshot of
your Docker Desktop to show the `javamaven` container running.

#### Step 6b

After you have installed the `nano` text editor,
navigate to the following folder from the `javamaven` container `bash` prompt:

```bash
/java-quick-start/src/main/java/com/mongodb/quickstart
```

List the files in the directory.

Provide a screenshot to show that you have successfully navigated to
the directory and listed the files.

#### Step 6c

Using the `nano` text editor,
create a file called `ReadCDC.java` in
the current directory (`/java-quick-start/src/main/java/com/mongodb/quickstart`)
and copy the following code into the file:

```java
package com.mongodb.quickstart;

import com.mongodb.client.*;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Projections.*;
import static com.mongodb.client.model.Sorts.descending;

public class ReadCDC {
    public static void main(String[] args) {
        try (
            MongoClient mongoClient =
                MongoClients.create(System.getProperty("mongodb.uri"))
        ) {
              MongoDatabase sampleTrainingDB = mongoClient.getDatabase("myDatabase");
              MongoCollection<Document> myCDCCollection =
                  sampleTrainingDB.getCollection("myCollection");

              Document cdcDocument =
                  myCDCCollection.find(new Document("recordId", "CDC")).first();
              System.out.println("CDC Record: " + cdcDocument.toJson());
        }
    }
}
```

Provide a screenshot to show that
you have successfully created the `ReadCDC.java` file and copied the code.

#### Step 6d

From the [`bash`][-bash] command prompt,
make sure you are in the `/java-quick-start/` folder and
run the following command to execute the `ReadCDC.java` class:

```bash
mvn compile exec:java \
-Dexec.mainClass="com.mongodb.quickstart.ReadCDC" \
-Dmongodb.uri="mongodb://some-mongo:27017"
```

Provide a screenshot to show that the results of
the `bash` command to execute the `ReadCDC.java` class.

This is the final step of creating screenshots for your Word document submission file.
In the last step of this project,
you will work on creating the second submission,
which utilizes the Jupyter Notebook template provided below.

### Step 7

Be sure to leave the `server.py` file running for a period of 12 hours.
Use the [Project 16.1 Jupyter Notebook Template][pcde-project16-jupyter] to
load and analyze the data stored in the database.
Make sure you answer the following questions in your Jupyter Notebook submission:

* What is the average time it takes for a bus to complete Route 1?
* Include a plot-type visualization based on the data.
The type of plot you choose to include is up to you.
* Give an estimate of the speed of the bus from
`current_stop_sequence = 1` to the last `current_stop_sequence`.

>**Note**: You may have to stop the process that is performing CDC for
>the 12-hour period and only run the server that
>calls the MBTA API and stores the data in the MySQL database because
>the CDC process is memory-intensive, and your machine could run out of memory.

## Submission Instructions

There will be two submissions for this project.
The first submission is a Word document that includes the screenshots listed below,
each labeled for the step that the screenshot represents.
The second submission is a Jupyter Notebook, using the provided template,
to answer the final three questions in the submission instructions.
You can also check the Project 16.1 Rubric below for specific grading details.

Your first submission for this project should be a Word document that
includes the following screenshots,
each labeled for the step that the screenshot represents:

### Step 1

Provide a screenshot to
show that you have successfully created the `MBTANetwork` network.

### Step 2

Provide a screenshot to show that you have successfully opened the mysqlDocker folder.

#### Step 2a

Provide a screenshot to show that you have successfully opened the `MBTA.sql` file.

#### Step 2b

For this step, you will provide two screenshots.
The first screenshot should show that
you have successfully run the provided code in a Jupyter Notebook.
The second screenshot should show that
you have successfully added at least
five additional fields to the `mbta_buses` table.

#### Step 2c

Provide a screenshot to show that
you have successfully created the `mysqlmbtamasterimg` Docker image.

#### Step 2d

Provide a screenshot to
show that you have successfully created the `mysqlserver` Docker container.

### Step 3

Provide a screenshot to
show that you have successfully created the `some-mongo` Docker container.

### Step 4

#### Step 4a

Provide a screenshot to show that
you have successfully opened the `Module16ProjectFlask.zip` folder in VS Code.

#### Step 4b

Provide a screenshot to show that
you have successfully modified the `mysqldb.py` file.

#### Step 4c

Provide a screenshot to show that
you have successfully modified the `MBTAApiClient.py` file.

#### Step 4d

Provide a screenshot to show that
you have successfully added your Mapbox access token in the `index.html` file.

#### Step 4e

Provide a screenshot to show that
you have successfully initialized the buses list in the `server.py` file.

#### Step 4f

Provide a screenshot to show that
you have successfully run the `server.py` file in VS Code.

#### Step 4g

Provide a screenshot to
show that you have successfully navigated to `localhost:3000`.

### Step 5

#### Step 5a

Provide a screenshot to show that
you have successfully opened the `DebeziumCDC.zip` folder in VS Code.

#### Step 5b

Provide a screenshot to show that
you have successfully created the `debeziummodule16` Docker image.

#### Step 5c

Provide a screenshot to show that
you have successfully created the Docker container and associated it with
the `MBTANetwork` network.

#### Step 5d

Provide a screenshot to show that
you have successfully installed the `nano` text editor in your shell.

#### Step 5e

Provide a screenshot to show that
you have successfully modified the `MongoDB.java` class.

#### Step 5f

Provide a screenshot to show that
you have successfully modified the `handleChangeEvent` method.

#### Step 5g

Provide a screenshot to show that
you have successfully run the Maven SpringBoot application.

### Step 6

#### Step 6a

Provide a screenshot of your Docker desktop to
show the `javamaven` container running.

#### Step 6b

Provide a screenshot to show that
you successfully navigated to the directory and listed the files.

#### Step 6c

Provide a screenshot to show that
you successfully created the `ReadCDC.java` file and copied the code.

#### Step 6d

Provide a screenshot to show the results of the bash command to
execute the `ReadCDC.java` class.

### Step 7

The second submission for this project should be a Jupyter Notebook based on
the [Project 16.1 Jupyter Notebook Template][pcde-project16-jupyter] template.
There should be answers to these questions within the notebook file.

* What is the average time it takes for a bus to complete Route 1?
* Include a plot-type visualization based on the data.
The type of plot you choose to include is up to you.
* Give an estimate of the speed of the bus from `current_stop_sequence = 1` to
the last `current_stop_sequence`.

>**Note**: You can use the [haversine module][pypi-haversine] to
>calculate the distance between two points given two longitude and
>latitude coordinates.

## Additional Details

* **Estimated Time to Complete:** 11 hours
* This is a required project for the PCDE program.

## References

### Web Links

* [Project 16.1 Jupyter Notebook Template][pcde-project16-jupyter]
* [Haversine Module (from pypi.org)][pypi-haversine]
* [Project 16.1 MySQL Docker Archive][pcde-project16-mysql-docker-zip]
* [About the V3 MBTA API][mbta-api-ref-about]
* [PCDE Project 16: Module16ProjectFlask.zip][project16-flask-zip]
* [PCDE Project 16: DebeziumCDC.zip][project16-debezium-zip]
* [PCDE Mini Lesson 16.4][pcde-ml16-4]

<!-- Hidden References -->
[pcde-project16-jupyter]: https://classroom.emeritus.org/courses/1412/files/712222/download
[pypi-haversine]: https://pypi.org/project/haversine/ "Haversine PyPI"
[pcde-project16-mysql-docker-zip]: https://classroom.emeritus.org/courses/1412/files/712243/download "Project 16.1 MySQL Docker Archive"
[mbta-api-ref-about]: https://www.mbta.com/developers/v3-api "MBTA API Reference: About the V3 MBTA API"
[mbta-swagger]: https://api-v3.mbta.com/docs/swagger/index.html "MBTA Swagger"
[project16-flask-zip]: https://classroom.emeritus.org/courses/1412/files/712217/download "PCDE Project 16: Module16ProjectFlask.zip"
[project16-debezium-zip]: https://classroom.emeritus.org/courses/1412/files/712237/download "PCDE Project 16: DebeziumCDC.zip"
[pcde-ml16-4]: https://classroom.emeritus.org/courses/1412/pages/mini-lesson-16-dot-4-performing-crud-operations-on-a-mongodb-database-using-java-30-00 "PCDE Mini Lesson 16.4"

### Note Links

* [Docker][-docker]
* [MySQL][-mysql]
* [VS Code][-vscode]
* [JSON][-json]
* [Flask][-flask]
* [MongoDB][-mongodb]
* [Change Data Capture][-cdc]
* [SQL][-sql]
* [Relational Database][-rel-db]
* [Mapbox][-mapbox]
* [Debezium][-debezium]
* [Spring Boot (Java Web Application Framework)][-spring]
* [BASH Shell][-bash]
* [Nano (Terminal Editor)][-nano]

<!-- Hidden References -->
[-docker]: docker.md "Docker"
[-mysql]: mysql.md "MySQL"
[-vscode]: vscode.md "Visual Studio Code (VS Code)"
[-json]: json.md "JavaScript Object Notation (JSON)"
[-flask]: flask.md "Flask (Python web framework)"
[-db]: database.md "Database"
[-mongodb]: mongodb.md "MongoDB"
[-cdc]: change-data-capture.md "Change Data Capture"
[-sql]: sql.md "SQL"
[-rel-db]: relational-database.md "Relational Database"
[-mapbox]: mapbox.md "Mapbox"
[-debezium]: debezium.md "Debezium"
[-spring]: java-spring.md "Spring Boot (Java Web Application Framework)"
[-bash]: bash.md "BASH Shell"
[-nano]: nano.md "Nano (Terminal Editor)"
