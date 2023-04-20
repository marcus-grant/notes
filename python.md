---
created: 2022-12-05T16:17:20.340Z
modified: 2023-04-20T14:51:17.617Z
tags: [python,lang,program,overview,language,software,develop]
---
# Python (Programming Language)

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
This can include the `range` function call which instead gives a number range.

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

If you're going to read a file with lines representing an entry,
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
    print("Unknown Error during file ShipAssignment opening!")
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

## Classes

### Basics

A Python **class** is a template for creating new object types.
To do so, use they *keyword* `class` followed by the name of the class and a colon.

```python
class Contact:
    a = 5

my_contact = Contact()
```

The variable `a` is a class variable set to 5.
Creating an object of this **class** is done by calling the class name as a function.
This is known as a **constructor** and each class can have one.
Calling the **constructor** for `Contact` and
assigning it to the variable `my_contact` creates an object of the class `Contact`.
Then to access the class variable `a` of the object `my_contact` do this:

```python
print(my_contact.a)
# Output: 5
```

This was a very basic class, let's update it to be more complex.

```python
class Contact:
    def __init__(self, name, email):
        self.name = name
        self.email = email
    
    def shout(self):
        print(self.name)

p1 = Contact("Mary", "mary@mit.edu")
p1.shout() # Output: Mary
```

Pay attention to the `__init__` function.
The underscore characters typically indicate a special function in Python.
The underscores are also known as *dunder* or *double underscore*.
The **constructor** function that gets called to
create a `Contact` object is actually calling the `__init__` function to
set up the members of the object before the reference to that object is returned.

The `self` parameter is a reference to the object itself.
The `__init__` function must always have `self` as its first parameter.
Python will automatically pass the reference to the object as the first argument.
This allows us to assign values to the object's members using the dot operator.
Which we do by taking the `name` and `email` parameters and assigning them to
the `name` and `email` members of the object.

The `shout` function is known as a **method**,
or a function that is a member of a class.
They should always have `self` as their first parameter just as the **constructor**.
Because they are members of a class,
they can access the specific properties of the object they are called on.
Which is why when `p1.shout()` is called,
the `self.name` member of the object `p1`, or `Mary` gets printed.

## Unpacking Operator

The **unpacking operator** `*` can be used to unpack a list or tuple.
Also known as the *destructure operator*.
It will take the elements of a list or tuple and
assign them to the variables on the left of the operator as if
they are individual variables.
Let's look at what happens without the unpacking operator.

```python
a = [1, 2, 3]
print(a) # Output: [1, 2, 3]
```

As expected, the list `[1, 2, 3]` is printed.
If you want to **unpack** the list into individual variables,
you can use the `*` operator ahead of the collection variable.

```python
a = [1, 2, 3]
b, c, d = *a # Each element of a is assigned to b, c respectively
print(*a) # Output: 1 2 3
```

Where this is useful is when you want a single part of the collection.
Say you want only the first part,
you can manually destructure the first part and then have a destructure operation
assign the rest of the list to a variable.

```python
a = [1, 2, 3]
X, *rest = a # X gets the first element, rest gets the rest
print(X) # Output: 1
print(rest) # Output: [2, 3]
```

It's also useful to combine elements of two collections into a single collection.

```python
a = [1, 2, 3]
b = [4, 5, 6]
c = [*a, *b] # Combine the elements of a and b into a single list
print(c) # Output: [1, 2, 3, 4, 5, 6]
```

This will *destructure* the elements of `a` and `b` and when assigned as
the first and last parts of the list respectively,
the elements in `a` are put before the elements in `b`.

>**NOTE:** the *unpacking operator* ***only*** *destructure*  to lists.
>If you have a tuple to *destructure*,
>the rest of the elements will be a list.

```python
a = (1, 2, 3)
X, *rest = a # X gets the first element, rest gets the rest as a list
print(X) # Output: 1
print(rest) # Output: [2, 3]
```

## Advanced Function Arguments

### Unnamed Arguments

**Unnamed arguments** are arguments that are passed to a function without a name.
This is the typical way to pass arguments to a function and
has already been covered.
**Unnamed arguments** are also known as *positional arguments*.
*Positional* because the arguments are referenced by
their position in the function call.
They have a name within the function,
but that name is not used when calling the function.

```python
def add(a, b):
    return a + b
print(add(1, 2)) # Output: 3
```

As should be clear already,
`add` adds the two *positional arguments* `1` and `2` and returns `3`.
If we wanted to reorder them or refer to the arguments by *name*,
we use **named arguments**.

### Arbitrary Arguments

Using the `*args` **unpacking operator**,
we can pass any generic number of arguments to a function.
These are not *keyword arguments*,
but rather arbitrary arguments that get handled according to the function logic.

```python
def add(*args):
    total = 0
    for arg in args:
        total += arg
    return total
print(add(1, 2, 3, 4, 5)) # Output: 15
```

As you can see,
the number of arguments passed to `add` is arbitrary.
The **unpacking operator** in the typical `*args` syntax,
which is a convention and not a requirement,
will take the arguments and put them into a list.
Then the loop just goes through all of them and adds them together.

Like *unnamed arguments*, or *positional arguments*,
these are positional as well,
but are treated as an arbitrary list of them when called.
This is also different from just passing a list to the function,
because you're still calling the function with commas separating the arguments.

## Named Arguments

**Named arguments** or **keyword arguments** are arguments that
are passed to a function with a name.
By convention, these are known as `kwargs` or `**kwargs`.
Note the double **unpacking operator** `**` in the syntax.
This syntax is there to deal with the *dictionary like nature* of **keyword arguments**.
They're *named* so dealing with them is a bit like working with dictionaries.

```python
def add(*args, **kwargs):
    total = 0
    for arg in args:
        total += arg
    for key, value in kwargs.items():
        total += value
    return total
print(add(1, 2, 3, 4, 5, a=6, b=7, c=8)) # Output: 36
```

You pass arbitrary named arguments using the `key=value` syntax inside
the function call parentheses.
The **unpacking operator** `**kwargs` will take the arguments as if
they were dictionary key value pairs.
So calling `kwargs.items()` will return a list of tuples,
where the first element is the key and the second element is the value.
This allows us to iterate through them and include them in the total.

Also note you can have both **unnamed arguments** and
**named arguments** together in the same function call.
By convention, **unnamed arguments** or `*args` are always listed first.

### Further Reading

Real Python has a [great article][real-py-args-kwargs]
covering all of the different ways to pass arguments to functions.

## Closure

### Wrappers

Functions that **wrap** other functions are called **decorators**.
To demonstrate why you might want to *wrap* a function using a **decorator**,
let's see an example without **decorators**.

```python
def hello():
    return "Hello World!"

print(hello()) # Output: Hello World!
```

Simple function,
it merely returns the string `"Hello World!"`.
Let's say you wanted to expand on the functionality of this function.

```python
def wrapper(func):
    greeting = "Wrapper says "
    return f"{greeting} {func()}!!!"

print(wrapper(hello)) # Output: Wrapper says Hello World!!!!
```

The `wrapper` function takes a function as an argument and
returns a template string with the function call of the function passed in.
So the result of the print statement is the string `"Wrapper says Hello World!!!!"`.

### Decorators

**Decorators** are a bit more elegant than *wrappers*.
**Decorators** are functions that take a function as an argument,
and return a function.
Let's try this example.

```python
def hello():
    return "Hello World!"

def my_deco(func):
    def wrapper():
        greeting = "Wrapper says "
        return f"{greeting} {func()}!!!"
    return wrapper

my_hello = my_deco(hello)
print(my_hello()) # Output: Wrapper says Hello World!!!!
```

It might be hard to see the elegance of this approach,
but it's a bit more concise and easier to read when you know what's going on.
The `my_deco` function takes a function as an argument,
and returns a function.
The returned function is the `wrapper` function.

The `wrapper` function takes no arguments,
but is within the scope of the `my_deco` function so it can access the `func` argument.
The `wrapper` function returns a string with the `func` argument called.
The `my_deco` function returns the `wrapper` function.

The `my_hello` variable is assigned the return value of the `my_deco` function when
it's called with the `hello` function as an argument.
The resulting function `my_hello` is then called and prints the string
`"Wrapper says Hello World!!!!"`.

>**Note** that the `wrapper` *wrapper* function is not called directly.
>Rather it gets defined and returned by the `my_deco` function with
>all of the scope of the `my_deco` function **enclosed** in it.
>**Closures** are a bit beyond the scope of this tutorial,
>but they expand on **decorators** and **wrappers** in a really useful way.

To further illustrate how **decorators** add functionality to functions,
let's try another example, this time with the *arbitrary* *named* and
*unnamed arguments* from before.

```python
def add(*args, **kwargs):
    result = 0
    for arg in args:
        result += arg
    for k, v in kwargs.items():
        result += v
    return result

def my_deco(func):
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return f'my decorated result: {result}!!!'
    return wrapper

my_add = my_deco(add)
print(my_add(1, 2, 3, a=4, b=5, c=6)) # Output: my decorated result: 21!!!
```

We pass in arbitrary *unnamed* and *named* arguments to the `add` function,
just like before by using the conventional `*args` and `**kwargs` and *unpacking* syntax.
Again, the `my_deco` function takes a function as an argument,
and returns a function.
But this time the returned function is the `wrapper` function that
takes arbitrary *unnamed* and *named* arguments as well.
The `wrapper` function however still returns a template string with
the result of calling the `func` argument with the *unnamed* and *named* arguments.

>**Note** it's important to stress this,
>the `wrapper` function is still within the scope of the `my_deco` function,
>and it is merely being defined and returned, **not called**.

When `my_add` gets assigned,
`my_deco` is **decorating** the `add` function with the `wrapper` function.
In this case it's the `add` function that
takes *arbitrary named & unnamed arguments* that's being **decorated**.
So when `my_add` is called with *arbitrary* *unnamed* and *named arguments*,
those arguments get passed to the `add` function which adds them together,
then the **decorating** `wrapper` function returns the template string
`my decorated result: 21!!!` with `21` being the result of the `add` function.

### Decoration Syntax

There's an even more elegant way to **decorate** functions.
The `@` symbol, along with a function signature,
is used to **decorate** whatever function is below it.
Let's rework the previous example to show how much cleaner the code is:

```python
def my_deco(func):
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return f'my decorated result: {result}!!!'
    return wrapper

@my_deco
def add(*args, **kwargs):
    result = 0
    for arg in args:
        result += arg
    for k, v in kwargs.items():
        result += v
    return result

print(add(1, 2, 3, a=4, b=5, c=6)) # Output: my decorated result: 21!!!
```

This does exactly the same thing as the previous example,
but it's much cleaner and easier to read.
The `@my_deco` when **decorating** the `add` function,
will pass the function below the `@my_deco` as an argument to the `my_deco` function.
Then the same process is done for any calls of the `add` function later.

### TODO: Write about Why this Example Works

```python
def add_values(*args):
    result = 0
    for val in args:
        result = result + val
    return result

ans5a = None
ans5b = None

def my_add_values(fn, *args):
    result = f"Added decoration: {fn}"
    return result


# YOUR CODE HERE
ans5a = my_add_values(add_values(1,2,3,4,5,6,7,8,9,10))
ans5b = my_add_values(add_values(40, 60, 70, 100))
print(f"ans5a: {ans5a}\nans5b: {ans5b}")
```

### Closure

***TODO:!***

## Type Checking/Annotation

For more information check out [this handy guide][type-check-guide-rp]

## Common Libraries

One of the best things about Python is not just it's large and
practical Standard Library, but also the fact that it has
one of the largest ecosystems of libraries around.
Quickly, a *library* aka a *module* is a
reusable collection of code made for specific tasks.
It's possible to download such libraries using pip and
incorporating this code for your purposes.

### How to Import Libraries

Generally, libraries get imported at the beginning of a piece of code.
This helps avoid mistakes that make programs less time efficient.
For example, by avoiding importing a module twice.

```python
import numpy
```

### Aliasing Libraries

Another standard practice with importing libraries is *aliasing* it by
using a shorter name.
This makes code more readable and keeps the width of code files narrower.
**Note** that the Python community has evolved some standard abbreviations for
these aliases so pay attention to the ones they use in your own work.
To alias a library, simply follow up the `import` statement with
an `as` statement and then the alias for that library.

```python
import numpy as np
```

### NumPy

[NumPy][zk-numpy], short for Numerical Python,
is a library that adds support for multi-dimensional arrays, matrices and tensors.
NumPy also offers a large collection of high-level mathematical functions,
particularly in the fields of linear algebra, statistics and scientific computing.

## Statistics in Python

Python over the years has become *one of* the preferred ways that we analyze data.
Statistics is of course one of the primary ways that we look at data,
and python is full of modules that can make this easier on us.
In [the notes on statistics using python][stats-py-zk]

## Python Interaction with OS Shell

Python as a scripting language with a huge ecosystem of libraries and
built-in modules to deal with the OS,
[its shell][shell-zk] and file system make it a great scripting language to
automate tasks related to basically all things relating to the OS.

For further reading, check out the notes on
[Python Interaction with OS Shell][py-shell-zk].

## Timed Tasks

### Time Module

The `time` module is a built-in module that allows us to
get current times and dates and perform actions based on time.

```python
import time
from threading import Timer

def task1():
    print('Task 01')
    time.sleep(2)

def task2():
    print('Task 02')
    time.sleep(3)

def timed_event_loop():
    task1()
    task2()
    print(f'--- LOOP: ' + time.ctime() + ' ---')
    Timer(5, timed_event_loop).start()

timed_event_loop()
```

This example uses `threading` module's timer to sleep for 2 or 3 seconds.
The `timed_event_loop` function is called every 5 seconds.
Before that `task1` and `task2` are called who total 5 seconds of sleep time.
With this the whole task loops every 10 seconds.

## References

### Note References

* [NumPy Library Overview][zk-numpy]
* [Python args and kwargs: Demystified][real-py-args-kwargs]
* [Statistics Using Python][stats-py-zk]
* [OS Shell][shell-zk]
* [Python Interaction with OS Shell][py-shell-zk]

<!-- Hidden Reference Links Below Here -->
[zk-numpy]: ./numpy.md "NumPy Library Overview"
[real-py-args-kwargs]: https://realpython.com/python-kwargs-and-args/#conclusion "Python args and kwargs: Demystified"
[stats-py-zk]: ./statistics-python.md "Statistics Using Python"
[py-shell-zk]: ./python-os-shell.md "Python Interaction with OS Shell"
[shell-zk]: ./os-shell.md "OS Shell"

### Web/Article References

* [Advent of Code 2022, day 4][aoc22-day4]
* [Python Type Checking Guide (from RealPython by Geir Arne Hjelle)][type-check-guide-rp]

<!-- Hidden References -->
[aoc22-day4]: https://adventofcode.com/2022/day/4 "Advent of Code 2022, day 4"
[type-check-guide-rp]: https://realpython.com/python-type-checking/ "Python Type Checking Guide (from RealPython by Geir Arne Hjelle)"
