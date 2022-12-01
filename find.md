---
tags: [find,terminal,gnu,coreutils,file,management]
---
# GNU Find - a Part of CoreUtil

Find is used to look for files within either a specified path or the current one in the shell. 

## Basic Syntax

Below is the basic usage syntax for `find`:

```txt
find [starting point of searching] [expression pattern] [-options] 
```

## Finding Files with Pattern

Here are some examples of finding files matching different patterns.

### Removing MacOS Added Meta Files

MacOS adds some metadata files to certain filesystems, usually through finder, some of them because the target filesystem doesn't use the metadata system of APFS or HFS. The `._SOMEFILE.txt` pattern comes up from finder doing file operations on target filesystems that aren't APFS or HFS and it can be removed below from the suggestions of this [StackOverflow post][stackov-mac-forks]:

```sh
find . -type f -name '._*'
```

If you want to be assured the files are in fact these tiny meta files, almost always below 10KB in size, you could add the `-size` operator below along with `-10k` the `-` sign could also be a positve `+` sign to indicate whether the results should be only files smaller or larger than the given size respectively.

```sh
find . -type f -name '._*' -size -10k
```

And if you want to be super sure all the filesizes are small, then execute another terminal funciton `ls -lh {}` to use [ls](ls.md) to list the file information found using `find`.


```sh
find . -type f -name '._*' -size -10k -exec ls -lh {}
```

It's good to check that it found the files first below making the slight modification to the command above to the command below that adds `-delete` to remove those files.

```sh
find . -type f -name '._*' -size -10k -delete
```


## References

* [ManPages.org: find][manpages-find]
* [Apple StackExchange: Clean Apple Dot Prefixed Files][stackov-mac-forks]

<!-- Hidden References-->
[manpages-find]: https://manpages.org/find "ManPages.org: find"
[stackov-mac-forks]: https://apple.stackexchange.com/a/163498 "Apple StackExchange: Clean Apple Dot prefixed files"

