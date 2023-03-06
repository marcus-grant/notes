---
created: 2022-12-02T14:58:00.723Z
modified: 2022-12-02T15:06:22.372Z
tags: [cli,terminal,unix,linux,shell,computers,software,compsci,productivity,devops]
---
# Command Line Interfaces (CLI) Overview

A **command-line interpreter** or
**command-line processor** uses a
**command-line interface** to
receive commands from a user in the form of lines of text.
This allows for a very basic user interface to
set configurations, invoke executables and providing information to them as
to what actions they are to perform on an [operating system][os-wiki].
For brevity, **command-line interfaces** are abbreviated here as **CLI**.
Usually command-line interfaces are
a textual component to an OS's [shell](os-shell.md).

Terminals are a common way to refer to CLIs and were once
the preferred way of interacting with a computer.
Today the word, terminal, often gets used when referring to a terminal emulator.
Terminal emulators, are actually a software program that
emulates hardware terminals of old.
Now terminals are normally just applications that give
a *CLI* to an operating system's [shell][shell-wiki].

## File Management

One of the most common ways to use a CLI is to both navigate and manage files.
There are a few common commands that nearly always gets used to do this.

* `ls` - **L**i**s**t files in the current directory.
* `cd` - **C**hange **d**irectory.
* `mkdir` - **M**a**k**e **dir**ectory.
* `rm` - **R**e**m**ove file or directory.
* `mv` - **M**o**v**e file or directory.
* `cp` - **C**o**p**y file or directory.
* `touch` - Create a new file.
* `cat` - **Cat**enate files and print on the standard output.

These are all part of the [GNU CoreUtil][coreutils-zk] suite of tools.

## References

### Web Links

* [Command Line Interface (from Wikipedia, the online encyclopedia)][cli-wiki]
* [Shell (Computing) (from Wikipedia, the free encyclopedia)][shell-wiki]
* [Operating System (from Wikipedia, the free encyclopedia)][os-wiki]

<!-- Hidden Reference Links Below Here -->
[cli-wiki]: https://en.wikipedia.org/wiki/Command-line_interface "Command Line Interface (from Wikipedia, the online encyclopedia)"
[shell-wiki]: https://en.wikipedia.org/wiki/Shell_%28computing%29 "Shell (Computing) (from Wikipedia, the free encyclopedia)"
[os-wiki]: https://en.wikipedia.org/wiki/Operating_system "Operating System (from Wikipedia, the free encyclopedia)"

### Note Links

* [GNU CoreUtil][coreutils-zk]

<!-- Hidden Reference Links Below Here -->
[coreutils-zk]: ./coreutils.md "GNU CoreUtil"
