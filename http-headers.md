---
created: 2023-03-06T14:32:14.000Z
modified: 2023-03-07T10:38:21.989Z
tags: [http,header,web,protocol,network,computer,pcde,module10]
---
# HTTP Request and Response Headers Fields

## Introduction

According to [MDN][http-header-mdn]:

>HTTP headers let the client and the server pass additional information with
>an HTTP request or response.
>An HTTP header consists of its case-insensitive name followed by a colon (:),
>then by its value.
>Whitespace before the value is ignored.

According to [Wikipedia][list-http-header-wiki]:

>HTTP header fields are a list of strings sent and
>received by both the client program and server on every HTTP request and response.
>These headers are usually invisible to the end-user and are only processed or
>logged by the server and client applications.

Headers can be grouped by their contexts:

* **Request Headers** are sent by the client to the server.
  * Provides information about the request being made to the server.
* **Response Headers** are sent by the server to the client.
  * Provides information about the response being sent to the client.
* **Representation Headers** are sent by the server to the client.
  * Provides information about the *body* of the request, or *payload*.
  * Could include MIME types.
* **Payload Headers** are sent by the server to the client.
  * Provides information about the *body* of the request, or *payload*.

## Standard Header Fields

* `Accept`
  * Description: Media types that are acceptable for the response.
  * Example: `Accept: text/html,application/json`
* `Location`
  * Description: Used in redirection, or when a new resource has been created.
  * Example: `Location: https://example.com`

## Common Non-Standard Header Fields

* `X-Content-Duration`
  * Description: The duration of the content in seconds.
  * Example: `X-Content-Duration: 42`

## Discovered Non-Standard Header Fields

* `X-Forwarded-For`
  * Description: The IP address of the client or last proxy that sent the request.
  * Example: `X-Forwarded-For: 69.42.0.0`

## References

### Web Links

* [HTTP Headers (from developer.mozilla.org (MDN))][http-header-mdn]
* [List of HTTP header fields (from Wikipedia, the free encyclopedia)"][list-http-header-wiki]

<!-- Hidden References -->
[http-header-mdn]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers "HTTP Headers (from developer.mozilla.org (MDN))"
[list-http-header-wiki]: https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Request_fields "List of HTTP header fields (from Wikipedia, the free encyclopedia)"

### Note Links

<!-- Hidden References -->
