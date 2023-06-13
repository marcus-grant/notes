---
created: 2023-06-13T13:16:47.138Z
modified: 2023-06-13T14:50:43.304Z
tags: [python,version,manage,pyenv,venv,package,system,install]
---
# Python Version Management

## Why You Might Need Older or Newer Versions

### Python 2 vs Python 3

As [python][-py] matured, the language evolved.
The transition from Python 2 to Python 3 was a major one,
resulting in several breaking changes that
probably were worth it in the end for removing some
technical debt and weird syntactic designs.
This however introduced a long running problem for python developers.
Python is historically one of the most frustrating languages to
maintain its environment for.

### Python 2 is EOL

Python 2 is no longer maintained.
Today on 2021-06-13,
a lot of [operating systems][-os] no longer ship with Python 2.
So this distinction is not as important as it used to be.
However,
due to this history of breaking changes,
the Python community has been prone to release packages that
only work with a specific version of Python.

### Managing Python Versions

Because a lot of packages have picked up the habit of
only supporting a specific version of Python,
due to the Python 2 vs Python 3 schism,
Python more commonly than most language communities is prone to
breaking changes between python interpreter versions.
This is especially visible in even the most popularly maintained packages.

This means special care for managing the version of python is needed.
There are a few ways to do this,
both through your operating system's package manager,
using [software containers][-container],
or using a dedicated python version manager.

## Operating System Version Management

Some means to control python versions exist via the operating system.
This can in some cases be the most simple way to manage multiple python versions.
Each python interpreter will manage its own sets of packages.
So you get some degree of segregation between python versions.
One drawback however is that package version control isn't possible.
There are ways to get around this that will be covered later.

### Debian/Ubuntu

The debian-based distributions of
[linux][-linux] use the [aptitude][-aptitude] [package manager][-pkg-mgmt].
Most of the repositories for these distributions or
PPA (Personal Package Archives) will have a python package for
whatever version is needed.
This will install python side by side the system default version of python.

```sh
sudo add-apt-repository ppa:deadsnakes/ppa # deadsnakes is a PPA for older pythons
sudo apt-get update # update the package metadata
sudo apt-get install python3.5 # replace 3.5 with whatever version you need
```

The above shell commands were taken from this [ask-ubuntu answer][ask-ubuntu].
What this will do is install python 3.5 alongside the system default python.
The system default python interpreter and libraries will remain symlinked to
`/usr/bin/python` and `/usr/lib/python` respectively.
But now you can invoke `/usr/bin/python3.5` to use the python 3.5 interpreter.

>**Note:** Any python version available on *deadsnakes's* PPA can be substituted
>for `python3.5` in the above commands.

Now you can use the python interpreter for the version you need.

```sh
python3.5 --version
```

This shows you it is indeed the version you need.
Now you probably need [pip][-pip] to install packages for
this version of python.
Unless it's one of the later versions of python,
where pip is included by default,
you will probably need to install it via aptitude.
In Debian this operating system package is usually packaged within
the `distutils` package.

```sh
sudo apt-get install python3.5-distutils
```

Now you should be able to install packages for this version of python.
But you will probably need to invoke `pip` for this version of python.

```sh
python3.5 -m pip install 'gym[atari]'
```

## Virtual Environments

Once you have a python interpreter installed,
even version managed,
you will probably want to **also version manage** your packages.
This is where virtual environments come in and
can be managed using [venv][-venv].
You can also do this through [conda][-conda].

## References

### Web Links

* [Ask Ubuntu: How do I Install a different Python Version?][ask-ubuntu]

<!-- Hidden References -->
[ask-ubuntu]: https://askubuntu.com/a/682875 "Ask Ubuntu: How do I Install a different Python Version?"

### Note Links

* [Python][-py]
* [Operating System][-os]
* [Container (Software)][-container]
* [Linux][-linux]
* [Package Manager (Operating System)][-pkg-mgmt]
* [Package Management: Aptitude][-aptitude]
* [Python Package Installer (pip)][-pip]
* [Virtual Environments (Python VENV)][-venv]
* [Conda (Anaconda Python Distribution)][-conda]

<!-- Hidden References -->
[-py]: python.md "Python"
[-os]: os.md "Operating System"
[-container]: container.md "Container (Software)"
[-linux]: linux.md "Linux"
[-pkg-mgmt]: pkg-mgmt.md "Package Manager (Operating System)"
[-aptitude]: pkg-mgmt.md#aptitude "Package Management: Aptitude"
[-pip]: pip.md "Python Package Installer (pip)"
[-venv]: venv.md "Virtual Environments"
[-conda]: python-anaconda.md "Conda (Anaconda Python Distribution)"
