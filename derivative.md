---
created: 2023-05-29T15:28:48.921Z
modified: 2023-05-29T16:29:52.000Z
tags: [derivative,calculus,math,slope]
---
# Derivative

## Introduction

>In mathematics,
>the **derivative** shows the sensitivity of change of a function's output with
>respect to the input.
>Derivatives are a fundamental tool of [calculus][-calc].
>For example,
>the derivative of the position of a moving object with
>respect to time is the object's velocity:
>this measures how quickly the position of the object changes when time advances.
>
>--[Wikipedia 2023][wiki-deriv]

## Basics

A function of a real variable $f(x)$ is *differentiable* at a point $a$ of its domain,
if its domain contains an open interval $I$ containing $a$ and the [limit][-limit]

$$ \lim_{h \to 0} \frac{f(a + h) - f(a)}{h} $$

exists.
This means that,
for every positive real number $\epsilon$,
there exists a real positive number $\delta$ such that,
for every $h$ such that $0 < |h| < \delta$,
the $f(a + h)$ is defined and

$$ \left| \frac{f(a + h) - f(a)}{h} - L \right| < \epsilon $$

where the vertical bars denote the absolute value.

## Rules of Computation

The derivative of a function can, in principle,
be computed from the definition by considering the difference quotient,
and computing its limit.
In practice, once the derivatives of a few simple functions are known,
the derivatives of
other functions are more easily computed using **rules of differentiation**.

### Rules for Basic Functions

Here are the rules for the derivatives of the most common basic functions,
where $a$ is a real number.

#### Derivatives of Powers

$$ \frac{d}{dx} x^n = n x^{n - 1} $$

#### Derivatives of Exponential and Logarithmic Functions

$$ \frac{d}{dx} e^x = e^x $$
$$ \frac{d}{dx} a^x = a^x ln(a), a > 0 $$
$$ \frac{d}{dx} ln(x) = \frac{1}{x}, x > 0 $$
$$ \frac{d}{dx} log_a(x) = \frac{1}{x ln(a)}, x > 0, a > 0 $$

#### Trigonometric Functions

$$ \frac{d}{dx} sin(x) = cos(x) $$
$$ \frac{d}{dx} cos(x) = -sin(x) $$
$$ \frac{d}{dx} tan(x) = sec^2(x) = \frac{1}{cos^2(x)} = 1 + tan^2(x) $$

### Rules for Combinations of Functions

#### Constant Rule

If $f$ is constant, then for all $x$,

$$ \frac{d}{dx} f(x) = f'(x) = 0 $$

#### Sum Rule

For all functions $f$ and $g$ and all real numbers $\alpha$ and $\beta$,

$$ (\alpha f + \beta g)' = \alpha f' + \beta g' $$

#### Product Rule

For all functions $f$ and $g$,

$$ (fg)' = f'g + fg' $$

As a special case,
this rule includes the fact $(\alpha f)' = \alpha f'$ whenever $\alpha$ is a constant,
because $\alpha f = 0 \cdot f = 0$ by the *constant rule*.

#### Quotient Rule

For all functions $f$ and $g$ at all inputs where $g \neq 0$,

$$ \left( \frac{f}{g} \right)' = \frac{f'g - fg'}{g^2} $$

#### Chain Rule

Applies to composite functions, *i.e.* functions of functions like $h(g(x))$,

$$ f = (h \circ g)' = h'(g(x)) \cdot g'(x) $$

## References

### Web Links

* [Derivative (from Wikipedia, the free encyclopedia)][wiki-deriv]

<!-- Hidden References -->
[wiki-deriv]: https://en.wikipedia.org/wiki/Derivative "Derivative (from Wikipedia, the free encyclopedia)"

### Note Links

* [Calculus][-calc]
* [Limits (Mathematical)][-limit]

<!-- Hidden References -->
[-calc]: calculus.md "Calculus"
[-limit]: limit.md "Limits (Mathematical)"
