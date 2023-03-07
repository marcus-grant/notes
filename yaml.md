---
created: 2023-03-07T10:42:01.610Z
modified: 2023-03-07T10:55:17.607Z
tags: [yaml,markup,data,serial,configuration,language,computer,software,pcde]
---
# YAML (YAML Ain't Markup Language)

## Introduction

According to [Wikipedia][yaml-wiki]:

>**YAML** (/ˈjæməl/) is a human-readable data-serialization language.
>It is commonly used for configuration files and in
>applications where data is being stored or transmitted.
>YAML targets many of the same communications applications as
>Extensible Markup Language (XML) but
>has a minimal syntax which intentionally differs from
>Standard Generalized Markup Language (SGML).
>It uses both [Python][py-zk]-style indentation to indicate nesting,
>and a more compact format that uses `[...]` and `{...}` for maps thus
>[JSON][json-zk] file are valid YAML files.

## Basics

* Custom datatypes are suppoerted, but YAML natively encodes:
  * *scalars* (strings, numbers, booleans, null)
  * *lists* (arrays)
  * *associative arrays* (maps, hashes, dictionaries)
* *YAML* is a superset of [JSON][json-zk] (JSON is a subset of YAML)
* Whitespace indentation is used for denoting structure
  * *Tab* characters are **not allowed** as indentation
* Comments begin with the `#` character
* List members are shown as `-` followed by a space, the value and separated by newlines
* An associative array entry is represented using colon space in the form `key: value`
* Strings are usually unquoted, but can be quoted using single or double quotes to
avoid datatype ambiguity
* Block scalaras are delimited with indentation with optional modifiers to...
  * Preserve `|` or...
  * Fold `>` the whitespace/newlines.

## References

### Web Links

* [YAML (from Wikipedia, the free encyclopedia)][yaml-wiki]
* [What is YAML? (from RedHat.com)][what-is-yaml-redhat]

<!-- Hidden References -->
[yaml-wiki]: https://en.wikipedia.org/wiki/YAML "YAML (from Wikipedia, the free encyclopedia)"
[what-is-yaml-redhat]: https://www.redhat.com/en/topics/automation/what-is-yaml "What is YAML? (from RedHat.com)"

### Note Links

* [Python][py-zk]
* [JSON (JavaScript Object Notation)][json-zk]

<!-- Hidden References -->
[py-zk]: ./python.md "Python"
[json-zk]: ./json.md "JSON (JavaScript Object Notation)"
