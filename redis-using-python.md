---
created: 2022-11-15T22:32:24.465Z
modified: 2023-03-21T14:38:44.635Z
tags: [python,redis,db,key-value]
---
# Redis Using Python Drivers

## Install

The [Redis][redis-zk] drivers can be installed on
the machine by using the [python][py-zk] package `redis`.

```py
pip3 install redis
```

## Start a Redis Container Using Docker

There are many ways to init a [Redis database][redis-zk].
[Docker][docker-zk] might be the best one however.
To init Redis with a *Docker container*, run this command:

```sh
docker run -p 6379:6379 --name name_of_container -d redis
```

After opening *Docker* & running the command above,
you should see a *docker container* running *redis*.

## Using Python to Define Redis Database

[Redis][redis-zk] stands for Remote Dictionary Service.
This definition may make you think of [Python][py-zk] *dictionaries* and
in some sense that's true.
Remember that Redis databases are defined using *key-value* pairs,
like Python *dictionaries*.

The main difference between [Redis][redis-zk] & [Python][py-zk] *dictionaries* are:

* Redis *dictionaries* support a variety of *methods*, such as `GET`, `SEL` and `DEL`.
* Python *dictionaries* don't support these *methods*, but instead use different ones such as...
  * `copy()`, `clear()`, and `pop()`.
* Redis *keys* are always *strings*. In Python, *keys* can be of any datatype

## How to Define a Database in Redis

Redis databases can be initialized using the following:

```py
import redis
# Connect
r = redis.Redis(host='localhost', port=6379, db=0)
# Write to DB
t = python_code_to_define_key_value_pairs
r.push('entries', t)
```

Note that the code above, `d=0` inits the database 0.
In Redis, by default, there are 16 available databases numbered from 0 ~ 15.

After defining the database and its entries,
you may want to read those entries to ensure everything is defined correctly.
You can do that with this:

```py
import redis
# Connect
r = redis.Redis(host='localhost', port=6379, db=0)
# Read
for item in r.lrange('items', 0, -1)
    print(item)
```

## Methods in Redis

The table below explains the most common Redis *methods* that
can be used to access and modify database entries.

* `GET`
  * Use the [`GET`][redis-get] to get the value of a *key*
  * If the *key* does not exist, the special value `nil` is returned.
  * An error is returned if the value stored as *key* is not a *string*.
    * This is because `GET` only handles *string* values.
* `SET`
  * Use the [`SET`][redis-set] *method* to set the *key* to hold the string value.
  * If a *key* already holds a value, it is overwritten, regardless of its type.
  * Any previous time to live associated with the *key* is discarded on successful `SET`.
* `DEL`
  * Use the [`DEL`][redis-del] *method* to remove specified *keys*.
  * A *key* is ignored if it does not exist.

## References

### Web References

* [Redis Commands: GET][redis-get]
* [Redis Commands: SET][redis-set]
* [Redis Commands: DEL][redis-del]
* [Redis All Commands Documentation][redis-all-cmd]

<!-- Hidden References -->
[redis-get]: https://redis.io/commands/get "Redis Commands: GET"
[redis-set]: https://redis.io/commands/set "Redis Commands: SET"
[redis-del]: https://redis.io/commands/del "Redis Commands: DEL"
[redis-all-cmd]: https://redis.io/commands/ "Redis Commands (all)"

### Note References

* [Python][py-zk]
* [Redis][redis-zk]
* [Key-Value Databases][kv-db-zk]
* [Docker][docker-zk]

<!-- Hidden References -->
[py-zk]: ./python.md "Python"
[redis-zk]: ./redis.md "Redis"
[kv-db-zk]: ./key-value-database.md "Key-Value Databases"
[docker-zk]: ./docker.md "Docker"
