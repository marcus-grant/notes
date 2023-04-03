---
created: 2023-04-03T13:13:51.323Z
modified: 2023-04-03T14:28:37.247Z
tags: [python,os,shell,containers,filesystem,process,automation,devops,scripting,pcde,module13]
---
# Python Interaction with OS Shell

## Introduction

Automation programs can be thought of as the *glue-code* that
connects processes that are normally performed manually and independently.
We'll frequently go the [shell of our operating system][shell-zk] and
we'll want to run some program.
An automation script can do this for us for larger more complex tasks that
we may want to automate.
This can be done fairly well with [python][py-zk].

## The Sys & OS Modules

### Sys & OS Modules Overview

[Python][py-zk] has [a module called "os"][py-os-mod] that
provides a way to interact with the [operating system][os-zk].
The [sys module][py-sys-mod] provides access to some variables and functions that
are important when defining how a python script is run in a shell.

### Sys & OS Modules Example

Let's explain how to use the [sys module][py-sys-mod] and
the [os module][py-os-mod] by emulating some of the behavior of
the [ls command][ls-zk].
We'll create a script that checks for what is in
the current working directory and
depending on the arguments passed to the script,
will list either all non-hidden files or all files.

```python
# ./shell.py
import os
import sys

# ---------------
# Input Arguments
# ---------------
# -list, list files
# -listHidden, list hidden files

# list files
def list_files():
  cmd = f'ls -l'
  result = os.system(cmd)
  print(result)

def list_hidden_files():
  cmd = f'ls -la'
  result = os.system(cmd)
  print(result)

# read input arguments
argument = len(sys.argv)
if (argument > 1):
  argument = sys.argv[1]

# if -list list files
if (argument == '-list'):
  list_files()

# if -listHidden list hidden files
if (argument == '-listHidden'):
  list_hidden_files()
```

The script starts by importing `os` and `sys` modules.
Then it defines two functions, `list_files` and `list_hidden_files`.
These functions will run the `ls -l` and `ls -la` commands respectively in
the shell as if you were to run them in the terminal manually.
They both then take the output of the command and print it to the console by
calling the string of each command and using `os.system` to run the command and
assign the function return to `result`, a local variable.
That `result` variable is then printed to the console.

If you open up the shell and run this script with the `-list` argument,
you'll see the output of the `ls -l` command.

```bash
python3 shell.py -list
# drwxr-xr-x@ 4 user staff 128  3 Apr 15:20 .
# drwxr-xr-x@ 4 user staff 128  3 Apr 15:20 ..
# -rw-r--r--@ 1 user staff 571  3 Apr 15:20 shell.py
```

And if you run it with the `-listHidden` argument,
you'll see the output of the `ls -la` command.

```bash
python3 shell.py -listHidden
# drwxr-xr-x@ 4 user staff 128  3 Apr 15:20 .
# drwxr-xr-x@ 4 user staff 128  3 Apr 15:20 ..
# -rw-r--r--@ 1 user staff 571  3 Apr 15:20 shell.py
# drwxr-xr-x@ 3 user staff 96   3 Apr 15:20 .vscode
```

This is the exact output you'd get if
you were to run `ls -l` or `ls -la` respectively in the terminal shell.

## Creating a Container

### Python Container Automation Technique Overview

Creating [containers][container-zk] is a common task in system automation.
However, it gets really tedious to have to type out the entire
`docker run` command every time you want to create a container.
And then all the other commands you need to maintain and manage them.
Better to have a script that can do it for you.

### Python Container Shell Automation Script

In this example, we'll create a script that
will create a [docker][docker-zk] container by
using the same `os` and `sys` modules we used in the previous example.
It simply copies the typical `docker run` command used to
create a container from the terminal.

```python
import os
import sys

# ---------------
# Input Arguments
# ---------------
# -create, create container

# create container
def create(cmd, db):
  result = os.system(cmd)
  if (result == 0):
    print(f'Created {db}!')

# read input arguments
argument = len(sys.argv)
if (argument > 1):
  argument = sys.argv[1]

# if -create input argument, create container
if (argument == '-create'):
  db_name = 'some-mysql'
  create(f'docker run -d -p 3306:3306 --name {db_name} -e MYSQL_ROOT_PASSWORD=root -d 'mysql')
```

The script starts by importing `os` and `sys` modules.
Then it defines a function called `create` that takes two arguments,
`cmd` and `db`.
The `cmd` argument is the command that will be run in the shell.
The `db` argument is the name of the database that will be created.
The function then runs the command in the shell using `os.system`.
If the command is successful, it will print a message to the console.
**Note**: The `os.system` function returns `0` if the command is successful,
representing the return code of the command `0` is the only successful return code.
The script then reads the input arguments and if the `-create` argument is passed,
it will run the `create` function with the `docker run` command string defined.

### Python Script to Delete a Container

In this example, we'll create a script that
will delete a container by mimicking the `docker rm` command and its arguments.

```python
import os
import sys

# ---------------
# Input Arguments
# ---------------
# -delete, delete container

# delete container
def delete(container):
  cmd = f'docker stop {container}'
  result = os.system(cmd)
  if (result == 0):
    cmd = f'docker rm {container}'
    result = os.system(cmd)
    print(f'Stopped & removed {container}!')
```

Again, this script imports the `os` and `sys` modules.
Then it defines a function called `delete` that takes one argument, `container`.
This function will stop the container by running the `docker stop` command using
`os.system` and saving the result to `result`.
Then it checks `result` to see if the command was successful.
If so, it will run the `docker rm` command to remove the container.
**Note** that the `docker rm` command will only work if the container is stopped,
that's why we first run the `docker stop` command.

>**Note**: An important take-away from these examples is that
>when automating tasks in the shell,
>it's **really important** to understand the commands you're running.
>Like when using docker, you need to know that to remove a container,
>first you need to stop it.
>So practice running the commands in the shell before you automate them.

## References

### Web Links

* [Python3 OS Module (from docs.python.org)][py-os-mod]
* [Python3 Sys Module (from docs.python.org)][py-sys-mod]

<!-- Hidden References -->
[py-os-mod]: https://docs.python.org/3/library/os.html "Python3 OS Module (from docs.python.org)"
[py-sys-mod]: https://docs.python.org/3/library/sys.html "Python3 Sys Module (from docs.python.org)"

### Note Links

* [Python][py-zk]
* [OS Shell][shell-zk]
* [Operating System][os-zk]
* [GNU (LiSt Contents)][ls-zk]
* [Containers][container-zk]
* [Docker][docker-zk]

<!-- Hidden References -->
[py-zk]: ./python.md "Python"
[shell-zk]: ./os-shell.md "OS Shell"
[os-zk]: ./os.md "Operating System"
[ls-zk]: ./ls.md "GNU Ls (LiSt Contents)"
[container-zk]: ./container.md "Containers"
[docker-zk]: ./docker.md "Docker"
