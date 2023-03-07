---
created: 2023-03-06T14:09:42.000Z
modified: 2023-03-07T10:12:03.075Z
tags: [http,web,protocol,network,computer,pcde,module10]
---
# HTTP(S) Protocol

## Introduction

>The **Hypertext Transfer Protocol** (HTTP) is an application layer protocol in
>the internet protocol suite for distributed, collaborative,
>hypermedia information systems.

## Request Line

### Request Method

### Request Method Feature Requirements

| Method      | Req. Body | Resp. Body | Safe | Idempotent | Cacheable |
| :---------- | --------- | ---------- | ---- | ---------- | --------- |
| **GET**     | Optional  | Yes        | Yes  | Yes        | Yes       |
| **HEAD**    | Optional  | No         | Yes  | Yes        | Yes       |
| **POST**    | Yes       | Yes        | No   | No         | Yes       |
| **PUT**     | Yes       | Yes        | No   | Yes        | No        |
| **DELETE**  | Optional  | Yes        | No   | Yes        | No        |
| **CONNECT** | Optional  | Yes        | No   | No         | No        |
| **OPTIONS** | Optional  | Yes        | Yes  | Yes        | No        |
| **TRACE**   | No        | Yes        | Yes  | Yes        | No        |
| **PATCH**   | Yes       | Yes        | No   | No         | No        |

### Safe Methods

A request method is **safe** if a request with
that method has no intended effect on the server state.
You can think of **safe-methods** as being **read-only** methods.
The methods `GET`, `HEAD`, `OPTIONS`, and `TRACE` are safe.

>**Note:** They **do not** exclude the possibility of side effects.
>Appending logs, or charging an account on another server,
>all are side effects that are likely to come from these methods.

### Idempotent Methods

A request method is **idempotent** if an identical request with
that method can be made multiple times without any side effects.
This includes the *safe-methods* and the methods `PUT` and `DELETE`.
The *safe-methods* are trivially idempotent,
as the request has no side effects.
The methods `PUT` and `DELETE` are idempotent,
because altering the state of the server with the same information
will always result in the same state, same for `DELETE`ing something twice.

### Cacheable Methods

A request method is **cacheable** if the response to a request with
that method can be cached for future use, avoiding the need to wait for a response.
The methods `GET`, `HEAD`, and `POST` are cacheable.

## Request Headers

[**HTTP Headers**][http-headers-zk] let the client and
server pass additional information with an HTTP request or response.
An HTTP header consists of its case-insensitive name followed by a colon `:`,
then by its value (without line breaks).

## Request Body

## Response Status Codes

* `1XX` (Informational)
  * The request was received, continuing process
* `2XX` (Successful)
  * The request was successfully received, understood, and accepted
* `3XX` (Redirection)
  * Further action needs to be taken in order to complete the request
* `4XX` (Client Error)
  * The request contains bad syntax or cannot be fulfilled
* `5XX` (Server Error)
  * The server failed to fulfill an apparently valid request


## References

### Web Links

<!-- Hidden References -->

### Note Links

* [HTTP (from Wikipedia, the free encyclopedia)][http-wiki]
* [HTTP(S) Headers][http-headers-zk]

<!-- Hidden References -->
[http-wiki]: https://en.wikipedia.org/wiki/HTTP "HTTP (from Wikipedia, the free encyclopedia)"
[http-headers-zk]: ./http-headers.md "HTTP(S) Headers"
