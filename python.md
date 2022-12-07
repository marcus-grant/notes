---
created: 2022-11-11T11:11:00
tags: [python,py,lang,programming]
---
# Python

## For Loops

```python
names = ['Marcus', 'Christine', 'Dan', 'Joe', 'Jenny']
for name in names:
  print(name)
```

The `for-in` structure above loops through each item in a collection and
returns the individual item in the `name` variable given between `for` and `in`.
Substituting any collection or iterable given in place of `names`
achieves the same result.
This can include the `range` functino call which instead gives a number range.

```python
for num in range(1, 10):
  print(num)
```

As you can see any function call that returns a collection or
iterable *(iterable in the case of range)* can be used.
Here `range` which returns an iterable describing the numbers,
spaced by 1 whole integer by default when no third positional argument
is given from 1 to one step below the second number, in this case 9, 10 is excluded.

## Read Lines of File

If you're going to read a file with lines reperesenting an entry,
`open` is the primary function to use.
In this example from [Advent of Code][aoc22-day4] there are lines of input given.
Each line is a pair of number ranges in need of processing.

```txt
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
```

To read each line in the range, do something like this:


```python
try:
    with open(self.file_path) as file:
        for line in file:
            # Remove any whitespace
            pair_str = line.split()[0]
            pair = ShipAssignmentPair(pair_str)
            assignments.append(pair)
except IOError as e:
    print(f"ShipAssignment file open error:\n{e}")
except:
    print("Unkown Error during file ShipAssignment opening!")
finally:
    self.assignments = assignments
    file.close()
```

The `open` function takes a file path.
The `with`-`as` structure creates a closure to safely open a file then
perform some actions on the file then
close it when done.
The `try`-`except`-`finally` syntax handles any errors associated with reading or
processing the file contents.
The line, `except IOError as e`,
will raise an `IOError` exception if the file can't be opened or read.
The empty `except:` line will handle any other exceptions.
The `finally` line opens a block of code to be performed after
the file is read and processed in `assignments.append(pair)`.

The `for`-`in` loop involving the `file` object opened
will iterate every line of the `file`,
including any newline characters indicating the end of the line.
It will probably be necessary to `split()` any whitespace,
including any newline characters out, otherwise they end up in the results.

## Get Multiple Numbers from String

To extract the numbers from a string,
**in order**,
this list comprehension should suffice.

```python
txt = "h3110 23 cat 444.44 rabbit 11 2 dog"
print([int(s) for s in txt.split() if s.isdigit()])
# output: [23, 11, 2]
```

The `for s in txt.split()` sets up a loop to
get every whitespace separated substring.
Any other split delimiter could be used instead as its first argument.
Then, the `if s.isdigit()` will determine if the substring has a number.
Finally, the `int(s)` turns it into a number,
`float` could be used as well.
When the list comprehension is done,
the list `[23, 11, 2]` should be returned.

## Type Checking/Annotation

For more information check out [this handy guide][type-check-guide-rp]

## References

* [Advent of Code 2022, day 4][aoc22-day4]
* [Python Type Checking Guide (from RealPython by Geir Arne Hjelle)][type-check-guide-rp]

<!-- Hidden References -->
[aoc22-day4]: https://adventofcode.com/2022/day/4 "Advent of Code 2022, day 4"
[type-check-guide-rp]: https://realpython.com/python-type-checking/ "Python Type Checking Guide (from RealPython by Geir Arne Hjelle)"

