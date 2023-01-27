---
created: 2022-12-28T14:05:06.432Z
modified: 2023-01-26T07:57:05.054Z
tags: [unix,linux,devops,file,tree,posix,data,shell]
---
# Glob Patterns

From Wikipedia:

> In computer programming, **glob** (/ɡlɑːb/) patterns specify
> sets of filenames with *wildcard characters*.
> For example,
> the Unix Bash shell command
> `mv *.txt textfiles/` moves (`mv`) all files with names ending in `.txt` from
> the current directory to the directory `textfiles`.
> Here,
> `*` is a wildcard standing for "any string of characters except /" and
> `*.txt` is a glob pattern.
> The other common wildcard is the question mark (`?`),
> which stands for one character.
> For example,
> `mv ?.txt shorttextfiles/` will move all files named with
> a single character followed by `.txt` from
> the current directory to directory `shorttextfiles`,
> while `??.txt` would match all files whose name consists of
> 2 characters followed by `.txt`.
>
> In addition to matching filenames,
> globs are also used widely for matching arbitrary strings *(wildcard matching)*.
> In this capacity a common interface is `fnmatch`.

In addition to matching filenames,
globs are also used widely for matching arbitrary strings (wildcard matching).
In this capacity a common interface is fnmatch.

## Software Implementing or Deploying Glob Patterns

* [mrmlnc/fast-glob][mrmlnc/fast-glob-gh]

## References

### Web References

* [Glob (programming) (from Wikipedia, the free encyclopedia)][glob-wiki]
* [fast-glob a fast and efficient glob library for Nodejs (from Github by mrmlnc)][mrmlnc/fast-glob-gh]

<!-- Hidden References -->
[glob-wiki]: https://en.wikipedia.org/wiki/Glob_(programming) "Glob (programming) (from Wikipedia, the free encyclopedia)"
[mrmlnc/fast-glob-gh]: https://github.com/mrmlnc/fast-glob "fast-glob a fast and efficient glob library for Nodejs (from Github by mrmlnc)"

### Note References

<!-- Hidden References -->

### Referenced by

* [Part of Caddy][caddy-zk]
* [Part of Gatsby][gatsby-zk]

<!-- Hidden References -->
[caddy-zk]: ./caddy.md "Part of Caddy"
[gatsby-zk]: ./gatsby.md "Part of Gatsby"
