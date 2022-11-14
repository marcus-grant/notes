---
tags: #python, #py, #lang, #programming
---
# Python

## For Loops

```python
names = ['Marcus', 'Christine', 'Dan', 'Joe', 'Jenny']
for name in names:
  print(name)
```

The `for-in` structure above loops through each item in a collection and returns the individual item in the `name` variable given between `for` and `in`. The same thing can be done by substituting any collection or iterable given in place of `names` at the end, including the `range` function call which gives a number range.

```python
for num in range(1, 10):
  print(num)
```

As you can see any function call that returns a collection or iterable *(iterable in the case of range)* can be used. Here `range` which returns an iterable describing the numbers, spaced by 1 whole integer by default when no third positional argument is given from 1 to one step below the second number, in this case 9, 10 is excluded.
