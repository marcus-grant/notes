---
tags: null
created: 2022-11-15T14:13:16.819Z
modified: 2022-11-15T14:34:24.365Z
---
# Database Containerization

Containers are basic execution environments that are sandboxed and contained within sandboxed portions of an operating system. They are very useful for developing, testing and even deploying databases. See [containers](containers.md) for details.

## Running a Container in Docker

```sh
docker run -p 3306:3306 --name test-mysql -e MYSQL_ROOT_PASSWORD='root' -d mysql
```

* `p` specifies the port mapping, from the host port outside the container to the expected ports within the container.
* `name` specifies the name to refer to the container as
* `e` specifies environment variables to be accessible within the container
* `d` specifies that the container should run detached, as in not piping into the shell, running in background
* `mysql [name]` the final specifier is the name of the container image to download, in this case `mysql`
