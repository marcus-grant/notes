---
created: 2023-01-25T10:18:45.000+01
modified: 2023-01-25T10:18:45.000+01
tags: [regex,regular,expression,pattern,matching,pcde,module5,data,sql,query,programming]
---
# Regular Expressions Overview (RegEx)

## Overview

*Taken from [Wikipedia, the free encyclopedia][regex-wiki]*
>A regular expression (shortened as regex or regexp;
>sometimes referred to as rational expression)
>is a sequence of characters that specifies a search pattern in text.
>Usually such patterns are used by string-searching algorithms for
>"find" or "find and replace" operations on strings, or for input validation.

## Basic Syntax

In this example RegEx:

```regex
/([A-Z])\w+/g
```

There's a lot of dense syntax here,
let's list it out:

* The 1st `/` *starts* the RegEx
* The last `/` *ends* the RegEx
* The final characters, like `g`, are flags
  * `g` means a *global* flag
    * It will find the pattern everywhere, not just the first occurrence
  * Other flags exist that will be outlined later
    * These other flags often depend on the software using it
* The `()` parentheses define a *capture group*
  * They get used to group several matching tokens together
  * In this case they enclose...
* `[]`, a *character set*, which matches any character in the set within
  * Inside these brackets characters to match can be defined
  * This includes the above example's...
* `A-Z` *range*, which matches a character in range `A` to `Z` separated by `-`
  * `A` to `Z` has an ASCII & UTF character code 65 to 90 in decimal, in order
  * Ranges can be specified for characters and numbers
  * Case sensitive so a separate *range* is needed for lower case
* `\W` is a special token representing a *word*
  * Matches any word character (alphanumeric & underscore)
  * There's several other special tokens like this that will get detailed later
* `+` is a *quantifier* to match *1 or more* of the preceeding tokens (*words*)

### Further Exploration

This example can be explored in detail because
it is the default Regex pattern in [RegExr.com][regexr.com].
There there's an interactive playground of text and RegEx patterns.
It gives a more visually easy to discern explanation of this pattern.
The web app can also be used to test or practice different patterns and
look up reference material on the subject of regular expressions.

## Character Classes

Here are some character classes to help in making RegEx selections.
These will help with defining what characters get matched.

| Character classes           | Example                                                     |
| --------------------------- | ----------------------------------------------------------- |
| `\d` any digit              | +**1**- (**444**) -**555**-**1234**                         |
| `\D` not a digit            | **+**1**- (**444**) -**555**-**1234                       * |
| `\s` space                  | glib jocks vex dwarves!                                   * |
| `\S` not space              | **glib** **jocks** **vex** **dwarves!**                     |
| `\w` any character          | **glib** **jocks** **vex** **dwarves!**                     |
| `\W` any character          | glib jocks vex dwarves!                                   * |
| `.` characters except `\n`  | **glib jocks vex dwarves!**                               * |
| `[aeiou]` characters in set | gl**i**b j**o**cks v**e**x dw**a**rv**e**s!                 |
| `[^aeiou]` negated set      | **gl**i**b** **j**o**cks** **v**e**x** **dw**a**rv**e**s!** |
| `[g-s]` characters in range | abcdef**ghijklmnopqrs**tuvwxyz                              |

>**Note**: Any row above with the `*` footnote indicate
> spaces `` are being matched as well.
>They don't get picked up with **bold** markings.

### Anchors

| Anchors                 | Example | Result                              |
| ----------------------- | ------- | ----------------------------------- |
| `^` beginning           | `^\w+`  | **she** sells seashells             |
| `$` end of string       | `\w+$`  | she sells **seashells**             |
| `\b` word boundrary     | `s\b`   | she sell**s** seashell**s**         |
| `\B` not word boundrary | `s\B`   | **s**he **s**ells **s**ea**s**hells |

The first two rows above show anchors relating to
the end and beginnings of strings.
The second two are anchors related to the *boundraries* of words.
*Boundraries* are any characters that
end a word like whitespace or punctuation.

### Qualifiers and Alteration

| Quantifiers & alternation            | Example     | Result                                  |
| ------------------------------------ | ----------- | --------------------------------------- |
| `+` 1 or more of previous            | `b\w+`      | b **be** **bee** **beer** **beers**     |
| `*` 0 or more of previous            | `b\w*`      | **b** **be** **bee** **beer** **beers** |
| `{1,3}` 1 or more of previous        | `b\w{2,3}`  | b be **bee** **beer** **beer**s         |
| `?` 0 or more of previous (optional) | `colou?r`   | **color** **colour**                    |
| `?` 0 or more of previous (lazy)     | `b\w+?`     | b **be** **be**e **be**er **be**ers     |
| `|` or                               | `b (a|e|i)` | **bad** bud bod **bed** **bid**         |

In the first two qunatity matchers `+` & `*` you can see how
the `+` won't select the `b` alone, it needs a `\w` or word character to follow.
The `*` will select all words because they all start with `b` and
because it selects 0 or more it selects the lone `b` as well.

The `{1,3}` curly braces sets the number of matches of a character we want.
In the example it wants a `b` followed by any word character from
two to three occurrences.

The `?` quantifier makes the preceeding character *optional*.
By specifying `colou?r` you can check for
the Brittish & American pronounciation of color.
The `u` becomes optional because it is followed by `?`.
It also can be used as a lazy alternation where

## Regular Expression Patterns

Let's see how we apply these patterns.

## References

### Web Links

* [RegExr: A Regular Expressions Playground & Teaching Tool][regexr.com]

<!-- Hidden References -->
[regexr.com]: https://regexr.com/ "RegExr: A Regular Expressions Playground & Teaching Tool"

### Note Links

* [Regular expression (from Wikipedia, the free encyclopedia)][regex-wiki]

<!-- Hidden References -->
[regex-wiki]: https://en.wikipedia.org/wiki/Regular_expression "Regular expression (from Wikipedia, the free encyclopedia)"

### Referenced By

* [PCDE Course Overview][pcde-overview-zk]
* [Structured Query Language (SQL)][sql-zk]

<!-- Hidden References -->
[pcde-overview-zk]: ./pcde-course-overview.md "PCDE Course Overview"
[sql-zk]: ./sql.md "Structured Query Language (SQL)"
