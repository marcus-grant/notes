---
created: 2022-12-11T16:35:00
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
> globas are also used widely for matching arbitrary strings *(wildcard matching)*.
> In this capacity a common interface is `fnmatch`.

In addition to matching filenames, globs are also used widely for matching arbitrary strings (wildcard matching). In this capacity a common interface is fnmatch.

## References

### Web References

* [Glob (programming) (from Wikipedia, the free encyclopedia)][glob-wiki]

<!-- Hidden References -->
[glob-wiki]: https://en.wikipedia.org/wiki/Glob_(programming) "Glob (programming) (from Wikipedia, the free encyclopedia)"

### Note References

* [Glob (programming) (from Wikipedia, the free encyclopedia)][glob-wiki]

<!-- Hidden References -->
[glob-wiki]: https://en.wikipedia.org/wiki/Glob_(programming) "Glob (programming) (from Wikipedia, the free encyclopedia)"

#### Referenced by

* [Part of Caddy][caddy-zk]

<!-- Hidden References -->
[caddy-zk]: ./caddy.md "Part of Caddy"
