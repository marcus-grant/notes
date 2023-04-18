---
created: 2022-12-13T15:06:45.391Z
modified: 2023-04-18T12:05:40.438Z
tags: [python,dev,software,collection,data,structures,dictionary,redundant,list,comprehension]
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

## Redundant Dictionaries

Sometimes we have dictionaries store some data that we want to query in different ways.
This is well enough on small datasets, but as the dataset grows,
querying different relations in the data gets time consuming.
Take the `db` dictionary below:

```python
db = {'students': {1: 'Alice', 2: 'Bob', 3: 'Charlie'},
    'psets': {1: 100, 2: 120, 3: 130},
    'grades': {1: {1: 98, 2: 108, 3: 125}, 2: {3: 115}, 3: {3: 110}}}
```

This is a dictionary that
stores information about students, psets (problem sets) and grades.
Looking up grades by students or psets can take a lot of time in larger datasets.
We improve query times by specifying **redundant** dictionaries.
That is dictionaries that have repeated information, but in different ways.
Below we use `studentsById` and `studentsByName` to store the same information,
but ordered differently.
In `gradesByStudent` and `gradesByPset` we store the same information,
but ordered by different keys.

```python
def empty():
    return {
        'studentsById': {},
        'studentsByName': {},
        'psets': {},
        'gradesByStudent': {},
        'gradesByPset': {},
    }

db = empty()
def get(dict, key):
    if key in dict:
        return dict[key]
    else:
        return None
def add2(dict1, key1, key2, value):
    if key1 not in dict1:
        dict1[key1] = {}
    dict1[key1][key2] = value

def addStudent(db, student_id, student_name):
    db['studentsById'][studentsByName'] = student_name
    db['studentsByName'][student_name] = student_id

def addPset(db, pset_id, pset_total_points):
    db['psets'][pset_id] = pset_total_points

def addGrade(db, student_id, pset_id, points):
    add2(db['gradesByStudent'], student_id, pset_id, points)
    add2(db['gradesByPset'], pset_id, student_id, points)

print(db)

addStudent(db, 1, 'Alice')
addStudent(db, 2, 'Bob')
addStudent(db, 3, 'Charlie')

addPset(db, 1, 100)
addPset(db, 2, 120)
addPset(db, 3, 130)

addGrade(db, 1, 1, 98)
addGrade(db, 1, 2, 108)
addGrade(db, 1, 3, 125)
addGrade(db, 2, 3, 115)
addGrade(db, 3, 3, 110)

print(db)
# output:
# {'studentsById': {1: 'Alice', 2: 'Bob', 3: 'Charlie'},
#  'studentsByName': {'Alice': 1, 'Bob': 2, 'Charlie': 3},
#  'psets': {1: 100, 2: 120, 3: 130},
#  'gradesByStudent': {1: {1: 98, 2: 108, 3: 125},
#   2: {3: 115},
#   3: {3: 110}},
#  'gradesByPset': {1: {1: 98}, 2: {1: 108}, 3: {1: 125, 2: 115, 3: 110}}}
```

Now we can query the data in different ways.
First we'll look at how to query grades by problem set using `getGradesOnPset`:

```python
def getGradesOnPset(db, pset_id):
    return get(db['gradesByPset'], pset_id)
print(getGradesOnPset(db, 3))
# output: {1: 125, 2: 115, 3: 110}
```

Now we can look at problem sets without having complicated loops and function calls.

## References

* [Python Data Structures Explained in Detail (from hackr.io by Akhil Bhadwal)][py-data-structs-hackr]
* [Python for Machine Learning: Indexing and Slicing for Lists, Tuples, Strings, and other Sequential Types][py-index-slice-rails]

<!-- Hidden Reference Links Below Here -->
[py-data-structs-hackr]: https://hackr.io/blog/python-data-structures "Python Data Structures Explained in Detail (from hackr.io by Akhil Bhadwal)"
[py-index-slice-rails]: https://railsware.com/blog/python-for-machine-learning-indexing-and-slicing-for-lists-tuples-strings-and-other-sequential-types/ "Python for Machine Learning: Indexing and Slicing for Lists, Tuples, Strings, and other Sequential Types"
