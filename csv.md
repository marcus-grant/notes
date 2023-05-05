---
created: 2023-05-05T11:19:06.585Z
modified: 2023-05-05T13:00:07.911Z
tags: [csv,comma,delimiter,data,file,format]
---
# Comma-Separated Values (CSV)

## Introduction

According to [Wikipedia][wiki-csv]

>A **comma-separated values** (**CSV**) file is a delimited text file that
>uses a comma to separate values.
>Each line of the file is a data record.
>Each record consists of one or more fields, separated by commas.
>The use of the comma as a field separator is the source of the name for
>this file format.
>A *CSV* file typically stores tabular data (numbers and text) in plain text,
>in which case each line will have the same number of fields.
>
>-- Wikipedia (the free encyclopedia)

## Specification

While there is no formal specification that covers all uses for *CSV* files,
there does exist a formal RFC, [RFC 4180][rfc4180],
that defines a *CSV* file as:

* Plain text using character encodings such as...
  * [ASCII][-ascii].
  * [Unicode][-unicode].
* Consists of records (typically one record per line).
* Each record is divided into fields, separated by delimiters.
  * The delimiter is a single reserved character.
  * Usually it is a comma (`,`), tab (`\t`), or semicolon (`;`).
* Every record has the same sequence of fields.

This specification is quite broad and vague in some areas and
hence the lack of a formal specification.
Depending on the application using the CSV, some specifications may be added that
aren't consistent with each other.

## Basic Rules

Because of the lack of a formal specification,
some common rules have arisen that are inconsistently applied.
In the [RFC 4180][rfc4180], when the [MIME type][-mime] is applied,
these rules should apply.

* CSV is a delimited data format that has fields/columns separated by the
delimiter character.
* A CSV file doesn't require a specific character encoding, byte order,
or line terminator format.
* A record ends at a line terminator.
  * However, line terminators can be embedded as data within fields.
  * Softrware must recognize quoted line separators (see below) in order to
correctly assemble an entire record from perhaps multiple lines.
* All records should have the same number of fields, in the same order.
* Data within fields is interpreted as a sequence of characters,
not as a sequence of bits or bytes.
* Adjacent fields must be separated by a single comma.
  * `1997,Ford,E350` is a valid record.
* Any *field* may be quoted (using double quotes).
  * `"1997","Ford","E350"` is a valid record.
* Fields with embedded commas or double quote characters must be quoted.
  * `"1997","Ford","E350","Super, luxurious truck"` is a valid record.
* Each of the embedded double-quote characters must be represented by
a pair of double-quote characters.
  * `"1997","Ford","E350","Super, ""luxurious"" truck"` is a valid record.
* Fields with embedded line breaks must be quoted
(however, some CSV implementations may not support this).
  * `"1997","Ford","E350","Go get one now they're going fast"` is a valid record.
* In some CSV implementations, leading & trailing spaces & tabs are trimmer (ignored).
  * Such trimming is forbidden by [RFC 4180][rfc4180].
    * It states "Spaces are considered part of a field & shouldn't be ignored."
  * `1997, Ford, E350` not the same as below:
  * `1997,Ford,E350`
* According to [RFC 4180][rfc4180], spaces outside quotes in a field are not allowed;
  * However, the RFC also says that:
    * "Spaces are considered part of a field & shouldn't be ignored."
    * And "Implementers should be conservative in what you do and
liberal in what you accept from others".
  * `1997, "Ford" , E350` is a valid example. 
* In CSV implementations that do trim leading or trailing spaces,
fields with such spaces as meaningful data must be quoted.
  * `"1997","Ford","E350"," Super luxurious truck "` is a valid record.
* Double quote processing need only apply if the field starts with a double quote.
  * Note that double quotes are not allowed in unquoted fields according to RFC 4180.
  * `Los Angeles, 34.0522° N, 118.2437° W` is a valid record.
  * `New York City, 40.7128° N, 74.0060° W` is a valid record.
  * `Paris, 48.8566° N, 2.3522° E` is a valid record.
* The first record may be a "header", which contains column names in each of
the fields (there's no reliable way to tell whether a file does or doesn't do this).
  * However, it is uncommon to use characters other than
letters, digits, hyphens and underscores in the header line.
  * `Year,Make,Model,Description,Price` is a valid header line followed by records:
  * `1997,Ford,E350`
  * `2000,Mercury,Cougar`

## Applications

Some applications use CSV as a *data exchange format* to enhance interoperability.
As such CSVs are supported by most [database][-db] & spreadsheet systems.

* In [relational databases][-rel-db], a table is represented by a CSV file.
  * Each line in the file represents a row in the table.
  * Each field in a line represents columns.
  * The first line in the file usually has the names of the fields (columns).

## References

### Web Links

* [Comma-Separated Values (from Wikipedia, the free encyclopedia)][wiki-csv]
* [RFC 4180][rfc4180]

<!-- Hidden References -->
[wiki-csv]: https://en.wikipedia.org/wiki/Comma-separated_values "Comma-Separated Values (from Wikipedia, the free encyclopedia)"
[rfc4180]: https://tools.ietf.org/html/rfc4180 "RFC 4180"

### Note Links

* [ASCII][-ascii]
* [Unicode (including UTF-8)][-unicode]
* [MIME / Media Type][-mime]
* [Database][-db]
* [Relational Database][-rel-db]

<!-- Hidden References -->
[-ascii]: ascii.md "ASCII"
[-unicode]: unicode.md "Unicode (including UTF-8)"
[-mime]: mime-type.md "MIME / Media Type"
[-db]: database.md "Database"
[-rel-db]: relational-database.md "Relational Database"
