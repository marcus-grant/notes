---
created: 2024-10-24T12:05:00.000Z
tags: [depo,log,dev,encode,project]
---
# Depo: Initial Development Log

## Description

A development log and loose notes document for my **depo** project.

## Idea

The idea is to have a simple to use but highly expandable in function,
without overwhelming users and devs,
short code indexer for text, files, content and references/URIs.
Everything should revolve around the short code.
Then all other features, just different means of either representing or
performing logic on the short code.

### Idea: Short Code

### Idea: Encoding

The short code should be as compact as possible while being easily represented in a safe symbol-set.
Safe in the sense it can be entered into a URI field, terminal, or text editor without causing issues.
Base64 is almost perfect for this,
but its need for two non-alphanumeric ASCII characters makes it less than ideal.
In a terminal, there aren't many characters to add to the set that
won't interfere with expected command syntax.
In a URL field, the same issues arise as you need to preserve conventions like `?` and `&`.
You also risk running into special syntax characters in plain text formats when entered into files.
These will often be entered into markdown documents like this one where:
`[a short link](http://example.com/short-code)` represents a link and where:
`[a bad link](http://example.com/short))` would break the link as it uses `)`.

To make this design as flexible and simple as possible,
I'll stick to the tried and tested base62 encoding.
Just about any kind of plain text format must be able to
accommodate for the 62 alphanumeric ASCII characters.
I severely doubt that speed of encoding will be an issue compared to
database queries and HTTP request handling.
Testing will be done later to verify this.

### Idea: Code Length

#### Old Idea: Base62
To keep the short code as short as possible while still permitting for collisions,
a variable truncation of a hash will be performed.
After the content has been hashed,
the hash will be fed to the base62 encoder,
then the index in the database will store the full base62 encoded hash.
The shortest unique code will be determined by starting at a minimum length of 4.
Then every time a 4 symbol code is entered into a query and a 5, 6 or seven length code exists,
the oldest code will be used.

#### New Idea: Base32

To keep the variable still short,
but a lot safer whether or not it gets used in
URL strings or case-insensitive environments,
[Base32][-base-32] is the decided encoding scheme.

#### Code Length: Example

Say we have these hashed and encoded values:

|Base62 Hash| Date     |
|-----------|----------|
|`abcdefg0`   |2024-10-24|
|`abcdefg1`   |2024-11-09|
|`abcdefg2`   |2024-11-29|
|`abcdefg3`   |2024-12-01|

If we receive a query for a `abcd` short-code,
then our query in the database `SELECT * FROM table WHERE code LIKE 'abcd%'` will
return us all the above rows.
However, if we add `ORDER BY date ASC` to the query,
then we will get the oldest entry, `abcdefg0`.
That will be the canonical entry for the `abcd` short code.

Then the canonical entry for `abcde` will be `abcdefg1`, using the same rules.
And for `abcdef` it will be `abcdefg2`.
And so on...

For more info go to [this ChatGPT conversation](https://chatgpt.com/share/67212abe-4908-8005-b858-51c2faffc1ee)

## Design

### The Short Code

- Base62
  - `[0-9, a-z, A-Z]`
- Variable Length
  - Minimum code length of 4
  - When there are collisions of only 4 symbols which will eventually happen...
    - Oldest entry is the canonical one for that 4 code length
    - Determined by querying with `LIKE` and `ORDER BY date ASC LIMIT 1` for oldest match
    - When creating new code it stores full hash in base62
      - ...but the returned code is either 4 or the minimum length that is unique

### Hashing

The first stage of this process is to hash the content.
I've considered using md5 as it's fast,
simple to implement and might have good enough collision rates.
I've since considered that it might be worth minimizing collisions to
speed up the lookup of a short code.
Better distributions of hashed values will mean more codes will be a shorter length.

I also want to limit the dependencies I'm managing for this project.
HighwayHash and FastHash seemed like great candidates.
REALLY fast hashing with much better distributions than md5.
However looking around for implementations,
I could only find sparsely used `pip` packages.

I also started looking into the python STL and saw that Blake2b was available.
It's faster than md5 and has a better distribution,
in fact it appears to be cryptographically secure.
It also can produce mere 64-bit digests which is more than I need to represent.
It is in the quadrillions even after taking on
the 10 bit padding that seems to be recommended for uniqueness guarantees.
*Please cite*.

References
----------

- [Base32][-base-32]

<!-- Hidden References -->
[-base-32]: ./base32.md "Base32 Encoding Explained by Zakki, Kun (2024-10-24)"
