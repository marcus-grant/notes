---
created: 2022-12-06T11:00:00
tags: [python,intro,dev,software,compsci,langs]
---
# Introduction to Python

## About these Notes

These are the introductory concepts to the programming language [python][python-overview-zk].
In these notes there will be concepts that
the [PCDE course by MIT xPRO][pcde-overview-zk] addressed.

## Data Types

All variables in python are dynamic, but python does offer some primitives.
There's `int`, `bool`, `float`, and `str` operates in a kind of fuzzy area.

It's possible to cast these into each other using their constructors.
For example:

```python
a = 3
b = str(a)
c = 7.4
d = int(c)
print(a) # Prints a number 3
print(b) # Prints a string, 3 as it's casted to a str
print(c) # Prints a float 7.4
print(d) # Prints an int casted float,
# ie it will round down to nearest int
```

### Bools

Boolean, or `bool` values are any `True` or `False` value.
The values `True` or `False` lead to a variable to become
a `bool` type when they're assigned.
This is also true for `bool`ean expressions.

```python
print(True + True + False) # prints '2'
```

The above expression prints out the number 2.
This is because True gets cast to 1 and then 1 plus 1 is 2.
The `False` becomes 0 so doesn't affect the sum.

### Boolean Expressions

Boolean results follow basic logical expressions as return values.
These expressions include:

<!-- TODO: Turn into table -->
| Symbol | Operation                                          |
| ------ | -------------------------------------------------- |
| `==`   | Equal                                              |
| `!=`   | Not Equal                                          |
| `>`    | Greater than                                       |
| `>=`   | Greater than or equal to                           |
| `<`    | Less than                                          |
| `<=`   | Less than or equal to                              |
| `and`  | True if both sides of expression are True          |
| `or`   | True if one of the sides of the expression is True |
| `not`  | Logical Inverse                                    |
| `in`   | Whether something is inside something to the right |
| `is`   | Whether two objects are the same                   |

### Ints

Integers, or `int`s are primitive types that express only whole numbers.
It's possible to assign variables to literal `int`s.
It involves typing any number after assignment **with no decimal point**.
To cast an `int` simply invoke its constructor `int()` on a variable or literal.
This works on floats and even booleans, but booleans become `1` or `0`.

### Floats

Floats,
or `float` are [floating point numbers][float-point-wiki],
that can take really small fractional values or really large values by
expressing numbers akin to scientific notation with exponents and decimals.

It's posisible to cast floats from `ints` using the `float()` constructor.
The decimal value gets assumed to be `0`.
When casting from `bool` values to `float` a variable becomes `1.0` or `0.0`.
This also applies to when using numeric operators like `+` or `-` on `bool`s.

Number literals with a decimal point get cast to `float`s automatically.

### Strings

Strings are a bit different.
They get treated as both primitives like the previous types.
They also get treated like [collections][py-collection-zk]
which will get covered later.
But most importantly, they get access to some operators found only
with collection objects like lists.

Template strings are possible to cast variables into strings.
Just use `f"({x}, {y})"` to represent the variables x = 2 y = 3 as
`(2, 3)`.

Raw strings are another kind of special string template literal.
Any string beginning with `r` becomes raw strings where everything parses.
The string `r"blah\n\\"` doesn't omit the escape characters.

### Replace

Using the `s.replace(old_str, new_str, count)` function replaces
specified occurrences of the string of the method call with another;
in this case `new_str` replaces `old_str` in the string `s`.
The `count` parameter specifies optionally how many occurrences of
the old value to replace, it defaults to all.

### Case Transform

The `swapcase()` method for strings replaces all lower case with
upper case letters and vice-versa.
The `upper()` method of strings will change a string to all uppercase.
And `lower()` does the same, but lowercase.

### Accessing and Slicing Strings

Strings can use bracket operators `[` & `]` are usable on strings.
This means `[index]` can access single characters in a string by its `index`.
Also string slices are accessible using bracket slice operators.
A `start`, `stop`, `step` parameter gets used like `string[start:stop:step]`
to grab a slice of the string.

*Please note*, the `stop` parameter is exclusive,
thus the value before that index is the last item in the slice.
Also, the `step` parameter defaults to `1` when not included.

## Operators

### Arithmetic Operators

Python arithmetic operators follow the standard order of operations.
Below are all the valid binary arithmetic operators available.

| Symbol | Operation                         |
| ------ | --------------------------------- |
| +      | Addition                          |
| -      | Subtraction                       |
| *      | Multiplication                    |
| /      | Division                          |
| **     | Exponentiation                    |
| //     | [Floor Division][floor-ceil-wiki] |
| %      | [Modulo Division][modulo-op-wiki] |

Strings can use the `+` operator to concatenate strings.
The `*` operator used on a string concatenates the string many times.

## Collections

Covered in detail in the [python collection notes][py-collection-zk].

## References

* [Floating Point Architecture (by Wikipedia, the free encyclopedia)][float-point-wiki]
* [Floor and Ceiling Functions (by Wikipedia, the free encyclopedia)][floor-ceil-wiki]

### Note Links

* [Python Overview Notes][python-overview-zk]
* [Professional Certification of Data Enginering by MIT xPRO Course Overview (Backlink)][pcde-overview-zk]
* [Python Collections][py-collection-zk]
* [Modulo Operation (by Wikipedia, the free encyclopedia)][modulo-op-wiki]

<!-- Hidden Reference Links Below Here -->
[python-overview-zk]: ./python.md "Python Overview Notes"
[pcde-overview-zk]: ./pcde-course-overview.md "Professional Certification of Data Enginering by MIT xPRO Course Overview"
[float-point-wiki]: https://en.wikipedia.org/wiki/Floating-point_arithmetic "Floating Point Architecture (by Wikipedia, the free encyclopedia)"
[py-collection-zk]: ./python-collections.md "Python Collections"
[floor-ceil-wiki]: https://en.wikipedia.org/wiki/Floor_and_ceiling_functions "Floor and Ceiling Functions"
[modulo-op-wiki]: https://en.wikipedia.org/wiki/Modulo_operation "Modulo Operation (by Wikipedia, the free encyclopedia)"
