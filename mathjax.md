---
created: 2023-02-23T12:35:15.433Z
modified: 2023-06-05T08:56:46.446Z
tags: [latex,math,mathml,html,markdown,markup,language,typeset,document,academic,publish]
---
# MathJax: LaTeX in Markdown

>**NOTE**: Not sure of the best way to organize the relationship between
>MathJax and LaTeX.
>For now, I'm separating MathJax and LaTeX into separate notes.
>In the future it might be best to make MathJaX a sub-section of LaTeX.

## Introduction

**MathJax** to [Wikipedia][mathjax-wiki]:

>MathJax is a cross-browser [JavaScript][js-zk] library that
>displays mathematical notation in web browsers,
>using MathML, LaTeX and ASCIIMathML markup.

So essentially it takes a subset of the [**LaTeX**][latex-zk] syntax,
namely the parts related to mathematical expressions,
and renders it in the browser or on documents in the server,
just like [**LaTeX**][latex-zk] does.

## Blocks

*MathJax* or *LaTeX* blocks are enclosed using curly braces `{}`.
They are essentially function parameters where each brace is a parameter.

The `\frac` function is an example of a function that takes two parameters,
first is the numerator and the second is the denominator.
This is a necessary syntax because sometimes it's hard to
serially express mathemtical expressions in a single line, like with large fractions.

This can also apply to simple operators like the *superscript* operator `^`.
For example, raising a symbol by a negative power creates a problem of interpretation.

```latex
e^-i\pi + 1 = 0
```

The above expression makes it hard to interpret the actual expression which
is Euler's identity.
This is because the `-` is interpreted as a subtraction operator,
so to fix this we need to enclose the exponential parts in braces `{}`.

```latex
e^{ -i\pi } + 1 = 0
```

Which results in this expression:

$$e^{ -i\pi } + 1 = 0$$

## Arithmetic Operators

* **Addition** or $a + b$, expressed with `+` or `\+`
* **Subtraction** or $a - b$, expressed with `-` or `\-`
* **Multiplication** or $a \times b$, expressed in many ways
  * `*` asterisk $a * b$
  * `\times` times $a \times b$
  * `\cdot` dot $a \cdot b$
* **Division** or $a \div b$, expressed in many ways
  * `/` slash $a / b$
  * `\div` division $a \div b$
  * `\frac{numerator}{denominator}` fraction or $\frac{a}{b}$

## Greek Letters

| Letter (lower) | Command (lower) | Letter (Upper) | Command (Upper) |
| :------------- | :-------------- | :------------- | :-------------- |
| $\alpha$       | `\alpha`        | $A$            | `A`             |
| $\beta$        | `\beta`         | $B$            | `B`             |
| $\gamma$       | `\gamma`        | $\Gamma$       | `\Gamma`        |
| $\delta$       | `\delta`        | $\Delta$       | `\Delta`        |
| $\epsilon$     | `\epsilon`      | $E$            | `E`             |
| $\zeta$        | `\zeta`         | $Z$            | `Z`             |
| $\eta$         | `\eta`          | $H$            | `H`             |
| $\theta$       | `\theta`        | $\Theta$       | `\Theta`        |
| $\iota$        | `\iota`         | $I$            | `I`             |
| $\kappa$       | `\kappa`        | $K$            | `K`             |
| $\lambda$      | `\lambda`       | $\Lambda$      | `\Lambda`       |
| $\mu$          | `\mu`           | $M$            | `M`             |
| $\nu$          | `\nu`           | $N$            | `N`             |
| $\xi$          | `\xi`           | $\Xi$          | `\Xi`           |
| $\omicron$     | `\omicron`      | $O$            | `O`             |
| $\pi$          | `\pi`           | $\Pi$          | `\Pi`           |
| $\rho$         | `\rho`          | $P$            | `P`             |
| $\sigma$       | `\sigma`        | $\Sigma$       | `\Sigma`        |
| $\tau$         | `\tau`          | $T$            | `T`             |
| $\upsilon$     | `\upsilon`      | $\Upsilon$     | `\Upsilon`      |
| $\phi$         | `\phi`          | $\Phi$         | `\Phi`          |
| $\chi$         | `\chi`          | $X$            | `X`             |
| $\psi$         | `\psi`          | $\Psi$         | `\Psi`          |
| $\omega$       | `\omega`        | $\Omega$       | `\Omega`        |

>**NOTE**: The uppercase letters in some Greek letters are the same as
>their Latin counterparts.
>Because of this the LaTeX command for uppercase Greek letters that
>are the same as Latin letters are merely those letters in uppercase.
>When a Greek capital letter is different than its Latin counterpart,
>you use the same command as the lowercase version, but the first letter capitalized.

## Miscellaneous

* **Dots** or **Ellipsis** ($\dots$), expressed with `\dots`
* **Dot operators** ($\cdot$), expressed with `\cdot`

## Cheat Sheet

There's a **fantastic cheat sheet**
[post about MathJax syntax][mathjax-cheat-stackexchange].

>**TODO**: Add a summary of the cheat sheet here.

## References

### Web Links

* [MathJax (from Wikipedia, the free encyclopedia)][mathjax-wiki]
* [MathJax basic tutorial & quick reference (from Math.StackExchange by Community)][mathjax-cheat-stackexchange]

<!-- Hidden References -->
[mathjax-wiki]: https://en.wikipedia.org/wiki/MathJax "MathJax (from Wikipedia, the free encyclopedia)"
[mathjax-cheat-stackexchange]: https://math.meta.stackexchange.com/q/5020 "MathJax basic tutorial & quick reference (from Math.StackExchange by Community)"

### Note Links

* [LaTeX][latex-zk]
* [JavaScript][js-zk]

<!-- Hidden References -->
[latex-zk]: ./latex.md "LaTeX"
[js-zk]: ./javascript.md "JavaScript"
