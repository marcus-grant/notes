---
created: 2023-03-07T14:15:58.715Z
modified: 2023-03-08T16:11:25.024Z
tags: [strapi,api,cms,headless,js,node,server,software,pcde,module10]
---
# Strapi

## Introduction

[**Strapi**][strapi-home] is a *headless CMS* or *content management system*.
A CMS is designed to manage content of a website.
A headless CMS is a CMS that does not have a frontend, only a backend API.
There's no web page for users to interact with;
all the work is done on the backend, and all interactions are done via APIs.

## Quick-Start Guide

***TODO***: Fill this out in simplified form with screenshots.

To get started follow the
[Strapi documentation, quick-start guide][strapi-quick-start].

## Quick Start Using Docker-Compose

```yaml
version: '3.8'

services:
  strapi:
    image: strapi/strapi
    container_name: strapi_mysql
    environment:
      DATABASE_CLIENT: mysql
      DATABASE_HOST: mysql
      DATABASE_NAME: SOME_DB_NAME
      DATABASE_PORT: SOME_DB_PORT
      DATABASE_USERNAME: SOME_DB_USERNAME
      DATABASE_PASSWORD: SOME_DB_PASSWORD
    volumes:
      - ./app:/srv/app
    ports:
      - '1337:1337'
    depends_on:
      - mysql

  mysql:
    image: mysql
    command: mysqld --default-authentication-plugin=mysql_native_password
    volumes:
      - ./data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: SOME_DB_PASSWORD
      MYSQL_DATABASE: SOME_DB_NAME
      MYSQL_USER: SOME_DB_USERNAME
      MYSQL_PASSWORD: SOME_DB_PASSWORD
```

## References

### Web Links

* [Strapi Homepage][strapi-home]
* [Quick Start Guide (from docs.strapi.io)][strapi-quick-start]

<!-- Hidden References -->
[strapi-home]: https://strapi.io/ "Strapi Homepage"
[strapi-quick-start]: https://strapi.io/documentation/developer-docs/latest/getting-started/quick-start.html#_1-install-strapi-and-create-a-new-project "Quick Start Guide (from docs.strapi.io)"

### Note Links

<!-- Hidden References -->
