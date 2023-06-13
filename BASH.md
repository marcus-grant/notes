---
tags: [bash,langs,devops,terminal]
created: 2022-11-01T16:15:34.247Z
modified: 2023-06-13T15:26:06.142Z
---
# BASH (Bourne Again SHell)

## Introduction

**BASH** is the default [command interpreter][-cli] for most Linux distributions.
According to [Wikipedia][wiki-bash]...

>**Bash** is a [Unix shell][-shell] and command [language][-lang] written by
>Brian Fox for the GNU Project as a [free software replacement][-foss] for
>the Bourne shell.
>First released in 1989, it has been used as the default login shell for
>most Linux distributions.
>Bash was one of the first programs Linus Torvalds ported to Linux, alongside GCC.
>
>-- [Wikipedia (2023)][wiki-bash]

## Ranges

```bash
touch file-{1..8}.txt
```

This touches 8 seperate files of name `file-1.txt` through `file-8.txt`.

## For each in Loop

```bash
for file in *; do echo $file; done
# OR
for file in *;
do
    echo $file;
done
```

By using the
`for SOME_VAR in SOME_MULTILINED_OR_GLOB; do SOME_CMDS; done`
pattern you can loop through every item in
a multiline *(how bash knows something is a collection)*,
collection of entities and perform a set of commands on each of them individually.
Kind of like the `for some_var in some_collection` in [Python][-py].
This could also be modified to perform this action on a range.

```bash
for num in {1..8}; do echo $num; done;
```

This for loop uses the `for-in` loop structure and
the `{x..y}` range structure to create a range of inputs to
loop through echo'ing the numbers 1 through 8 in their own line.

The glob pattern shown above can also be changed when
specifying the for loop as it's often used for files to
only iterate through some pattern, say only `.jpg` files.

```bash
for file in *.jpg; do echo $file; done
```

## References

### Web References

* [Wikipedia. "Bash (Unix shell)". Accessed 2023-04-20][wiki-bash]

<!-- Hidden References -->
[wiki-bash]: https://en.wikipedia.org/wiki/Bash_(Unix_shell) "Wikipedia. 'Bash (Unix shell)'"

### Note References

* [Command Line Interface][-cli]
* [Shell (Operating System)][-shell]
* [Programming Language][-lang]
* [FOSS (Free and Open Source Software)][-foss]
* [Python (Programming Language)][-py]

<!-- Hidden References -->
[-cli]: cli.md "Command Line Interface"
[-shell]: os-shell.md "Shell (Operating System)"
[-lang]: programming-language.md "Programming Language"
[-foss]: foss.md "FOSS (Free and Open Source Software)"
[-py]: python.md "Python (Programming Language)"
