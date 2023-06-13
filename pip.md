---
created: 2023-06-13T14:02:03.955Z
modified: 2023-06-13T15:02:07.000Z
tags: [pip,package,manage,install,python,software,version]
---
# Python Package Installer (PIP)

## Introduction

>Pip is a [package-management system][-pkg-mgmt] written in [Python][-py] and
>is used to install and manage software packages.
>The [Python Software Foundation][py-sf-home] recommends using pip for
>installing Python applications and its dependencies during deployment.
>
>-- [Wikipedia (2023)][wiki-pip]

## Command Line Basics

**PIP** is most commonly used on the [command line][-cli].
There are two ways to invoke `pip`.

### Invoke PIP through PATH

The first way is to invoke `pip` through the command line environment's
`PATH` variable.
Most of the time, this will include a directory that contains the `pip`
program to run.
Typically this will be the [operating system][-os] default version of python.
So this should be reserved for system-wide installations or
when using a [virtual environment][-venv].

### Invoke PIP through Python Module

PIP itself is actually a python module.
So it can be invoked through the python interpreter.

```sh
python3.5 -m pip install --upgrade pip
```

The benefit of this approach is that
you can explicitly state which version of python to use.
This means that the packages installed will be available to that version of python.
It also means that those versions of packages are only available to **that**
version of python, segregating the packages from other versions of python.

## References

### Web Links

* [Wikipedia. "Pip (package manager)". Accessed 2023-06-13.][wiki-pip]
* [Python Software Foundation][py-sf-home]

<!-- Hidden References -->
[wiki-pip]: https://en.wikipedia.org/wiki/Pip_(package_manager) "Wikipedia. 'Pip (package manager)'. Accessed 2023-06-13"
[py-sf-home]: https://www.python.org/ "Python Software Foundation"

### Note Links

* [Python][-py]
* [Package Manager (Operating System & Software Management)][-pkg-mgmt]
* [Command Line Interface (CLI)][-cli]
* [Operating System (OS)][-os]
* [Virtual Environment (Python venv)][-venv]

<!-- Hidden References -->
[-py]: python.md "Python"
[-pkg-mgmt]: pkg-mgmt.md "Package Manager (Operating System & Software Management)"
[-cli]: cli.md "Command Line Interface (CLI)"
[-os]: os.md "Operating System (OS)"
[-venv]: venv.md "Virtual Environment (Python venv)"
