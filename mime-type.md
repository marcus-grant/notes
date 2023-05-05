---
created: 2023-05-05T12:25:20.752Z
modified: 2023-05-05T13:25:31.000Z
tags: [mime,web,standard,data,format,media,type]
---
# MIME / Media Type

>A **media type** (formerly known as a **MIME type**)
>is a two-part identifier for file formats and
>format contents transmitted on the Internet.
>The Internet Assigned Numbers Authority (IANA) is the official authority for
>the standardization and publication of these classifications.
>Media types were originally defined in [Request for Comments RFC 2045][rfc2045]
>(MIME) Part One: Format of Internet Message Bodies (Nov 1996) in
>November 1996 as a part of the MIME
>(Multipurpose Internet Mail Extensions) specification,
>for denoting type of email message content and attachments;
>hence the original name, MIME type.
>Media types are also used by other internet protocols such as [HTTP][-http] and
>document file formats such as [HTML][-html] for similar purposes.
>
>--[Media Types (formerly MIME Types | from Wikipedia, the free encyclopedia)][wiki-mime]

## Naming

A media type consists of a *type* and a *subtype*,
which is further structured into a *tree*.
A Media type can optionally define a *suffix* and *parameters*.

```txt
mime-type = type "/" [tree "."] subtype ["+" suffix]* [";" parameter];
```

As an example, an HTML file might be designated `text/html; charset=UTF-8`.
In this example, `text` is the *type*,
`html` is the *subtype*,
and `charset=UTF-8` is an optional *parameter*.

Types, subtypes, and suffixes are case-insensitive.
Parameter values are usually case-sensitive,
but may be interpreted in a case-insensitive manner, depending on its use.

## Types

As of November 1996, the IANA maintains a registry of media types:
`application`, `audio`, `image`, `message`, `multipart`, `text`, and `video`.
By December 2020 that list has increased to include these types:
`font`, `example`, `model`.

## Common Examples

* `application/json`
* `application/ld+json`
* `application/msword`
* `application/pdf`
* `application/sql`
* `application/vnd.api+json`
* `application/vnd.microsoft.portable-executable`
* `application/vnd.ms-excel`
* `application/vnd.ms-powerpoint`
* `application/vnd.oasis.opendocument.text`
* `application/vnd.openxmlformats-officedocument.presentational.presentation`
* `application/vnd.openxmlformats-officedocument.spreadsheetml.sheet`
* `application/vnd.openxmlformats-officedocument.wordprocessingml.document`
* `application/x-www-form-urlencoded`
* `application/xml`
* `application/zip`
* `application/zstd`
* `audio/mpeg`
* `audio/ogg`
* `image/avif`
* `image/jpeg`
* `image/png`
* `image/svg+xml`
* `model/obj`
* `text/plain`
* `text/css`
* `text/csv`
* `text/html`
* `text/javascript`
* `text/markdown`
* `text/xml`

## References

### Web Links

* [Media Types (formerly MIME Types | from Wikipedia, the free encyclopedia)][wiki-mime]
* [RFC 2045][rfc2045]

<!-- Hidden References -->
[wiki-mime]: https://en.wikipedia.org/wiki/Media_type "Media Types (formerly MIME Types | from Wikipedia, the free encyclopedia)"
[rfc2045]: https://datatracker.ietf.org/doc/html/rfc2045 "RFC 2045"

### Note Links

* [HTTP][-http]
* [HTML][-html]

<!-- Hidden References -->
[-http]: http.md "HTTP"
[-html]: html.md "HTML"
