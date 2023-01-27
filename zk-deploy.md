---
created: 2022-12-02T13:34:27.197Z
modified: 2022-12-02T17:12:18.617Z
tags: [zk,utils,learning,notes,productivity,automation,cicd,software]
---
# Zettelkasten Deploy

The modern [Zettelkasten Method](zk.md) will often involve ways of *deploying* the notes taken as
part of the method to make reviewing and refining notes more pleasant.
This will typically involve some complex software suite made by proprietary developers.
It could also include highly customizable [FOSS](FOSS.md) software like detailed here.
This usually will mean turning notes into something else;
like webpages or other document formats.

## The Build Phase Overview

This is where the notes get transformed.
My method is to use [nextjs.md](nextjs.md) to generate a statically generated site.
This makes the notes pleasant to look at, but also easily browsed and searched.
Crucial aspects of the *Zettelkasten Method*.
Many other implementations of the build phase are possible of course.

The build phase can also involve a lot of different **middleware** to
customize how the transformation occurs.
This can be anything from:
text expansion, styling, customizing links, generate metadata and so on.

## Text Expansion Middleware

When [notetaking](notetaking.md) or
communicating it's common to employ [text expansion](text-expansion.md).
This can be nice to keep in the original documents to store the [zettles](zk.md).
For the sake of keeping text line lengths as narrow as possible for some editors,
including terminal based ones where you're often short on width.
However,
when reviewing the notes it can be really nice to expand them to
their intended meaning instead.

[Here](zk-text-expansion.md) is a method of implementing text expansion of notes using
a middleware script.
This will parse the notes during the build phase and look for shorthands to
expand to their intended meaning.

## Linting

### Markdown Linting

It's important to maintain consistent style based on
well thought through style guides when using software,
even when writing down only markup.
There are markdown linters that should be part of an editor's plugins and
build phase middleware like [markdownlint][markdownlint-gh].
This tool has great support for editors like [VSCode](vscode.md) and [NeoVim](neovim.md).

### Spelling & Grammar Checks

It would really help the readability of the documents if they were spelled well and
used proper grammar.
This can be augmented with spelling and grammar linters like [vale][vale-gh]
or [write-good][write-good-gh].

### Cheat Sheet Generation

Another useful method is to use or create software that generates
cheat sheets for exams when
[note-taking for lectures](notes-lectures.md#re-organize-your-notes-in-the-style-tested-in).
Something like [mdtarhini's Cheat Sheet Maker][cheat-sheet-maker-gh] is
a great way to generate the results.

## References

* [Cheat-Sheet Maker by mdtarhini on Github][cheat-sheet-maker-gh]
* [Markdownlint: A nodejs style checker & lint tool for Markdown/CommonMark (by DavidAnson on Github)][markdownlint-gh]
* [Vale: Your style, our editor (by errata-ai)][vale-gh]
* [Write Good: A linter for English Prose (by btford on Github)][write-good-gh]

<!-- Hidden Reference Links Below Here -->
[cheat-sheet-maker-gh]: https://github.com/mdtarhini/cheat-sheet-maker "Cheat-Sheet Maker by mdtarhini on Github"
[markdownlint-gh]: https://github.com/DavidAnson/markdownlint "Markdownlint: A nodejs style checker & lint tool for Markdown/CommonMark (by DavidAnson on Github)"
[vale-gh]: https://github.com/errata-ai/vale "Vale: Your style, our editor (by errata-ai)"
[write-good-gh]: https://github.com/btford/write-good "Write Good: A linter for English Prose (by btford on Github)"
