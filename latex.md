---
created: 2023-02-23T12:41:21.621Z
modified: 2023-02-23T12:58:41.350Z
tags: [latex,math,markup,language,typeset,document,academic,publish]
---
# LaTeX

>**NOTE**: Not sure of the best way to organize the relationship between
>MathJax and LaTeX.
>For now, I'm separating MathJax and LaTeX into separate notes.
>In the future it might be best to make MathJaX a sub-section of LaTeX.

## Introduction

**LaTeX** is a document preparation system for high-quality typesetting.
It is most often used for medium-to-large technical or scientific documents
but it can be used for any form of publishing.

According to [Wikipedia][latex-wiki]:

>LaTeX (/ˈlɑːtɛx/ LAH-tekh or /ˈleɪtɛx/ LAY-tekh,
>often stylized as LATEX) is a software system for document preparation.
>When writing, the writer uses plain text as opposed to
>the formatted text found in WYSIWYG word processors like
>Microsoft Word, LibreOffice Writer and Apple Pages.
>The writer uses markup tagging conventions to define the general structure of
>a document, to stylise text throughout a document (such as bold and italics),
>and to add citations and cross-references.

## MathJax

[**MathJax**][mathjax-zk] is a software stack that uses **LaTeX** to
typeset mathematical expressions in web browsers or documents.
Essentially it is a subset of **LaTeX** that only focuses on mathematical syntax.
Depending on the enclosing format, usually [markdown][md-zk] or [HTML][html-zk],
some syntax is used to enclose the LaTeX mathemtical expression.
In [markdown][md-zk], the syntax is `$SOMESTUFF$` for inline and
`$$SOMESTUFF$$` for block.

## References

### Web Links

* [LaTeX (from Wikipedia, the free encyclopedia)][latex-wiki]

<!-- Hidden References -->
[latex-wiki]: https://en.wikipedia.org/wiki/LaTeX "LaTeX (from Wikipedia, the free encyclopedia)"

### Note Links

* [MathJax][mathjax-zk]
* [MarkDown][md-zk]
* [HTML: HyperText Markup Language][html-zk]

<!-- Hidden References -->
[mathjax-zk]: ./mathjax.md "MathJax"
[md-zk]: ./markdown.md "MarkDown"
[html-zk]: ./html.md "HTML: HyperText Markup Language"
