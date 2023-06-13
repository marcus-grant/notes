---
created: 2023-06-13T14:17:51.138Z
modified: 2023-06-13T15:17:53.000Z
tags: [python,virtual,environment,deploy,package,manage,install,software,venv,develop]
---
# Virtual Environment (Python venv)

## Introduction

The program `venv` is a [Python][py] module that provides support for
creating lightweight and segregated Python execution environments.
According to the [Python Foundation's Documentation][py-docs-venv]:

>The **venv** module supports creating lightweight "virtual environments",
>each with their own independent set of Python packages installed in
>their site directories.
>A virtual environment is created on top of an existing Python installation,
>known as the virtual environment’s "base" Python,
>and may optionally be isolated from the packages in the base environment,
>so only those explicitly installed in the virtual environment are available.

Using `venv` is the recommended way to create and manage virtual environments and
is part of managing the versions of [python and its dependencies][-py-version].

## References

### Web Links

* [Python Foundation. 'venv - Creation of Virtual Environments'. Accessed 2023-06-13][py-docs-venv]

<!-- Hidden References -->
[py-docs-venv]: https://docs.python.org/3/library/venv.html "Python Foundation. 'venv - Creation of Virtual Environments'. Accessed 2023-06-13"

### Note Links

* [Python][py]
* [Python Versioning and Dependency Management][-py-version]

<!-- Hidden References -->
[py]: python.md "Python"
[-py-version]: python-version.md "Python Versioning and Dependency Management"
