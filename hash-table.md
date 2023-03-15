---
created: 2023-03-15T21:15:54.514Z
modified: 2023-03-15T22:41:35.850Z
tags: [hash,table,dictionary,data,structure,computer,science,algorithm,software]
---
# Hash Table

Continue the thread of thought from the
[Project Idea (thINgDEX)][project-idea-thingdex-zk] notes.

## Analysis of Collision Probability

Due to the [Pigeonhole Principle][pigeonhole-zk],
it is possible for a hash function to generate the same hash value for two
different inputs.
This results in a [hash collision][hash-collision-zk].
To learn more about the probability of a hash collision,
and how to resolve it,
read the previously linked two topics.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Project Idea: Arbitrary File Bin & URI Shortener (thINgDEX)][project-idea-thingdex-zk]
* [Pigeonhole Principle][pigeonhole-zk]
* [Hash Collision][hash-collision-zk]

<!-- Hidden References -->
[project-idea-thingdex-zk]: ./project-idea-thingdex.md "Project Idea: Arbitrary File Bin & URI Shortener"
[pigeonhole-zk]: ./pigeon-hole-principle.md "Pigeonhole Principle"
[hash-collision-zk]: ./hash-collision.md "Hash Collision"
