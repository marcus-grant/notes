---
created: 2022-12-13T14:28:45.342Z
modified: 2022-12-13T14:28:45.342Z
tags: [caddy,devops,server,selfhost,web,proxy,reverse,ssl,certificate]
---
# Caddy - The Ultimate Web Server

> Caddy 2 is a powerful, enterprise-ready, *open source web server* with
> *automatic HTTPS* written in Go.

## Import

[Import][caddy-doc-import]s will incl. [snippets][self-snips] or files,
replacing this directive with the contents of the snippet or file.

This directive is a special case:
it is evaluated before the structure is parsed,
it can appear anywhere in the Caddyfile.

### Syntax

```sh
import <pattern> [<args...>]
```

* **<pattern>** is the filename,
[glob pattern][zk-glob],
or name of [snippet][self-znips] to include.
  * It is an error if a specific file cannot be found.
  * However, glob patterns are not errors.
  * If file pattern is a filename or glob, it's
always relative to the file the `import` appears in.
* **<args...>** is an optional list of arguments to pass to the imported tokens.
  * They can be used with a placeholder of the form `{args.N}` where `N` is the
0-based positional index of parameter.
  * This placeholder is a special case & is evaluated at parse-time.

#### Examples

Import all files in a folder within the same parent directory:

```Caddyfile
import sites-enabled/*
```

Import a snippet that sets CORS headers using an import argument:

```Caddyfile
(cors) {
    @origin header Origin {args.0}
    header @origin Access-Control-Allow-Origin "{args.0}"
    header @origin Access-Control-Allow-Methods "OPTIONS,HEAD,GET,POST,PUT"
}
example.com {
    import cors example.com
}
```

**Pro-Tip:**
Using the apache standard `sites-enabled/` directory with symlinked to
files in `sites-available/` is a good way to easily enable/disable
different site routes or in this case Caddy configs.
Within `/etc/caddy` create directories `sites-enabled/` & `sites-available/`.
Then add all Caddyfiles wihtin `sites-available/` and
create symlinks inside `sites-available/` linking to those files.

### Snippets

**Snippets** are special blocks defined by
giving them a name surrounded in parenthesis.

```Caddyfile
(redirect) {
    @http {
        protocol http
    }
    redir @http https://{host}{uri}
}
```

Then you can reuse this **snippet** anywhere by using the `import` directive:

```Caddyfile
import redirect
```

It's also possible to pass arguments to
imported configurations & use them like so:
```Caddyfile
(snippet) {
    respond "Yahaha! You found {args.0}!"
}
a.example.com {
    import snippet "Example A"
}
b.example.com {
    import snippet "Example B"
}
```

## References

### Note References

* [Caddy Snippets Section][self-snips]
* [Glob Pattern][zk-glob]

<!-- Hidden References -->
[self-snips]: ./caddy.md#Snippets "Caddy Snippets Section"
[zk-glob]: ./glob-pattern.md "Glob Pattern"

### Web References

* [Caddy Homepage][caddy-home]
* [Caddy Documentation: Imports][caddy-doc-imports]

<!-- Hidden References -->
[caddy-home]: https://caddyserver.com "Caddy Homepage"
[caddy-doc-imports]: https://caddyserver.com/docs/caddyfile/directives/import "Caddy Documentation: Imports"

