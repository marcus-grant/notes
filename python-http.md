---
created: 2023-06-26T10:43:32.828Z
modified: 2023-06-26T11:43:34.000Z
tags: [http,protocol,internet,web,client,server,cookie,python]
---
# HTTP (Python HTTP Libraries)

## Introduction

>`http` is a package that collects several modules for working with
>the [HyperText Transfer Protocol][-http]:
>
>* `http.client` is a low-level HTTP protocol client;
>  for high-level URL opening use urllib.request
>* `http.server` contains basic HTTP server classes based on [`socketserver`][-py-sock]
>* http.cookies has utilities for implementing state management with
>  [cookies][-cookie]
>* `http.cookiejar` provides persistence of cookies
>
>-- [(Python Software Foundation 2023)][py-docs-http]

This is the standard low-level way to work with HTTP in [Python][-py].
When using this library or any of its derivatives,
it's important to remember the principles of [the Client-Server Architecture][-cl-srv].

## References

### Web Links

* [Python Software Foundation. (2023) docs.python.org/3/library/http.html. "HTTP - HTTP modules"][py-docs-http]

<!-- Hidden References -->
[py-docs-http]: https://docs.python.org/3/library/http.html "Python Software Foundation. 'HTTP'"

### Note Links

* [Python][-py]
* [HyperText Transfer Protocol (HTTP)][-http]
* [Socket (Python Std.Lib.)][-py-sock]
* [Cookie (HTTP Client State Management)][-cookie]
* [Client-Server Architecture][-cl-srv]

<!-- Hidden References -->
[-py]: python.md "Python"
[-http]: http.md "HyperText Transfer Protocol"
[-py-sock]: python-socket.md "Socket (Python Std.Lib.)"
[-cookie]: cookie.md "Cookie (HTTP Client State Management)"
[-cl-srv]: ./client-server.md "Client-Server Architecture"
