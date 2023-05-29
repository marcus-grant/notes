---
created: 2023-05-29T13:28:45.749Z
modified: 2023-05-29T14:29:15.000Z
tags: []
---
# Matrix

## Basics

Mathematically an **array** or **matrix** is define by arranging numerical or
symbolic elements.
The elements are arranged in rows and columns and in a specific order.
In its simplest form an *array* containing only one element is a **scalar** value.
For example:

$$ \boldsymbol{A} = [2] $$

is a *scalar* representing a single number 2.
Also note that matrices are typically denoted by boldface capital letters.

A vector is an array that contains only one row or column,
each containing multiple elements.
Note that vectors are two-dimensional arrays with
dimensions $1 \times n$ or $n \times 1$,
where $n$ is the number of elements in the vector's row or column.
If a vector contains only one row, it is a horizontal *(or row)* vector.
If a vector contains only one column, it is a vertical *(or column)* vector.

For example:

$$ \boldsymbol{A} = \begin{bmatrix} 1 & 2 & 3 \end{bmatrix} $$

is a *horizontal vector* with dimensions $1 \times 3$ and elements 1, 2, and 3.

On the other hand,

$$ \boldsymbol{B} = \begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix} $$

represents a vertical vector with three rows and one column and elements equal to
1, 2, and 3.

A matrix is a two-dimensional array that has a fixed number of rows and columns and
contains a number at the intersection of each row and column.
A matrix, like vectors and scalars,
is usually delimited by square brackets.
In general a matrix has dimensions of $m \times n$,
where $m$ is the number of rows and $n$ is the number of columns.
If $m = n$, the matrix is called a **square matrix**.

In general, a matrix with dimensions of $m \times n$ is defined by
using the following notation:

$$ \boldsymbol{A} = \begin{bmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{bmatrix} $$

where $a_{ij}$ is the element in the $i$th row and $j$th column.

## Algebraic Operations

### Addition and Subtraction

If $\boldsymbol{A}$ and $\boldsymbol{B}$ are matrices of the same size,
then their sum $\boldsymbol{C} = \boldsymbol{A} + \boldsymbol{B}$ is also a matrix,
where each element of that new matrix is the sum of
the correspondingly positioned elements.
For example, given:

$$ \boldsymbol{A} = \begin{bmatrix}
1 & 2 \\
3 & 4
\end{bmatrix} $$

and

$$ \boldsymbol{B} = \begin{bmatrix}
5 & 6 \\
7 & 8
\end{bmatrix} $$

then

$$ \boldsymbol{C} = \boldsymbol{A} + \boldsymbol{B} = \begin{bmatrix}
1 + 5 & 2 + 6 \\
3 + 7 & 4 + 8
\end{bmatrix} = \begin{bmatrix}
6 & 8 \\
10 & 12
\end{bmatrix} $$

The same is true for subtraction,
just apply a negative sign to the second matrix being subtracted.

### Scalar Multiplication

Scalar multiplication seems different than just plain multiplication.
This is true, you can multiply matrices in different ways.
Scalar multiplication is the simplest form of matrix multiplication.
You take one matrix and multiply it by a single number.
Given the scalar $\boldsymbol{S}$,

$$ \boldsymbol{S} = 2 $$

and the matrix $\boldsymbol{A}$,

$$ \boldsymbol{A} = \begin{bmatrix}
1 & 2 \\
3 & 4
\end{bmatrix} $$

then their product is given by:

$$ \boldsymbol{P} = \boldsymbol{S} \boldsymbol{A} = \begin{bmatrix}
2 \times 1 & 2 \times 2 \\
2 \times 3 & 2 \times 4
\end{bmatrix} = \begin{bmatrix}
2 & 4 \\
6 & 8
\end{bmatrix} $$

### Matrix Multiplication

Things get more complicated when multiplying two matrices,
*i.e. matrices both with more than one element in both rows and columns*, together.
In this case,
the number of columns of the leftmost matrix must be equal to
the number of rows of the rightmost matrix.
If $\boldsymbol{A}$ is a matrix with dimensions $m \times n$ and
elements $a_{ij}$ for $i = 1, 2, \ldots, m$ and $j = 1, 2, \ldots, n$ and 
$\boldsymbol{B}$ is a matrix with dimensions $n \times p$ and
elements $b_{ij}$ for $i = 1, 2, \ldots, n$ and $j = 1, 2, \ldots, p$,
then the product $\boldsymbol{C} = \boldsymbol{A} \boldsymbol{B}$ is a matrix
that has dimensions $m \times p$ and elements $c_{ij}$ for
$i = 1, 2, \ldots, m$ and $j = 1, 2, \ldots, p$ and where

$$ c_{ij} = \sum_{k=1}^n a_{ik} b_{kj} $$

For example, given $\boldsymbol{A}$

$$ \boldsymbol{A} = \begin{bmatrix}
1 & 2 \\
3 & 4
\end{bmatrix} $$

and $\boldsymbol{B}$

$$ \boldsymbol{B} = \begin{bmatrix}
5 & 6 \\
7 & 8
\end{bmatrix} $$

then their product is given by

$$ \boldsymbol{C} = \boldsymbol{A} \boldsymbol{B} = \begin{bmatrix}
1 \times 5 + 2 \times 7 & 1 \times 6 + 2 \times 8 \\
3 \times 5 + 4 \times 7 & 3 \times 6 + 4 \times 8
\end{bmatrix} = \begin{bmatrix}
19 & 22 \\
43 & 50
\end{bmatrix} $$

You take the sum of products of the elements in the rows of the first matrix
and the columns of the second matrix when
determining the element in the product matrix of the first row and first column.

### Dot Product

The **dot product** is one way of multiplying two vectors together.
However the result of the dot product is a scalar.
This scalar indicates the degree to which the two vectors are similar.
Both in terms of magnitude and orientation.
The dot product is also known as the **scalar product** or **inner product**.
The dot product is defined as:

$$ \boldsymbol{A} \cdot \boldsymbol{B} = \sum_{i=1}^n a_i b_i $$

where $a_i$ and $b_i$ are the elements of the vectors $\boldsymbol{A}$ and
$\boldsymbol{B}$.

## References

### Web Links

<!-- Hidden References -->

### Note Links

<!-- Hidden References -->
