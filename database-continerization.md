---
created: 2022-11-15T14:13:16.819Z
modified: 2023-03-21T10:34:47.235Z
tags: [db,database,containers,testing,devops]
---
# Database Containerization

Containers are basic execution environments that
are sandboxed and contained within sandboxed portions of an operating system.
They are very useful for developing, testing and even deploying databases.
See [containers][container-zk] for details.

## Running MySQL in Docker

You can run various [SQL based databases][sql-zk] in [containers][container-zk].

```sh
docker run -p 3306:3306 --name test-mysql -e MYSQL_ROOT_PASSWORD='root' -d mysql
```

* `p` specifies the port mapping,
from the host port outside the container to the expected ports within the container.
* `name` specifies the name to refer to the container as
* `e` specifies environment variables to be accessible within the container
* `d` specifies that the container should run detached,
as in not piping into the shell, running in background
* `mysql [name]` the final specifier is the name of the container image to download,
in this case `mysql`

## Running MongoDB in Docker

```sh
docker run -p 27017:27017 --name some-mongo -d mongo
```

* `p` specifies the port mapping,
from the host port outside the container to the expected ports within the container.
* `name` specifies the name to refer to the container as
* `d` specifies that the container should run detached,
as in not piping into the shell, running in background
* `mongo [name]` the final specifier is the name of the container image to download

## References

### Note References

* [Containers][container-zk]
[container-zk]: ./container.md "Containers"
* [SQL][sql-zk]
[sql-zk]: ./sql.md "SQL"
