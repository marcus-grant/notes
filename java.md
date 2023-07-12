---
created: 2023-04-05T16:14:49.295Z
modified: 2023-07-12T11:07:58.215Z
tags: [java,program,language,overview,object,orientation,pcde,module14]
---
# Java

>**NOTE**: This is combined so far between video lectures and texts.
>Reorganize it to be more coherent.

## What Is Java?

Java is a *class*-based, *object*-oriented [programming language][-lang] that
is designed to have as few platform dependencies as possible.

An important concept to understand is that Java, unlike [Python][-py],
which is only interpreted, is a compiled language.
Typically, a compiler's main functionality is to convert high-level language to
low-level language that can be understood by the machine.

Basically,the Java compiler, just like any other compiler,
does the task of translation.
In other words, a compiler translates code from
human-readable for to a platform-readable machine code.
*(Platform here refers to the operating system and the hardware architecture)*.

The Java compiler does not translate Java *classes* directly to machine code.
Rather, it converts the Java *classes* called bytecodes by
generating files with the `.class` file extensions.
This bytecode is created for a virtual platform,
the Java Virtual Machine (JVM).

First, the bytecode verifier in the JVM checks the bytecode.
Then, the JVM converts the bytecode to machine-readable code.

This explains how Java achieves its platform independence.
Since the JVM converts the bytecode to a machine specific code,
there are different JVMs for different platforms.

## What Are Data Types in Java and How Do they Differ?

Every time that a variable is used within your code,
the compiler must know how to interpret and use the variable's data.
Java programming, by design,
has set data types to avoid undesired errors when processing data.
This is why Java is referred to as a *strongly typed* language.
This also means a variable's type cannot change once it has been declared,
unlike other languages, such as Python.

For example, consider that you're writing a simple *function* that,
given two integers, calculates the average.

```java
average = (a + b) / 2;
```

Ask yourself:
What should happen if either `a` or `b` are note of type integer?
What if they are a *float*, *double*, or even a *string*?
Java solves this by having strict data typing rules.
Unlike Python and other languages, in Java,
you must declare variable's data type, as it is instantiated?

The eight primitive data types in Java are shown in this table:

| Data Type | Size    | Description                                |
| --------- | ------- | ------------------------------------------ |
| Byte      | 1 Byte  | Whole numbers: 128                         |
| Long      | 8 Bytes | Large whole numbers: -9.223E18 to 9.223E18 |
| Float     | 4 Bytes | Decimal numbers: Stores 6 or 7 decimals    |
| Double    | 8 Bytes | Decimal numbers: Stores 15 decimal digits  |
| Boolean   | 1 BIT   | True or false                              |
| Char      | 2 Bytes | *E.g*, `A`, `4`, `#`, etc.                 |
| Short     | 2 Bytes | *E.g* -32 768 to 32 767                    |
| Int       | 4 Bytes | *E.g* -2.147E9 to -2.147E9                 |

## What is Casting?

Casting is a technique used in Java, and in Python as well,
to change a variable's data type.
If a *string* needs to be converted into an integer,
the *string* will need to be casted as an int, as show below.

```java
String stringnumber = "12";
Int number = Integer.valueOf(stringnumber);
```

**NOTE**: It is possible to do the same conversion from an integer to a string by
using the code below:

```java
String.valueOf([integer]);
```

## Data Type Hierarchy

In Java, there is a specified hierarchy of data types when performing math operations.
One common rule of Java is that the result of a math operation will
always inherit the most precise data type used within the equation.

For example, when taking the sum of a *double* and an *integer*,
the result will always be a *double*.
When dividing two integers,
the answer will always result in an integer.

This may seem counterintuitive at first, but it is one of the many quirks of Java.

To see this in practice, try this out below:

* `2 / 3 = 0`
* `0 / 3 = 0.666667`
* `0 / 3.0 = 0.666667`

## Classes vs Objects in Java

Java *classes* and *objects* go hand in hand and are often misused in conversation.
To get a better understanding of the differences,
think of a class as a recipe and an *object* as the completed dish.

*Classes* are what you, the programmer, write out and set characteristics for.
Like a recipe, each *class* can have required ingredients;
these are a *class*'s variables and construction parameters.
The recipe will also have instructions on how to use these ingredients;
these are *methods* within the class that utilize the variables.

*Objects* resemble a finished dish.
*Objects* are instances of a predefined *class* within a program.
After writing a recipe,
the chef will send out copies to all their friends,
whi will then go and make their own instances of
that recipe and use it to feed their families.

## How Classes and Objects Are Used in Java

In most cases, a completed program is going to consist of hundreds,
if not thousands, of lines of code.
If this were all written in a single Java file,
debugging and adding features would be nearly impossible.
Java solves this problem by allowing the use of *packages*.
*Packages* allow for programmers to reference certain parts of code even though
it may be outside another code's directory.
This produces one of Java's most desired features: modularity.

*Packages* allow a programmer to instantiate *classes* into *objects* within
other *classes*.
This may seem complex at first.
However, if you continue to use the recipe metaphor from above, it gets easier.

If a chef friend were to send you their cookbook,
they could simply not tell you to
make chicken and expect you to reference a specific recipe.
This is because there are most likely multiple chicken recipes within the cookbook.
In order for you to complete the task,
your friend must tell you specifically to "Cook the Pesto Chicken on page 32."
*Packages* act in a similar way.
If a programmer wishes to generate a *object*  from
a *class* and that *class* is not in the current directory,
then the programmer must provide a location to look for the *class*.

This is done by using the `import` keyword at the beginning of the code.
Once a *package* is imported, the *classes* within the *package* can now be used in
the current scope, as they are defined within the new *class* itself.

## OpenJava

OpenJava was the first open source implementation of the Java language and
it is associated with the many components of the Java platform:
the Java Virtual Machine (OpenJVM), the Java Class Library (OpenJCL),
the Java Development Kit (OpenJDK) and the Java Runtime Environment (OpenJRE).

## Basics

### Compiling & Running

To compile a java program, use the `javac` command.
To run a java program, use the `java` command.

```bash
javac Hello.java
java Hello
```

### Import

Importing modules is done with the `import` keyword.
The `java.io` package provides for system input and output
In Java the program file name must match the specific class name.

```java
import java.io.*;

public class Hello {
  public static void main(String[] args) {
    System.out.println("Hello World!");
  }
}
```

Here we're just using `System.out.println` to print to the console.
The `System.out` is a static member of the `System` class, imported from `java.io`.

## Data Types

Let's write a program that looks at the basic datatypes.
There's:

* `Boolean`: `true` or `false`
* `Byte`: 8-bit signed integer
* Integer types: `short`, `int`, `long`
* Floating point types: `float`, `double`
* `Char`: 16-bit Unicode character

Let's try using these with a program to convert Fahrenheit to Celsius.

```java
public class Fahrenheit {
  public static void main(String[] args) {
    for (int f = 0; f <= 150; f+= 10) {
      System.out.println(f + " " + (f - 32) * (5.0 / 9.0))
    }
  }
}
```

Here we're using a `for` loop to iterate over the range of temperatures.
It uses the `int` type to iterate a `for` loop and to subtract 32 from the
current temperature.
The `5.0 / 9.0` is a `double` type.
The `System.out.println` method takes a `String` and a `double` as arguments.
If the `5.0 / 9.0` was an int by rewriting as `5 / 9`,
you'd get all 0's for the result because the `int` division truncates the result.
These are the things that need to be considered in strongly typed languages.

## Classes and Objects

Java is known as a **object-oriented** language.
They describe how different kinds of objects relate to each other and
how they can interact through functions and data.

### Private Members

When an object is created, it is said to be an *instance* of a class.
The **parent** class is the class from which the object is derived.
You may not want to expose the internal workings of the class to the outside world.
This is where the keyword `private` comes in.

**Private inheritance** is a way to hide the implementation details of a class.
It means that whoever inherits from the class cannot access the private members.
You'll have to define **public** methods to access the private members.

```java
// ./Person.java
public class Person {
  // private variable
  private String name;

  // constructor
  public Person(String name) {
    setName(name);
  }

  // getters & setters
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
}
```

As you'll see the **private variable** `name` is seemingly accessible to
the `getName` & `setName` methods, which are **public**.
That means to any instance of the `Person` class, the `name` variable is
unable to access the `Person.name` variable directly,
but thanks to `getName` & `setName` it can be accessed indirectly.
These kinds of functions are called **accessors** or
**setters & getters**.

```java
// ./Consumer.java
import java.io.*;

public class Consumer {
  public static void main(String[] args) {
    Person p = new Person ("Peter Parker");
    System.out.println(p.getName())
  }
}
```

When `p` is instantiated, the `Person` constructor is called,
which calls the `setName` method to set the name to "Peter Parker".
Then the `getName` method is called to print the name to the console,
showing the name is "Peter Parker" and is accessible to the `Consumer` class,
but not the variable that stores that name.

Also note that `Person` was imported from the `java.io` package.
This is because the two java files, the `Person` class and the class consuming it
are in the same directory.

## Packages

In the previous example of `Person` and `Consumer`,
those different classes were broken up into different files, or packages.
To simplify development by improving code reuse, readability and maintainability,
packages are used to group related classes.

In this example file tree below, the `Person` class is in the `person.java` package,
And the `Consumer` class is in the `consumer.java` package and
their contents are are the same as before. Here is the file tree.

```bash
$ tree
.
├── University
│   └── person.java
└── consumer.java

2 directories, 2 files
```

One modification to the `consumer.java` file allows it to
import the `Person` class from the `University` package by
adding one line near the top to `import` it.

```java
import java.io.*;
import University.Person;

public class Consumer {
  public static void main(String[] args) {
    Person p = new Person ("Peter Parker");
    System.out.println(p.getName());
  }
}
```

To import classes from a package, you need to use the `import` keyword.
Then relative to the current directory, you need to specify the package name.
In this case, the package name is `University` and the class name is `Person`.
So the **import** statement becomes `import University.Person`.

## Java Containers

Setting up a java development environment can be quite a pain.
Fortunately java [containers][-container] can really help simplify things.
There's tons of lightweight java containers available.
These days, unless specific reasons exist usually due to enterprise needs,
the [OpenJava](#java-containers) stack is the best choice.
Here is a link to the [official OpenJDK container][openjdk-docker-reg].

It is a highly stripped down linux environment within the container,
so you will likely want to add some tools to it.
Maybe a text editor to edit code or configuration files in
the [shell of the container][-shell].
This could include the [nano editor][-nano] or [vim editor][-neovim].
Edit the container's `Dockerfile` to add the tools you need.

```dockerfile
FROM openjdk:11-jdk-slim
RUN apt-get update && apt-get install -y \
    nano \
    vim \
    neovim # \
    # any other tools you need...
```

Then run the container and ssh into it or attach to it.

```bash
docker run -it -rm --name openjdk11 openjdk:11-jdk-slim
```

## References

### Web Links

* [OpenJDK Container (from hub.docker.com)][openjdk-docker-reg]

<!-- Hidden References -->
[openjdk-docker-reg]: https://hub.docker.com/_/openjdk "OpenJDK Container (from hub.docker.com)"

### Note Links

* [Programming Language][-lang]
* [Containers (Software)][-container]
* [Nano Editor][-nano]
* [Neovim Editor][-neovim]
* [Shell (OS)][-shell]
* [Python][-py]

<!-- Hidden References -->
[-lang]: programming-language.md "Programming Language"
[-container]: container.md "Container (Software)"
[-shell]: os-shell.md "Shell (OS)"
[-nano]: nano-editor.md "Nano Editor"
[-neovim]: neovim.md "Neovim Editor"
[-py]: python.md "Python"
