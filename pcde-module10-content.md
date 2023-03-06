---
created: 2023-03-06T10:06:48.722Z
modified: 2023-03-06T17:57:52.862Z
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

<!-- Hidden References -->
[cli-zk]: ./cli.md "CLI: Command Line Interface"
[coreutils-zk]: ./coreutils.md "GNU CoreUtils"
[network-zk]: ./network.md "Computer Networks"
[http-zk]: ./http.md "HTTP: Hypertext Transport Protocol"
[http-headers-zk]: ./http-headers.md "HTTP Headers"
[container-zk]: ./container.md "Software Containers"
[docker-zk]: ./docker.md "Docker"
