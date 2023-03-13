---
created: 2023-03-12T17:31:15.727Z
modified: 2023-03-13T09:51:26.013Z
tags: [jinja,python,template,flask,ansible,html,web,pcde,module11]
---
# Jinja (Template Engine)

## Overview

According to [Wikipedia][jinja-wiki]:

>Jinja is a [web template engine][template-zk] for
>the [Python programming language.][py-zk]
>It was created by Armin Ronacher and is licensed under a BSD License.
>Jinja is similar to the Django template engine but
>provides Python-like expressions while ensuring that
>the templates are evaluated in a sandbox.
>It is a text-based template language and
>thus can be used to generate any markup as well as source code.

It has since been picked up by a lot of different software stacks.
Being [python-based][py-zk], it gets used in web frameworks like [Flask][flask-zk].
Even [Ansible][ansible-zk] uses it for templating configuration files,
scripts, and other deployment artifacts.


>**Note:** If you're here from looking at the [Nunjucks Template Engine][njk-zk],
>Nunjucks is designed to be a port of Jinja to JavaScript.
>Most of the syntax, API and filters are the same,
>**however** some important differences exist as it is based on [JavaScript][js-zk].

## API

***TODO*** needs python-side explanations from documentation

### Syntax

***TODO*** needs python-side explanations from documentation

## References

### Web Links

* [Jinja Homepage][jinja-home]
* [Jinja (Template Engine)][jinja-wiki]

<!-- Hidden References -->
[jinja-home]: https://jinja.palletsprojects.com/en/3.1.x/ "Jinja Homepage"
[jinja-wiki]: https://en.wikipedia.org/wiki/Jinja_(template_engine) "Jinja (Template Engine)"

### Note Links

* [Python][py-zk]
* [Web Template Engine][template-zk]
* [Ansible][ansible-zk]
* [Nunjucks (Template Engine)][njk-zk]
* [JavaScript][js-zk]

<!-- Hidden References -->
[py-zk]: ./python.md "Python"
[template-zk]: ./template-engine.md "Web Template Engine"
[ansible-zk]: ./ansible.md "Ansible"
[njk-zk]: ./nunjucks.md "Nunjucks (Template Engine)"
[js-zk]: ./javascript.md "JavaScript"
