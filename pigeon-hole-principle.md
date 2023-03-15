---
created: 2023-03-15T22:09:16.856Z
modified: 2023-03-15T22:32:51.363Z
tags: [pigeon,hole,principle,math,probability,hash,cryptography,computer]
---
# Pigeonhole Principle

According to the [Wikipedia][pigeonhole-wiki],
the Pigeonhole principle is...

>In mathematics, the **pigeonhole principle** states that if
>*n* items are put into m containers, with n > m,
>then at least one container must contain more than one item. [^1]
>For example, if one has three gloves (and none is ambidextrous/reversible),
>then there must be at least two right-handed gloves,
>or at least two left-handed gloves, because there are three objects,
>but only two categories of handedness to put them into.
>This seemingly obvious statement, a type of *counting argument*,
>can be used to demonstrate possibly unexpected results.
>For example,
>given that the population of London is greater than
>the maximum number of hairs that can be present on a human's head,
>then the pigeonhole principle requires that
>there must be at least two people in London who
>have the same number of hairs on their heads.

## Birthday Problem

The [birthday problem][bday-prob-wiki] is a special case of
the pigeonhole principle.
It states that in a set of *n* randomly chosen people,
the probability that two of them will have the same birthday
is more than half, provided *n* is more than 23.

This unexpected result can be explained by the pigeonhole principle,
which asserts that if *n* items are put into *m* containers,
with $n > m$,
then at least one container must contain more than one item.
It appears in many other contexts,
including computer science,
where it is used to analyze [hash functions][hash-func-zk] and
their [potential for collisions][hash-collision-zk].

## References

### Web Links

* [Pigeon hole principle (from Wikipedia, the free encyclopedia)][pigeonhole-wiki]
* [Birthday Problem (from Wikipedia, the free encyclopedia)][bday-prob-wiki]

<!-- Hidden References -->
[pigeonhole-wiki]: https://en.wikipedia.org/wiki/Pigeonhole_principle "Pigeon hole principle (from Wikipedia, the free encyclopedia)"
[bday-prob-wiki]: https://en.wikipedia.org/wiki/Birthday_problem "Birthday Problem (from Wikipedia, the free encyclopedia)"

### Note Links

* [Hash Function][hash-func-zk]
* [Hash Collision][hash-collision-zk]

<!-- Hidden References -->
[hash-func-zk]: ./hash-function.md "Hash Function"
[hash-collision-zk]: ./hash-collision.md "Hash Collision"

### Textual References

[^1]: Herstein, I. N. (1964), Topics In Algebra, Waltham: Blaisdell Publishing Company, ISBN 978-1114541016
