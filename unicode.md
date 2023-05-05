---
created: 2023-05-05T11:31:14.241Z
modified: 2023-05-05T12:31:22.000Z
tags: [unicode,utf,standard,encode,information,data,text,character]
---
# Unicode

## Introduction

>**Unicode**, formally The Unicode Standard,
>is an information technology standard for the consistent encoding, representation,
>and handling of text expressed in most of the world's writing systems.
>The standard, which is maintained by the Unicode Consortium,
>defines as of the current version (15.0)
>`149 186` characters covering 161 modern and
>historic scripts, as well as symbols, thousands of emoji (including in colors),
>and non-visual control and formatting codes.
>
>-- [Wikipedia (the free encyclopedia)][wiki-unicode]

## UTF-8

>UTF-8 is a variable-length character encoding standard used for
>electronic communication.
>Defined by the Unicode Standard,
>the name is derived from Unicode (or Universal Coded Character Set)
>Transformation Format – 8-bit.
>
>UTF-8 is capable of encoding all `1 112 064` valid character code points in
>Unicode using one to four one-byte (8-bit) code units.
>Code points with lower numerical values, which tend to occur more frequently,
>are encoded using fewer bytes.
>It was designed for backward compatibility with ASCII:
>the first 128 characters of Unicode, which correspond one-to-one with ASCII,
>are encoded using a single byte with the same binary value as ASCII,
>so that valid ASCII text is valid UTF-8-encoded Unicode as well.
>
>--[Wikipedia (the free encyclopedia)][wiki-utf8]

UTF-8 results in fewer internationalization issues than
any alternative text encoding.
Which has resulted in the standard's proliferation in
most [operating systems][-os], data exchange formats like [JSON][-json],
most [database systems][-db] including [MySQL][-mysql],
and increasingly, it is the only form of **unicode** used on the web.

### Encoding

UTF-8 is a variable width character encoding where **code points**,
represented by one to four bytes,
map to **code units** (a.k.a. code values) that are 8-bits wide.
These **code units** then point to pages of 256 *character sets*.

| 1st Code Pt. | Last Code Pt. |  Byte1   |  Byte2   |  Byte3   |  Byte4   |
| :----------: | :-----------: | :------: | :------: | :------: | :------: |
|    U+0000    |    U+007F     | 0xxxxxxx |          |          |          |
|    U+0080    |    U+07FF     | 110xxxxx | 10xxxxxx |          |          |
|    U+0800    |    U+FFFF     | 1100xxxx | 10xxxxxx | 10xxxxxx |          |
|   U+10000    |   U+10FFFF    | 1100xxxx | 10xxxxxx | 10xxxxxx | 10xxxxxx |

What is clever about this variable length encoding scheme is two-fold.
First, the most common characters used can be arranged in the first 128 *code points*,
and the next most in the next *code points*.
This means that less data gets used to represent the most common characters.

Secondly,
the first *code point* uses the exact [ASCII][-ascii] character set encoding.
Meaning that any ASCII encoded text is also valid UTF-8 encoded text,
so that ASCII encoded text can be used on UTF-8 encoded systems.
Therefore, UTF-8 is backwards compatible with ASCII.

## References

### Web Links

* [Unicode (from Wikipedia, the free encyclopedia)][wiki-unicode]
* [UTF-8 (from Wikipedia, the free encyclopedia)][wiki-utf8]

<!-- Hidden References -->
[wiki-unicode]: https://en.wikipedia.org/wiki/Unicode "Unicode (from Wikipedia, the free encyclopedia)"
[wiki-utf8]: https://en.wikipedia.org/wiki/UTF-8 "UTF-8 (from Wikipedia, the free encyclopedia)"

### Note Links

* [Operating System][-os]
* [JavaScript Object Notation][-json]
* [Database][-db]
* [MySQL][-mysql]
* [ASCII][-ascii]

<!-- Hidden References -->
[-os]: os.md "Operating System"
[-json]: json.md "JavaScript Object Notation"
[-db]: database.md "Database"
[-mysql]: mysql.md "MySQL"
[-ascii]: ascii.md "American Standard Code for Information Interchange (ASCII)"
