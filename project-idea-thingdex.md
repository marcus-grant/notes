---
created: 2023-03-15T19:03:08.548Z
modified: 2023-03-15T22:43:28.374Z
tags: [project,personal,bin,uri,url,data,short,architecture,hash,birthday,paradox,selfhost,idea,thingdex,index]
---
# Project Idea: Arbitrary File Bin & URI Shortener (thINgDEX)

## Problem Statement

For a lot of use cases,
I've found myself in need of a service that can store arbitrary files.
Particularly files I don't want to deal with organizing on my local machine or
or on a personal or cloud storage service.

Well, you might say,
isn't that what a *Paste Bin*, or *Imgur* type service is for?
True, but the permanence of most of these services are rarely sufficient for
my needs.
***TODO:*** *Before publishing, find a good example of these services' impermanence.*

Take for example, my [ZettelKasten system][zk-zk];
I need to know, or at least have access to the files I've uploaded to the service,
that they can always be indexable.
If I'm going to keep images associated to my notes off of
the repository storing the note contents,
I need to know a consistent name or ID is applied to the image and
that I can always retrieve it should the service go down or I retire it.
At the very least, I need to be able to be able to access the files in some way.
With a self-hosted service, I am assured by having my own backups of
the service with consistent indexes of the files that get uploaded.

## An Idea Started to Form

Thinking some more on this,
it occurs to me that permalink URLs to a stored image is hardly the only use case.
This is essentially a personal index to all my own data and
even data from the internet that I want to keep track of.
My own personal data index, *a **thINgDEX** if you will*.

If the data is a reference to something like a URL or URI,
then it's basically a URL or URI shortener.
If it's a binary file, then this service is a file or media bin.
If it's a text file, then it's a *Paste Bin*.

All of these use cases are minor variations of the same service.
All of these services rely on one fairly simple service,
a large hashed key-value store, or large file [**hash table**][hashtable-zk] based,
**indexing** service.
Implementing the **thINgDEX** would naturally lead to
a rich ecosystem of federated microservices that
the open source community could really sink their teeth into.

## The Core of the thINgDEX Architecture

So that begs the question,
what should the core of this ecosystem, the **thINgDEX** service, look like?
Let's examine the concept of a **hash table** to see if
we can't shake loose some ideas from our brains.

### Offline First

Since home internet connections are not always reliable,
and because personal computation hopefully happens off-grid sometimes,
the **thINgDEX** service should be designed to be **offline first**.
This means that at least for a time,
local caches of the service should be able to be used,
even if new *thINgDEX* entries are intended to be inserted.

Some architectural constraints come to mind with this requirement.
Namely, that the state of the cache should be at least loosely coupled to
the state of main service.
For setting entries into the service, this isn't possible without
a network connection.
However, some design decisions can mitigate this problem.
The main problem with having a cache that is not in sync with
the main service is in the case of a collision.

Since we're dealing with databases as the backing store,
the auto-incrementing primary key seems like a good idea.
The problem is, the *offline first* design constraint makes this a bad idea.
The longer the service is offline, the more likely it is that
the state of the auto-incrementing primary key will be out of sync.
Resolving this through syncing between many clients becomes nearly impossible.

Another alternative is a *universally unique identifier* or **UUID**.
This idea seems attractive at first, but it has a few problems.
For a UUID to be universally unique, it must be quite large.
To also function as a shortening index, it must be small.
So where does that leave us?

How about one of the typical indexing solutions that
[hash tables][hashtable-zk] use.
The remaining concern then becomes when to expand the number of symbols in
the *thINgDEX* value and how we deal with, hopefully,
relatively rare [hash collisions][hash-collision-zk].

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Zettelkasten Knowledge Management System][zk-zk]
* [Hash Table][hashtable-zk]
* [Hash Collision][hash-collision-zk]

<!-- Hidden References -->
[zk-zk]: ./zk.md "Zettelkasten Knowledge Management System"
[hashtable-zk]: ./hash-table.md "Hash Table"
[hash-collision-zk]: ./hash-collision.md "Hash Collision"
