---
created: 2022-11-15T14:13:16.819Z
modified: 2023-06-08T08:31:09.289Z
tags: [database,data,containers,testing,devops,develop,operation]
---
# Database Containerization

Containers are basic execution environments that
are sandboxed and contained within sandboxed portions of an operating system.
They are very useful for developing, testing and even deploying databases.
See [containers][-container] for details.

## Pros and Cons

### Pros

* Containers are lightweight and easy to spin up and down.
* Containers are easy to share and distribute.
* Containers are easy to version and track.
* Containers make it easier to reset the state of a database.
* Easy to segregate databases from each other.

### Cons

* Containers are not as performant as native databases
  * Especially in I/O performance, a crucial performance metric for databases.
* Container databases are harder to backup and restore without spinning down first.
* Accessing logs is harder with container runtimes.

## Running MySQL in Docker

You can run various [SQL based databases][-sql] in [containers][-container].
In this example the [MySQL][-mysql] container is run using [Docker][-docker].

```sh
docker run \
    --publish 3306:3306 \
    --env MYSQL_ROOT_PASSWORD='root' \
    --name my-mysql \
    --detach \
    mysql
```

* `publish` or `p` specifies the port mapping,
from the host port outside the container to the expected ports within the container.
* `name` or `n` specifies the name to refer to the container as
* `env` or `e` specifies environment variables to be accessible within the container
  * For MySQL you need to specify the password situation:
    * Either `MYSQL_ROOT_PASSWORD=SomePassword` or `MYSQL_ALLOW_EMPTY_PASSWORD`
* `detach` or `d` specifies that the container should run detached,
as in not piping into the shell, running in background
* `mysql [name]` the final specifier is the name of the container image to download,
in this case `mysql`

## Running MongoDB in Docker

Here [MongoDB] is run in a [Docker][-docker] [container][-container].

```bash
docker run \
    --publish 27017:27017
    --name some-mongo
    --detach \
    mongo
```

* `p` specifies the port mapping,
from the host port outside the container to the expected ports within the container.
* `name` specifies the name to refer to the container as
* `d` specifies that the container should run detached,
as in not piping into the shell, running in background
* `mongo [name]` the final specifier is the name of the container image to download

## References

### Note References

* [Containers][-container]
* [Docker][-docker]
* [SQL][-sql]
* [MySQL][-mysql]
* [MongoDB][-mongo]

<!-- Hidden Reference Links Below Here -->
[-container]: container.md "Containers"
[-docker]: docker.md "Docker"
[-mongo]: mongo.md "MongoDB"
[-mysql]: mysql.md "MySQL"
[-sql]: sql.md "SQL"
