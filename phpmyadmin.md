---
created: 2023-05-08T16:43:53.646Z
modified: 2023-06-08T17:32:17.874Z
tags: [phpmyadmin,mysql,client,data,database,sql,mysql,mariadb]
---
# PHPMyAdmin (MySQL Client)

## Introduction

PHPMyAdmin is a web-based MySQL client that allows you to
manage [MySQL databases][-mysql].

## Run Using Containers

### Container Introduction

In this example we'll use [Docker containers][-docker] to
run a [containerized][-container] version of PHPMyAdmin.
Parts of this guide were taken from
[Dr. Yuste's How-to on Medium][dr-yuste-phpmyadmin-docker].
A lot of this guide can easily be adapted for [podman][-podman].

### Pull the Docker Image

```bash
docker pull phpmyadmin/phpmyadmin:latest
```

### Run the Docker Container

```bash
docker run \
    --name phpmyadmin \
    --network network_name \
    -p 8888:80 \
    -d phpmyadmin/phpmyadmin
```

This sets up a container named `phpmyadmin` on the
`network_name` network, and maps port `8888` on the host
to port `80` on the container.
It's also possible to use Docker network links to connect
the container to a MySQL container.

```bash
docker run \
    --name phpmyadmin \
    --link mysql_container_name:db \
    -p 8888:80 \
    -d phpmyadmin/phpmyadmin
```

### Alternative Docker Run (No Network Link)

This procedure is taken from [Maxim Orlov's dev.to post][devto-phpmyadmin].
First create a MySQL container of name `mysql`, root password `root` and detach it.

```bash
# MySQL Container
docker run \
    --name mysql \
    --env MYSQL_ROOT_PASSWORD=root \
    --detach \
    mysql:latest
```

Then create a PHPMyAdmin container, we'll explain the parameters afterwards.

```bash
# Start PHPMyAdmin Container
docker run \
    --name phpmyadmin \
    --publish 8888:80 \
    --network some-net \
    --env PMA_HOST=mysql \
    --env PMA_PORT=3306 \
    --env PMA_USER=root \
    --env PMA_PASSWORD=root \
    --detach \
    phpmyadmin/phpmyadmin:latest
```

* `--name phpmyadmin` - Name of the container
* `--publish 8888:80` - Map port `8888` on the host to port `80` on the container
* `--network some-net` - Connect the container to the `some-net` network
  * This is very important when not linking the container to a MySQL container
  * An alternative to this would be to pass localhost, we'll cover that with `PMA_HOST`
* `--env PMA_HOST=mysql` - Connect to the MySQL container named `mysql`
  * This is the hostname of the MySQL server
  * `mysql` as a hostname assumes a networked container named `mysql`
  * Without a networked container, you'd need to pass in `localhost` here
* `--env PMA_PORT=3306` - The port of the MySQL server
* `--env PMA_USER=root` - The username of the MySQL server
* `--env PMA_PASSWORD=root` - The password of the MySQL server
* `--detach` - Detach the container from the terminal
* `phpmyadmin/phpmyadmin:latest` - The image to use for the container

### Access the Container

Once the container is running, you can access it by
navigating to `http://localhost:8888` in your browser.

## References

### Web Links

* [PHP-MyAdmin Homepage][home-phpmyadmin]
* [Dr. Yuste. Miguel. "How to Run MariaDB & phpMyAdmin with Docker" (Medium.com)][dr-yuste-phpmyadmin-docker]
* [Orlov. Maxim. dev.to 'Install MySQL with PhpMyAdmin Using Docker'][devto-phpmyadmin]

<!-- Hidden References -->
[home-phpmyadmin]: https://www.phpmyadmin.net "PHP-MyAdmin Homepage"
[dr-yuste-phpmyadmin-docker]: https://migueldoctor.medium.com/run-mariadb-phpmyadmin-locally-in-3-steps-using-docker-6b5912ff37c9 "Dr. Yuste. Miguel. \"How to Run MariaDB & phpMyAdmin with Docker\" (Medium.com)"
[devto-phpmyadmin]: https://dev.to/maximization/install-mysql-with-phpmyadmin-using-docker-jn9 "Orlov. Maxim. dev.to 'Install MySQL with PhpMyAdmin Using Docker'"

### Note Links

* [MySQL][-mysql]
* [Docker][-docker]
* [Container (Software)][-container]
* [Podman (Software Container Runtime)][-podman]

<!-- Hidden References -->
[-mysql]: mysql.md "MySQL"
[-docker]: docker.md "Docker"
[-container]: container.md "Container (Software)"
[-podman]: podman.md "Podman (Software Container Runtime)"
