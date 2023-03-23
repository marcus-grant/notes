---
created: 2022-11-15T21:58:27.124Z
modified: 2023-03-23T14:25:23.102Z
tags: [redis,key,value,database,memory,data,server,cache,storage,pcde,module12]
---

# Redis

Redis is an in-memory, key-value store that works with tremendous speed.
A [key-value database][kv-db-zk] store is a type of NoSQL database where
*keys* server as unique identifiers for their values.
A **Redis** instance can include various databases,
all containing different datatypes.

Note that because it is in-memory,
it is not persistent by default.
While it is possible to persist data to disk,
there are other databases that are better suited for that purpose.

>Fun Fact: Redis is an acronym for **R**emote **D**ictionary **S**ervice.

## Start a Redis Container Using Docker

There are many ways to init a [Redis database][redis-zk].
[Docker][docker-zk] might be the best one however.
To init Redis with a *Docker container*, run this command:

```sh
docker run -p 6379:6379 --name name_of_container -d redis
```

After opening *Docker* & running the command above,
you should see a *docker container* running *redis*.

## Redis Using Python

It is possible to control [Redis using Python drivers][redis-py-zk].

## References

### Web References

<!-- Hidden References -->

### Note References

* [Key-Value Databases][kv-db-zk]
* [Redis][redis-zk]
* [Docker][docker-zk]
* [Redis Using Python][redis-py-zk]

<!-- Hidden References -->
[kv-db-zk]: ./key-value-database.md "Key-Value Databases"
[redis-zk]: ./redis.md "Redis"
[docker-zk]: ./docker.md "Docker"
[redis-py-zk]: ./redis-using-python.md "Redis Using Python"
