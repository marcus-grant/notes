---
created: 2024-11-01T15:34:11.000Z
tags: [code,base32,software,number]
---

Base32
======

Abstract
--------

An overview about the Base32 encoding and decoding scheme.
It can take arbitrary or length restricted data and encode it into
a human readable textual format.
It is a middle ground between Base16 / Hexadecimal and Base64 encoding.
It's more compact than Base16 even though it only cleanly divides into
blocks of 5 bytes, vs 1 byte being two Hexadecimal symbols.
It is also safer than Base64 as it is case insensitive,
uses only ASCII available alphanumeric characters.
This makes it safer if the code needs to show up in
URL strings, file names, and other text formats where
non-alpha-numeric characters often have reserved meanings.
Finally, it is also easier for human consumption and processing.

Algorithm
---------

Regardless of the specific alphabet used to encode values,
the same general algorithm gets used.
With one consideration to make,
*is the content-length known or unknown?*

### Algorithm Basic Example
Being a 5-bit encoding and computers generally using multiples of 8 bits,
that means the best way to encode the data is to use 40-bit or 5-byte blocks.
Let's take an example below, the [UTF-8][-utf8] encoding of `Hello`:

```plaintext
Input String:      'H'      'e'      'l'      'l'       'o'
UTF-8 Bytes:    01001000  01100101 01101100 01101100  01101111
Splits:         |   |\    / |   |\    |\    | \  \ \    |\    \
UTF-8 Quintets: 01001 00001 10010 10110 11000 11011 00011 01111 (no extra bits)
B32 Decimals:     9     1    18    22    24    24    27    15
B32 RFC4648:      J     B     S     W     Y     Y     3     D
B32 Hex:          9     1     I     M     O     R     3     F
B32 Crockford:    9     1     J     P     R     V     3     F
```

>**Note:** Since 'Hello' is 5 characters long, or 5 bytes, we get 40 bits or 5 bytes.
>Since the block is a multiple of the Least Common Multiple of 5 and 8,
>we know that there will not be extra bits in the 5 bit characters.

Since this is the easy case, it's easier to explain the algorithm.
What is happening above is that the incoming data,
which is UTF-8 encoded bytes, is split into 40-bit blocks.
Since the data is exactly 40-bits long, only one block is used.

Then to have 5-bits to translate into a Base32 character,
that block's 5 bytes are split into 8 5-bit quintets.
The splits happen in big-endian or most significant bit first order.

Then you have 5-bit unsigned integers that can easily map onto an alphabet.
Which is a simple index lookup operation on a fixed array of 32 characters.
Due to the fixed nature of the lookup array it means it will
all fit on the process stack.

To optimize this set of operations,
you'd need to consider the L1 cache size of the CPU and
choose the optimal block size.
Whatever the block size it should always be a multiple of 5 bytes.

### Implicit Padding
If you know the length of message, data or content being encoded,
then Base32 not cleanly dividing into 8-bit bytes matters little.
You just need to use as many characters needed to represent the data.
Then the remaining bits going to the most significant of the last character.
Whatever bits aren't used are zeroed out and
the expectation is the system reading it will
only use the most significant bits it reads.

Take the example from before where `Hello` was encoded from UTF-8.
There there's no need for **implicit padding**,
it will always decode cleanly into 5 bytes.
But say you needed to store this into 48-bits or 6 bytes,
then you'd need to zero out the last 8 bits.
The decoder expecting 48-bits would then just ignore the trailing bits.

>**TODO:** Add an example of implicit padding.
>Needs better explanation.

### Explicit Padding

Now because Base32 doesn't cleanly divide into 8-bit bytes,
there will be many cases where a decoder doesn't know the length of the data.
So you'll need padding to express that the data is partially represented by
the full Base32 encoded string when decoded.

Examples are usually best to make this point clear.
Let's take another example, a 6 letter word `foobar`.
I liked how [Piotr Chmolowski explained this][b32-exp-piotr].

For every character of `foobar`, up to `fooba`,
every situation of padding is encountered as bytes are concerned.
There's a situation where you're left with
no extra bits to partially encode in a 40-bit block.
Then there's the situation where you're left with 30 bits of padding,
20 bits, 15 bits and 5 bits of padding.

That pattern seems a bit unintuitive at first,
but the example below will make it clearer.

```plaintext
BASE32("")       = ""
BASE32("f")      = "MY======"
BASE32("fo")     = "MZXQ===="
BASE32("foo")    = "MZXW6==="
BASE32("foob")   = "MZXW6YQ=" (5 bits of padding)
BASE32("fooba")  = "MZXW6YTB"
BASE32("foobar") = "MZXW6YTBOI======"
```

There last base32 character,
before the padding character in each example,
will have some bits on the least significant side zeroed out as
there's no data to encode.
So to decode the data to the correct length,
the `=` sign is used to show 5 bits for each pad character needs to be added.
Then the decoder knows the real message ends somewhere on the bit of
the last non-padding character of the 40-bit block.

Doing out the `foobar` example in binary helps explain this better:


```plaintext
Input String:  'f'      'o'      'o'      'b'       'a'       'r'
UTF-8 byte: 01100110  01101111 01101111 01100010  01100001  01110010 ________...
Splits:     |   |\    / |   |\    |\    | \  \ \    |\    \ |   |\  \ #pad starts
UTF-8 5bit: 01100 11001 10111 10110 11110 11000 10011 00001 01110 010=00 continue
B32 Decimal   12    24    23    22    30    24    19     1    14     8     = =..=
B32 RFC4648:   M     Z     X     W     6     Y     T     B     O     I     = =..=
B32 Hex:       C     P     N     M     U     O     J     1     E     8     = =..=
B32 Crockford: C     S     Q     P     Y     R     K     1     E     8     = =..=
```

As you can see, original message ends at the `r` character.
The final `I` or `8` character depending on the alphabet used,
will only uses its 3 most significant bits to encode actual input data.
Now how do we know how many pad characters to add?

Since the message is 6 characters long, or 48 bits,
we need to use exactly two 40-bit blocks to encode the data.
Two blocks of encoded data contains 80 bits of information.
Since we know foobar is 48 bits long,
that means we have 32 bits of padding to add with
2 of those being zeroed out in the last non-pad character `8` or `I`.

The information shared by those pads is that out of an integer collection of
40 bit blocks, which is what Base32 encodes,
this many `=` characters hold no information.


References
----------

- [RFC4648][rfc4648]
- ["Base32 Encoding Explained by Chmolowski, Piotr (2023-12-17)"][b32-exp-piotr]
  - Fantastic explanation of the mechanics, one of few describing padding

<!-- Hidden References -->
[rfc4648]: https://tools.ietf.org/html/rfc4648 "RFC 4648 - The Base16, Base32, and Base64 Data Encodings"
[b32-exp-piotr]: https://ptrchm.com/posts/base32-explained/ "Base32 Encoding Explained by Chmolowski, Piotr (2023-12-17)"
