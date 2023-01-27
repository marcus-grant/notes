---
created: 2022-12-13T15:06:45.391Z
tags: [python,software,dev,compsci,collection,data-structures,data]
modified: 2022-12-14T14:09:37.857Z
---
# Python Collections

Placeholder
<!-- TODO: Include indexing & slicing -->

## Indexing

## Slicing

## Looping Over a List Using Index

```python
a = [1,2,3]
b = []
for index in range(0,len(a)):
    print(f"index: {index}")
    b.append(a[index] * 2)
```

## Enumerate Over a List

Enumerating a collection is when you get both the order and values of a collection.
It's possible to use the `enumerate()` global function that takes any collection.
It will return an iterator that returns a tuple of both the index and value.

```python
a = [1, 2, 3]
b = []
for index, value in enumerate(a):
    print(f"index: {index}, value: {value}")
```

## Looping Over Dictionary key:value Pairs

Enumerating a Dictionary is functionally the same, but syntactically different.
First,
the Dictionary method `items()`
is necessary to return an iterator for the dictionary.
This iterator returns a tuple of every key and associated value in the dictionary.

```python
c = {0:1, 1:2, 2:3}
for key, value in c.items():
    print(f"key: {key}, value: {value}")
```

It's also possible to use the `keys()` method, a part of dictionaries, instead.
This is an iterator that returns every key (in order) of the dictionary.
Then you setup a loop that enumerates every value associated with said key.

```python
c = {0:1, 1:2, 2:3}
for key in c.keys():
    value = c[key]
    print(f"key: {key}, value: {value}")
```

## List Out all the Words in this Sentence

To separate strings, the `split()` string method takes a delimiter string,
which it then searches for and splits out the strings separated by that string.

```python
s = "There were many people at the theatre and the crowd cheered as the band started playing a slow waltz"
print(s.split()) # A list with every word in the sentence as an item
```

## How many Unique Words are There?

One of the best ways to test for uniqueness of a collection,
is to use another collection, sets.
Every item placed into a set collection will get stored.
It will not store any item more than once, meaning every item
within a set is unique.
They are also useful for quickly being able to check if something has occurred.
Sets store values by hashing them which is a O(1) operation vs searching
a list using a loop, an O(n) operation.

```python
mySet = set(s)
print(mySet)
```

## Using Dictionaries to Count Frequency of Occurrence

Dictionaries can store anything in a quickly searchable structure.
This is great when representing the frequency of an item in a collection.
Take the string `s` from above, there's some words that occur more than once.
Counting this is best done with a dictionary.

```python
words = {}
s_no_punctuation = replace(',', '')
for word in s_no_punctuation:
    if word in words:
        words[word] += 1
    else:
        words[word] = 1
print(words)
```

## Make a 2D List (Matrix) so it has the Numbers 0-63

```python
mat = list(range(0,64))
count = 0
def makeMatrix(a,n1,n2):
    M = []
    for row in range(0,n1):
        r = []
        for col in range(0,n2)
            r.append(a[count])
            count += 1
        M.append(r)
    return M
A = makeMatrix(mat,8,8)
print(A)
```

## Dictionary Comprehension

Comprehensions are a neat feature of python to create inline collections.
These collection comprehensions are capable of defining complex list operations.
To do this with dictionaries, within a curly bracket set,
first include the mapping of each value you want.
Then follow that by a looping statement, like `for key, value in c.items()`.
This will then setting up the looping variables to use.
And finally and optionally, a condition to filter out values.

```python
c = {0:1, 1:2, 2:3}
d = {key: value*7 for key, value in c.items() if key == 1}
print(d) # {1:14}
```

## List Comprehension

The same comprehensions are possible with lists, but inside square brackets.
Again, a comprehension consists of a mapping expression,
iteration expression and optional conditional statement.

```python
a = [1, 2, 3]
r = [item*3 for item in a if item < 3]
```

## References

* [Python Data Structures Explained in Detail (from hackr.io by Akhil Bhadwal)][py-data-structs-hackr]
* [Python for Machine Learning: Indexing and Slicing for Lists, Tuples, Strings, and other Sequential Types][py-index-slice-rails]

<!-- Hidden Reference Links Below Here -->
[py-data-structs-hackr]: https://hackr.io/blog/python-data-structures "Python Data Structures Explained in Detail (from hackr.io by Akhil Bhadwal)"
[py-index-slice-rails]: https://railsware.com/blog/python-for-machine-learning-indexing-and-slicing-for-lists-tuples-strings-and-other-sequential-types/ "Python for Machine Learning: Indexing and Slicing for Lists, Tuples, Strings, and other Sequential Types"
