---
created: 2023-05-08T16:43:53.646Z
modified: 2023-05-08T17:44:00.000Z
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

### Access the Container

Once the container is running, you can access it by
navigating to `http://localhost:8888` in your browser.

## References

### Web Links

* [PHP-MyAdmin Homepage][home-phpmyadmin]
* [Dr. Yuste. Miguel. "How to Run MariaDB & phpMyAdmin with Docker" (Medium.com)][dr-yuste-phpmyadmin-docker]

<!-- Hidden References -->
[home-phpmyadmin]: https://www.phpmyadmin.net "PHP-MyAdmin Homepage"
[dr-yuste-phpmyadmin-docker]: https://migueldoctor.medium.com/run-mariadb-phpmyadmin-locally-in-3-steps-using-docker-6b5912ff37c9 "Dr. Yuste. Miguel. \"How to Run MariaDB & phpMyAdmin with Docker\" (Medium.com)"

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
