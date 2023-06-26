---
created: 2023-06-26T09:39:59.973Z
modified: 2023-06-26T10:40:03.000Z
tags: [unix,linux,operation,system,software,computer]
---
# UNIX

## Introduction

>**UNIX** is a family of multitasking,
>multi-user computer operating systems that derive from the original AT&T Unix,
>whose development started in 1969 at the Bell Labs research center by
>Ken Thompson, Dennis Ritchie, and others.
>
>In the 1990s, Unix and Unix-like systems grew in popularity and
>became the [operating system][-os] of choice for over 90% of
>the world's top 500 fastest supercomputers,
>as BSD and Linux distributions were developed through collaboration by
>a worldwide network of programmers.
>In 2000, Apple released Darwin, also a Unix system,
>which became the core of the [Mac OS X operating system][-macos],
>later renamed macOS.

## The UNIX Philosophy

The [Unix philosophy][wiki-unix-phil] is a set of cultural norms and
philosophical approaches to development of
Unix-like and [POSIX][-posix] compatible systems.
It is based on the experience of leading developers of the UNIX operating system.
Early Unix developers were important in bringing the concepts of
**modularity** and **reusability** into software engineering practices.
Over time these norms became as important and influential as the technology itself.

The Unix Philosophy emphasizes building simple, compact, clear, modular,
and extensible code that can be easily maintained and repurposed by
developers other than its creators.
The Unix Philosophy favors composability as opposed to monolithic design.

The Unix philosophy is documented by Doug McIlroy in
the [Bell System Technical Journal from 1978][unix-foreword]:

1. Make each program do one thing well.
    To do a new job, build afresh rather than complicate old programs by
    adding new "features".
2. Expect the output of every program to become the input to another,
    as yet unknown program.
    Don't clutter output with extraneous information.
    Avoid stringently columnar or binary input formats.
    Don't insist on interactive input.
3. Design and build software, even operating systems,
    to be tried early, ideally within weeks.
    Don't hesitate to throw away the clumsy parts and rebuild them.
4. Use tools in preference to unskilled help to lighten a programming task,
    even if you have to detour to build the tools and
    expect to throw some of them out after you've finished using them.

It was later summarized by Peter H. Salus in
[Basics of the Unix Philosophy][unix-philosophy-basics]:

* Write programs that do one thing and do it well.
* Write programs to work together.
* Write programs to handle text streams, because that is a universal interface.

## Unix Influence on Software

Unix has had a massive influence on how operating systems and
software tools are designed.
Notably, two popular operating systems have come from UNIX and
its design philosophies:

* [Linux][-linux]
* [macOS][-macos]

## References

### Web Links

* [Wikimedia Foundation. Wikipedia.org. "Unix". 2023-06-26][wiki-unix]
* [Wikimedia Foundation. Wikipedia.org "Unix Philosophy". Accessed 2023-06-26][wiki-unix-phil]
* [McIlroy, Doug. Bell Laboratories. Bell System Technical Journal. "Unix Time-Sharing System: Foreword". 1978-07-08.][unix-foreword]
* [Raymond, Eric S. (2004) "Basics of the Unix Philosophy: The Art of Unix Programming" (Published 2003-09-23)][unix-philosophy-basics]

<!-- Hidden References -->
[wiki-unix]: https://en.wikipedia.org/wiki/Unix "Wikipedia.org. 'Unix'"
[wiki-unix-phil]: https://en.wikipedia.org/wiki/Unix_philosophy "Wikimedia Foundation. Wikipedia.org 'Unix Philosophy' Accessed 2023-06-26"
[unix-foreword]: https://archive.org/details/bstj57-6-1899/mode/2up "McIlroy, Doug. Unix Time-Sharing System: Foreword (1978)"
[unix-philosophy-basics]: http://www.catb.org/~esr/writings/taoup/html/ch01s06.html "Raymond, Eric S. (2004) 'Basics of the Unix Philosophy'"

### Note Links

* [Operating System][-os]
* [POSIX][-posix]
* [macOS][-macos]
* [Linux][-linux]

<!-- Hidden References -->
[-os]: os.md "Operating System"
[-posix]: posix.md "POSIX"
[-macos]: macos.md "macOS"
[-linux]: linux.md "Linux"
