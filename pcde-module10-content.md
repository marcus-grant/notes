---
created: 2023-03-06T10:06:48.722Z
modified: 2023-03-07T10:31:09.199Z
tags: [network,http,web,computer,software,postman,api,cli,pcde,module10]
---
# PCDE Course: Module 10 Content

## Knowledge Check 10.1: Command Line Commands

* Q1: What is the exact use of command `ls -at`?
  * **(Correct)**: List all files in the current directory, sorted by time,
with the most recent first.
* Q2: Which command would you use to delete a directory and all its contents?
  * **(Correct)**: `rm -R`
* Q3: Which command would you use to get a list of commands that
were executed in the current user session?
  * **(Correct)**: `history`
* Q4: Which of the following is an environment variable of a command line?
  * **(Correct)**: `HOME`
* Q5: Suppose you have 10 file in a directory & you want to search for
the word "science" in all of the files.
Which command would you use to get the list of files that
have the word "science" in them?
  * **(Correct)**: `grep -r "science" *`

## Knowledge Check 10.2: Networks

* Q1: What does HTTP stand for?
  * **(Correct)**: Hypertext Transfer Protocol
* Q2: Which command would you use to find your machines IPv4 address?
  * **(Correct)**: `ipconfig`
* Q3: Suppose that you have the IP address of your router.
On a Windows machine, which command would you use to check if
your machine is connected to the router or not?
  * **(Correct)**: `ping`
* Q4: What is the use of the `GET` method in an HTTP request?
  * **(Correct)**: To retrieve data from a server.
* Q5: What are the different components of an HTTP request?
  * **(Correct)**: Request Line, Request Headers, Request Body (optional)
* Q6: Which of the following is not an example of an HTTP method?
  * **(Correct)**: `EPOST`
* Q7: What are proxies in the context of client-server architecture?
  * **(Correct)**: A proxy is a server that acts as an intermediary for requests
* Q8: What is the primary purpose of a router?
  * **(Correct)**: To send & receive data packets between local networks & the Internet.
* Q9: Which of the following applications is usually the client within
the context of client-server architecture?
  * **(Correct)**: A web browser

## Discussion 10.1: Pros and Cons of Using Containers

Notes for this exercise are covered in [containers][container-zk] and
the specific platform of [containers][container-zk], [Docker][docker-zk].

### Prompt

Once you have read about *containers*, the pros and cons of using them,
and of using Docker specifically, summarize your understanding of Docker.
In your own words,
discuss at least three benefits of using Docker and
at least three disadvantages to using Docker or *containerization* in general.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and questions to
deepen the discussion.
Comment on whether you agree or disagree with
their take on Docker and *containerization*.

### Response

*Containers* in context of
software engineering is essentially a standardized unit of software that ensures
that the software runs the same way on any machine.
It's a lot more than that however.
Due to there being isolation between the host machine and the container,
deploying software can be orchestrated and made less error prone.

This is similar to *virtual machines* in that they both provide isolation
between the host machine and the software.
However, *containers* are much more lightweight than *virtual machines*.
Where *virtual machines* are essentially a full operating system running
on top of another operating system,
*containers* are just a process running on the host machine.
The *container* effectively uses the same host operating system resources,
with a sandboxed environment for the software to run in.

#### So when is it useful to add the extra complexity of *containers*?

* If you need consistent environments to run your code on.
  * We use python a lot and there are a lot of different versions of python and
python packages where some versions might depend on different versions of python.
  * The host OS might have a different version of python installed.
  * Docker containers allows us to specify the exact version of python and
python packages that we need separately from the host OS.
* If you need to run or test different versions of software.
  * Having to setup a new environment for each version of software can be daunting.
  * With *containers* you can just spin up a new container with the new version
of software and test it out.
* If you need to orchestrate many different pieces of software.
  * If you have a lot of different pieces of software that need to be run,
then containers make it easier to spin them up with highly specific configurations.
* If you need to develop software on a different machine than the one you will
deploy it on.
  * If you are developing on Mac or Windows and deploying on a Linux machine, then
this is likely the best option to develop the software locally.
  * You can even orchestrate containers into clusters of machines using Kubernetes.

#### When not to use Docker?

* If you need software to run fast.
  * *Containers* are lighter than *virtual machines*.
  * However, they still have overhead and this is especially noticeable when
it comes to input and output operations like databases.
* If security is a concern.
  * Containers, while providing isolation, are still running on the same host
and you really need to know what you're doing to secure them.
  * If you're not careful, you can expose your host machine to the internet
and even expose the other containers to each other.

## Knowledge Check 10.3: Docker

* Q1: What is Docker Hub?
  * **(Correct)**: A *registry* of Docker images.
* Q2: What is a Dockerfile?
  * **(Correct)**: A text file that contains instructions for building a Docker image.
  * *a.k.a. a blueprint*
* Q3: Where do Docker *images* typically run?
  * **(Correct)**: *containers*
* Q4: Which command can be used to *push* a Docker image to Docker Hub?
  * **(Correct)**: `docker push [IMAGE]`
* Q5: What kind of architecture does Docker use?
  * **(WRONG)**: layered architecture
  * **(Correct)**: client-server architecture

## Activity 10.1: Creating a Docker Image

In this activity, you will be using Visual Studio (VS) Code to create an image for
a web application that displays `Hello World - my first Docker Image!`.
Make sure to install the Docker extension for VS Code.

Prior to beginning this activity,
be sure to review the submission instructions below to
ensure that you collect the required screenshots as
you progress through the activity.

To complete the activity, perform the following steps:

Download the following starter file to your local machine:
Assignment 10.1 - Docker Image.zip.
The zip file contains the initial code for this activity.
Open the folder in Visual Studio Code:

Prior to beginning this activity,
be sure to review the submission instructions below to
ensure that you collect the required screenshots as
you progress through the activity.

### Instructions

To complete the activity, perform the following steps:

#### 1. Download the following starter file to your local machine

* ***TODO:*** Add link to starter file and store it somewhere in
a permanent archive that is accessible

#### 2. Open the folder in Visual Studio Code

#### 3. Add a file called `Dockerfile` & copy these contents to the file

```dockerfile
FROM node:12.16.3

WORKDIR /code

ENV PORT 80

COPY package.json /code/package.json

RUN npm install

COPY . /code/

CMD [ "node", "src/server.js"]
```

* Make sure to add the Dockerfile in the folder `Assignment 10.1 - Docker Image` and
save it after editing it.

#### 4. Now you are ready to start creating an image of this web application

* You will need to go to the command line to run the Docker commands to create an image.
* In [VS Code][vscode-zk], navigate to the terminal
* Then select `New Terminal` from the dropdown menu

#### 5. Run the command from the prompt to create an image

* This command should be in the same directory where you downloaded the starter file.

```sh
docker build --tag hello-world .
```

* The space at the end of the `docker build command and the `.` means
the current directory.

#### 6. View the Docker image

* You should now have created a Docker image for the `Hello World` application.
* To view the Docker image, run the following command:

```sh
docker images
```

#### 7. Execute the run command to start the container

* Now you can run your image
* Execute the following command to start the container:

```sh
docker run -p 8080:80 --name hello -d hello-world
```

* **Note**: For a detailed description of each command, run `--help` on the command.

#### 8. Verify the application and container are working

* Open your browser and navigate to `http://localhost:8080`
* `Hello World - my first Docker Image!` should be displayed in the browser.

### Submission Instructions

The submission for this activity should be a word document that
contains the following screenshots, each labeled for the step it represents:

1. Dockerfile added to the `Activity 10.1 - Docker Image` folder
2. Screenshot of running the `docker build` command
3. Screenshot of running the `docker images` command
4. Screenshot of running the `docker run` command to run the image in the container
5. Screenshot of a web browser to show that you have navigated to the URL of
`http://localhost:8080` and the `Hello World - my first Docker Image!` message is displayed

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [CLI: Command Line Interface][cli-zk]
* [GNU CoreUtils][coreutils-zk]
* [Computer Networks][network-zk]
* [HTTP: Hypertext Transport Protocol][http-zk]
* [HTTP Headers][http-headers-zk]
* [Software Containers][container-zk]
* [Docker][docker-zk]
* [VS Code][vscode-zk]

<!-- Hidden References -->
[cli-zk]: ./cli.md "CLI: Command Line Interface"
[coreutils-zk]: ./coreutils.md "GNU CoreUtils"
[network-zk]: ./network.md "Computer Networks"
[http-zk]: ./http.md "HTTP: Hypertext Transport Protocol"
[http-headers-zk]: ./http-headers.md "HTTP Headers"
[container-zk]: ./container.md "Software Containers"
[docker-zk]: ./docker.md "Docker"
[vscode-zk]: ./vscode.md "VS Code"
