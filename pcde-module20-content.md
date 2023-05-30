---
created: 2023-05-28T19:46:06.838Z
modified: 2023-05-30T19:22:37.695Z
tags: [pcde,module20,machine,learn,probability,statistics,gradient,descent,bayes,gauss]
---
# PCDE Course: Module 20 Content

## Introduction

In this module, you will explore some concepts of
**machine learning** (**ML**) and advanced probability.
First, you will learn about key mathematical concepts that
are at the foundation of some ML algorithms.
Then, you will be introduced to the algorithm of gradient descent,
which is used to minimize the errors in some ML models.
Next, you will learn about advanced probabilliity concepts.
You will delve into Bayes theorem,
Naive Bayes theorem and Gaussian Naive Bayes theorem and
consider real-world applications of each of these algorithms to make predictions.
Finally, you will learn how to implement ML algorithms using Scikit-learn.
In the final assignment,
you will implement Naive Bayes and
Gaussian Naive Bayes classifiers using the Python Scikit-learn library.

## Knowledge Check 20.1: Mathematical Fundamentals

* Q1: In the cartesian plane, if a point **A** in the third quadrant is reflected on
the **Y**-axis, and the resulting point is called **B**, what is the sign of point **B**?
  * (+, -) **(Correct)**
* Q2: If a prediction function is linear in form of $y = 3x + 5$,
what is the estimate for $y$ when $x = 5$?
  * 20 **(Correct)**
* Q3: How can the dimensionality of a matrix be defined?
  * The number of rows by the number of columns **(Correct)**
* Q4: What is the resulting matrix of $\boldsymbol{A} - \boldsymbol{B}$?
Assume that $\boldsymbol{A} = \begin{bmatrix} 4 & 8 \\ 7 & 3 \end{bmatrix}$ and
$\boldsymbol{B} = \begin{bmatrix} 1 & 0 \\ 5 & 2 \end{bmatrix}$.
  * $\begin{bmatrix} 3 & 8 \\ 2 & 1 \end{bmatrix}$ **(Correct)**
* Q5: What is the resulting matrix of $\boldsymbol{A}\boldsymbol{B}$?
Assume the following are true:
  * $\boldsymbol{A} = \begin{bmatrix} 4 & 8 \\ 7 & 3 \end{bmatrix}$
  * $\boldsymbol{B} = \begin{bmatrix} 1 & 0 \\ 5 & 2 \end{bmatrix}$
    * $\begin{bmatrix} 44 & 16 \\ 22 & 6 \end{bmatrix}$ **(Correct)**
* Q6: What is the probability of getting an odd number by rolling a fair die once?
  * $\frac{1}{2}$ **(Correct)**
* Q7: What is the derivative of $f(x) = 2e^x$?
  * $2e^x$ **(Correct)**
* Q8: What is the derivative of $f(x) = (5x)^3$?
  * $15x^2$ **(Correct)**

## Discussion 20.1: Use Cases of Linear Regression

### Use Case 1: Imputation of Missing Data

One use case for linear regression is the imputation of missing values in a dataset.
In this case, the goal is to use gradient descent and linear regression to
predict the missing value and replace the empty value with
the one predicted by the model.
For example, given the sample array below,
consider how you could use a linear regression model built based on
the data in rows 0 and 1 to predict the missing value in row 2.
See the sample data below:

| Index | $x_0$ | $x_1$ | $x_2$ |
| ----- | ----- | ----- | ----- |
| 0     | 2     | 4.3   | 8.1   |
| 1     | 3.7   | 5.21  | 9.5   |
| 2     | 5.02  | 7.55  | NaN   |

### Use Case 2: Predictive Model of Real Variable

Another use case for linear regression is to build a predictive model for
a continuous valued variable.
For example, imagine that you work for a real estate firm and
want to build a linear regression model to predict house prices.
Your firm is interested in using such a model to
identify underpriced homes on the market as a tool for engaging active buyers.
For example, suppose that you have the following housing market data:

| # Rooms | # Bathrooms | Sq. Ft. | Pool | Deck | Quality | Price |
| ------- | ----------- | ------- | ---- | ---- | ------- | ----- |
| 10      | 2           | 1500    | no   | yes  | 8.3     | $325k |
| 12      | 3.5         | 2200    | yes  | yes  | 9.5     | $450k |
| 5       | 2           | 1400    | no   | no   | 9       | $225k |
| 5       | 1           | 2000    | no   | no   | 9.4     | $175k |

In this case,
you would use the Number of Rooms, Number of Bathrooms, Square Footage, Pool,
Deck, and Total Quality columns as your features $X$ to
build a linear regression model to predict the price of a house.

### Use Case 3: New York City Housing Market

Your task for this discussion is to consider the use case of
building a regression model to predict house prices.
For the data,
you are to choose a borough from New York City and
consult the [New York City Rolling Sales Data][nyc-rolling-sales] repository in
which house sales data from 2021 are reported for each of the boroughs.
Note that these datasets contain sale price information and a number of
other informative features about each building,
many of which contain missing data.
When building a model, you need a numeric representation of
every observation and cannot have missing values in your data.

In your discussion post, make sure you address the following:

* Briefly identify the dataset that
you used from the [New York City Rolling Sales Data][nyc-rolling-sales].
* What is an appropriate strategy for handling missing values in observations?
  * For example, should you impute with regression, drop null values,
or determine a different approach?
  * Analyze in detail how you would handle the missing data in your dataset.
* Discuss the features of the dataset that you believe would be important in
building a linear regression model.
  * Why did you choose these features?
* Justify both your approach for handling the missing data and your rationale for
selecting features to build a predictive house price model.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and questions to
deepen the discussion.

**Suggested Time**: 60 minutes

**Suggested Length**: 250-300 words

## Knowledge Check 20.2: Gradient Descent

* Q1: In Numpy, how are the weights for a linear regression represented?
  * They can be either **(WRONG)**
  * As a row vector **(Correct)**
* Q2: How can the loss function be defined for linear regression?
  * Using the least of the mean squared error **(Correct)**
* Q3: What is the $\eta$ used in the gradient descent of linear regression?
  * The learning rate **(Correct)**
* Q4: In the gradient descent example by Dr. Williams,
what is important to keep in mind to find the optimal $\eta$?
Select all options
  * A larger learning rate may result in overstepping across the local minimum
  * A smaller learning rate may take forever to reach the local minimum
  * A larger learning rate may overstep across the global minimum
  * A larger learning rate 

## References

### Web Links

* [City of New York. "Rolling Sales Data." NYC Department of Finance. 2022.][nyc-rolling-sales]
  * ["https://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page"][nyc-rolling-sales]

<!-- Hidden References -->
[nyc-rolling-sales]: https://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page "NYC Rolling Sales Data"

### Note Links

* [Probability][-prob]
* [Matrix][-matrix]
* [Gradient Descent][-grad-desc]

<!-- Hidden References -->
[-prob]: probability.md "Probability"
[-matrix]: matrix.md "Matrix"
[-grad-desc]: gradient-descent.md "Gradient Descent"
