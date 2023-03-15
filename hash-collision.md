---
created: 2023-03-15T21:52:54.230Z
modified: 2023-03-15T22:38:47.527Z
tags: [hash,collision,table,dictionary,key,value,data,structure,computer,science,algorithm]
---
# Hash Collision

Hash collision occurs when two different inputs to a hash function resolve to
the same output.

To get more precise, here's the [definition from Wikipedia][hashcollision-wiki]:

>In computer science,
>a **hash collision** or **hash clash**[^1] is when two pieces of data in
>a hash table share the same hash value.
>The hash value in this case is derived from
>a hash function which
>takes a data input and returns a fixed length of bits.[^2]
>
>Although hash algorithms have been created with
>the intent of being collision resistant,
>they can still sometimes map different data to the same hash
>(by virtue of the [pigeonhole principle][pigeonhole-zk]).
>Malicious users can take advantage of this to mimic, access, or alter data.[^3]

Examining the likelihood of a *hash collision* is necessary when
working with [hash tables][hashtable-zk].

## ChatGPT Query

### My Initial Prompt

Consider the birthday paradox as an analogy to
a URL shortener that hashes either URIs or binary data to
create a base58 shortened URL slug that also acts as the content's ID.
What is the equation to determine the probability of a collision based on
the number of base58 digits are being used to create the ID?

### ChatGPT's First Response

The birthday paradox helps us understand the probability of
two or more elements in a set having the same property
(in this case, the same shortened URL slug or content ID)
when selecting elements at random.

For a URL shortener that uses base58 encoding,
there are 58 possible characters for each position in the shortened URL slug.
If the slug is 'n' characters long, there are 58^n possible unique slugs.

The probability of
a collision occurring can be calculated using the complementary probability of
no collisions occurring.

Let's consider *k* randomly generated slugs.
The probability of no collision occurring between the first two slugs is:

$$P(no \space collision, 2^{nd} \space entry) = 1 - 58^{-n}$$

Now, when we introduce a third slug,
the probability of it not having a collision with the previous two is:

$$P(no \space collision, 3^{rd} entry) = 1 - 2 (58^{-n})$$

And so on.
For *k* slugs,
the probability of the *k*th slug not colliding with any of the previous slugs is:

$$P(no \space collision, k^{th} entry) = 1 - (k-1)(58^{-n})$$

To find the probability of no collision occurring among all *k* slugs,
we multiply the probabilities for each slug:

$$P(no \space collision, all \space k \space entries) =
(1 - 1(58^{-n})) * (1 - 2(58^{-n}) * \ldots * (1 - (k-1)(58^{-n}))$$

Simplifying this to a series product, we get:

$$P(no \space collision, all \space k \space entries) =
\prod_{i=1}^{k-1} (1 - i(58^{-n}))$$

The probability of at least one collision occurring is the complement of
the probability of no collision:

$$P(|collisions| \ge 1) = 1 - P(no \space collision, all \space k \space entries)$$

To estimate the number of slugs *k* that can be generated before
reaching a specific probability of collision,
you can solve for *k* in the equation above.
However,
it's important to note that this equation doesn't have a closed-form solution for *k*,
so you may need to use numerical methods or approximations to find the desired value.

### Prompting for a Mathematical Approximation

Is there an approximation for *k - 1* unique values already occupying this hash table,
out of *n* possible values that the kth value collides with the others?

### ChatGPT Gives a Mathematical Approximation

Yes,
there is an approximation for the probability of the k-th value colliding with
the previous *(k-1)* values,
given that there are *n* possible values (in our case, n = 58^length_of_slug).
This approximation is based on the birthday paradox problem,
where the probability of a collision becomes more likely as
the number of elements increases.

The probability of
a collision after *k* elements can be approximated using the birthday paradox formula:

$$P(collision) \approx 1 - e^{\frac{-k^2}{2n}}$$

Now, we can solve for k, given a desired probability of collision *(P)*:

$$k \approx \sqrt{-2n * ln(1 - P)}$$

## References

### Web Links

* [Hash collision (from Wikipedia, the free encyclopedia)][hashcollision-wiki]

<!-- Hidden References -->
[hashcollision-wiki]: https://en.wikipedia.org/wiki/Hash_collision "Hash collision (from Wikipedia, the free encyclopedia)"

### Note Links

* [Pigeonhole Principle][pigeonhole-zk]
* [Hash Table][hashtable-zk]

<!-- Hidden References -->
[pigeonhole-zk]: ./pigeon-hole-principle.md "Pigeonhole Principle"
[hashtable-zk]: ./hash-table.md "Hash Table"

### Textual References

[^1]: Thomas, Cormen (2009), Introduction to Algorithms, MIT Press, p. 253, ISBN 978-0-262-03384-8
[^2]: Stapko, Timothy (2008), "Embedded Security", Practical Embedded Security, Elsevier, pp. 83–114, doi:10.1016/b978-075068215-2.50006-9, ISBN 9780750682152, retrieved 2021-12-08
[^3]: Schneier, Bruce. "Cryptanalysis of MD5 and SHA: Time for a New Standard". Computerworld. Archived from the original on 2016-03-16. Retrieved 2016-04-20. Much more than encryption algorithms, one-way hash functions are the workhorses of modern cryptography.
