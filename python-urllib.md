---
created: 2023-06-26T10:42:11.037Z
modified: 2023-06-26T12:08:29.957Z
tags: [python,url,library,internet,protocol,communication,network]
---
# URLLib (Python Internet Protocol Library)

## Introduction

>**`urllib`** is a [Python][-py] Standard Library package that
>collects several modules for working with URLs:
>
>* `urllib.request` for opening and reading URLs
>* `urllib.error` containing the exceptions raised by `urllib.request`
>* `urllib.parse` for parsing URLs
>* `urllib.robotparser` for parsing `robots.txt` files

## Requesting Data from URL

Here is a simple example of using `urllib.request` to
request the [HTML][-html] for MIT's Course Catalog.

```python
import urllib.request
import json
# request json file
url = 'http://student.mit.edu/catalog/m1a.html'
response = urllib.request.urlopen(url).read()
data = response.decode('utf-8')
# write to console
print(data)
```

## References

### Web Links

* [Python Software Foundation. docs.python.org/3/library/urllib.html. "urllib - URL handling modules". Accessed 2023-06-26][py-docs-urllib]

<!-- Hidden References -->
[py-docs-urllib]: https://docs.python.org/3/library/urllib.html "Python Docs: urllib"

### Note Links

* [Python][-py]
* [HyperText Markup Language][-html]

<!-- Hidden References -->
[-py]: python.md "Python"
[-html]: html.md "HyperText Markup Language"
