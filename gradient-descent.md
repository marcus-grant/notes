---
created: 2023-05-29T14:32:27.177Z
modified: 2023-05-29T16:36:20.526Z
tags: [computer,science,math,gradient,descent,machine,learning,optimization,pcde,module20]
---
# Gradient Descent

## Basics

Suppose that you are at the top of a hill,
and you want to reach the bottom in the fastest way possible.
Assume further that there are multiple paths visible to you that
lead to the bottom of the hill.
How can you choose which path will be fastest?

If we look at [derivatives][-deriv],
we can find the rates of changes of different functions at a given point.
In other words, the derivative always points in the direction of the steepest
rate of change or the steepest descent.

***TODO***
Include the image of the parabola equation with the explanation given in
[Mini lesson 20.2](https://classroom.emeritus.org/courses/1412/pages/mini-lesson-20-dot-2-introduction-to-gradient-descent-40-00?module_item_id=623982).

A gradient behaves in the exact same way as a derivative but for multi-valued funcitons.
As an example, consider the function $f(x, y) = x^2 + y^2$.
Given that this function depends on both $x$ and $y$,
you can compute a derivative of
the function with respect to $x$ and the derivative of $y$.

When taking the derivative of $f(x, y)$ with respect to $x$,
you treat $y$ as a constant.
Therefore you can write the following equation to illustrate this example:

$$ \frac{df}{dx} = 2x $$

On the other hand, when taking the derivative of $f(x, y)$ with respect to $y$,
you treat $x$ as a constant.
This results in the following equation:

$$ \frac{df}{dy} = 2y $$

Therefore, the gradient of $f(x, y)$ will be a vector with components $[2x, 2y]$.
Each component of the gradient indicates the direction of steepest descent for
each of the function's variables.
In other words,
the gradient points to the direction in which the function increases the most.

## Gradient Descent Definition

Now that you know how to define a gradient,
you are ready to build on that knowledge by learning how **gradient descent** works.
Gradient descent is an optimization algorithm used in
ML to minimize the cost of a function.
In other words,
you can use gradient descent to minimize the error of a certain algorithm.

If you return to the previous example of climbing down a hill,
you can think of a gradient descent as the technique for
choosing your next step in order to reach the bottom of the hill in
the fastest way possible.

By assuming that you want to travel from point $w_{n-1}$ to point $w_n$,
and given a function $\bold{G}$,
the equation for the gradient descent algorithm is as follows:

$$ w_n = w_{n-1} - \eta \nabla \bold{G} $$

where $\nabla \bold{G}$ is the gradient of the function $\bold{G}$.
Note that in the equation,
you have introduced the learning rate $\eta$.
The learning rate is an important parameter,
as it determines how big the steps of the gradient descent algorithm will be in
the direction of the local minimum.
Using this terminology,
the local minimum represents the point toward which you want to
perform the gradient descent to minimize the error.
For example,
looking at the figure above, the local minimum is given by
the vertex (lowermost point) of the parabola.

Choosing an appropriate learning rate is fundamental to machine learning.
It determines whether and how fast you can reach the bottom of the hill or
(the local minimum of the function).

## Gradient Descent vs. Stochastic Gradient Descent

Another variation of
the gradient descent algorithm is called **stochastic gradient descent**.

The two algorithms are quite similar in the sense that both gradient descent and
stochastic gradient descent update a set of parameters in
an iterative manner to minimize an error function.

The main difference is that while in gradient descent you have to
run through all of the samples in your training set to perform a single iteration,
in stochastic gradient descent you use only
a subset from your training set to an iteration.

Therefore, if the number of training samples is very large,
then using gradient descent may take too long because
in every iteration you are running through the complete training set.
On the other hand,
using stochastic gradient descent can significantly speed up the process because
you only use on training sample.

Additionally, stochastic gradient descent often converges much more quickly than
gradient descent, but
the error function is not a well minimized as in the case of gradient descent.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Derivative][-deriv]

<!-- Hidden References -->
[-deriv]: derivative.md "Derivative"
