---
tags: [bash,langs,devops,terminal]
created: 2022-11-01T16:15:34.247Z
modified: 2023-01-27T11:35:18.285Z
---
# BASH

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

By using the `for SOME_VAR in SOME_MULTILINED_OR_GLOB; do SOME_CMDS; done` pattern you can loop through every item in a multilined *(how bash knows something is a collection)*, collection of entities and perform a set of commands on each of them individually. Kind of like the `for some_var in some_collection` in [[python]]. This could also be modified to perform this action on a range.

```bash
for num in {1..8}; do echo $num; done;
```

This for loop uses the `for-in` loop structure and the `{x..y}` range structure to create a range of inputs to loop through echo'ing the numbers 1 through 8 in their own line.

The glob pattern shown above can also be changed when specifying the for loop as it's often used for files to only iterate through some pattern, say only `.jpg` files.

```bash
for file in *.jpg; do echo $file; done
```
