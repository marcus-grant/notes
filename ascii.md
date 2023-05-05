---
created: 2023-05-05T11:27:00.102Z
modified: 2023-05-05T12:27:13.000Z
tags: [ascii,encode,character,symbol,standard,information,data]
---
# American Standard Code for Information Interchange (ASCII)

## Introduction

**ASCII**, abbreviated from **American Standard Code for Information Interchange**,
is a character encoding standard for electronic communication.
ASCII codes represent text in computers, telecommunications equipment,
and other devices.
Because of technical limitations of computer systems at the time it was invented,
ASCII has just 128 code points, of which only 95 are printable characters,
which severely limited its scope.
Many computer systems instead use [Unicode][-unicode],
which has millions of code points,
but the first 128 of these are the same as the ASCII set.

## Encoding

ASCII encodes 128 specified characters into seven-bit integers,
commonly with the Most Significant Bit (MSB, "leftmost") set to zero and
the least significant 4 bits counting up sections of the characters set.

### Encoding Chart

| LSB Hex (=>MSB) | 0x0 | 0x1 | 0x2 | 0x3 | 0x4 | 0x5 | 0x6 | 0x7 |
| :-------------- | --- | --- | --- | --- | --- | --- | --- | --- |
| B0000, 0x0      | NUL | DLE | SP  | 0   | @   | P   | \`  | p   |
| B0001, 0x1      | SOH | DC1 | !   | 1   | A   | Q   | a   | q   |
| B0010, 0x2      | STX | DC2 | "   | 2   | B   | R   | b   | r   |
| B0011, 0x3      | ETX | DC3 | \#  | 3   | C   | S   | c   | s   |
| B0100, 0x4      | EOT | DC4 | $   | 4   | D   | T   | d   | t   |
| B0101, 0x5      | ENQ | NAK | %   | 5   | E   | U   | e   | u   |
| B0110, 0x6      | ACK | SYN | &   | 6   | F   | V   | f   | v   |
| B0111, 0x7      | BEL | ETB | '   | 7   | G   | W   | g   | w   |
| B1000, 0x8      | BS  | CAN | \(  | 8   | H   | X   | h   | x   |
| B1001, 0x9      | HT  | EM  | \)  | 9   | I   | Y   | i   | y   |
| B1010, 0xA      | LF  | SUB | \*  | :   | J   | Z   | j   | z   |
| B1011, 0xB      | VT  | ESC | +   | ;   | K   | \[  | k   | {   |
| B1100, 0xC      | FF  | FS  | ,   | \<  | L   | \   | l   | \|  |
| B1101, 0xD      | CR  | GS  | -   | =   | M   | \]  | m   | }   |
| B1110, 0xE      | SO  | RS  | .   | \>  | N   | ^   | n   | ~   |
| B1111, 0xF      | SI  | US  | /   | ?   | O   | _   | o   | DEL |

## Relationship to UTF-8

The first 128 characters of Unicode, which correspond one-to-one with ASCII,
are encoded using a single octet with the same binary value as ASCII.
Because ASCII only uses 7 of the 8 bits in a byte,
that extra leading bit is always zero in both ASCII and
the first code page of UTF-8.
In UTF-8, when the first byte of a code point is one,
the number of ones in the first byte indicates the total number of bytes and
you can start to use the full capacity of unicode.

## References

### Web Links

* [ASCII (from Wikipedia, the free encyclopedia)][wiki-ascii]

<!-- Hidden References -->
[wiki-ascii]: https://en.wikipedia.org/wiki/ASCII "ASCII (from Wikipedia, the free encyclopedia)"

### Note Links

* [Unicode (and UTF-8)][-unicode]

<!-- Hidden References -->
[-unicode]: unicode.md "Unicode (and UTF-8)"
