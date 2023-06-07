---
created: 2023-05-28T19:46:06.838Z
modified: 2023-06-07T14:49:20.015Z
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

### My Response to Discussion 20.1

#### Case 1 - Imputation of Missing Data

The missing value in row 2 can be predicted by
using a linear regression model built based on the data in rows 0 and 1.
This is potentially a better imputation method than
using the mean or median of the column.
I'll use `sklearn.linear_model.LinearRegression` to
make building a linear regression model easier.

```python
import numpy as np
from sklearn.linear_model import LinearRegression
import pandas as pd

data = np.array([
    [2, 4.3, 8.1],
    [3.7, 5.21, 9.5],
    [5.02, 7.55, np.nan]
])

# Split the data into training and prediction from the rows
# The last row with the missing data is the prediction data
X_train = data[:2, :-1]
Y_train = data[:-1, 2]
Y_predict = data[2, :-1]

# Train a linear regression model
model = LinearRegression()
model.fit(X_train, Y_train)

# Impute the missing value in row 2, column 2
# by using the trained linear regression model.
data[2, 2] = model.predict([Y_predict])[0]
print(data)
```

#### Case 2 - Predictive Model of Real Variable

In the Housing market data,
which is very similar to how we created a model for housing data before
in one of our projects,
we can again use linear regression.
Here we have a fairly simple set of predictive characteristics.
We can create a dataframe of this data by hand fairly quickly,
use it as training data for a linear regression again using `sklearn`,
then we can make an imaginary house with similar characteristics to
one of the houses and see if the prediction makes sense.
Below I did this in python,
then at the end I predicted the price of a house with 6 rooms,
2 bathrooms, 1600 square feet, no deck, no pool, and quality of 8.0.
One would probably expect that despite its slightly larger size,
because the quality is a good bit lower than the $225k house,
that the price will probably be a good bit lower as well.
It is, when this code is run a predicted price of `$201 054` is returned.

```python
# Predictive Model of Real Variables
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression

# Dataframe of the real data - we'll use this to train the model
df = pd.DataFrame({
    'rooms': [10, 12, 5, 5],
    'bathrooms': [2, 3.5, 2, 1],
    'sq.ft.': [1500, 2200, 14000, 2000],
    'pool': [False, True, False, False],
    'deck': [True, True, False, False],
    'quality': [8.3, 9.5, 9, 9.4],
    'price': [325000, 450000, 225000, 175000],
})

# Now we'll create the linear regression model
model = LinearRegression()
# Then train it using the real data as a pandas dataframe
model.fit(df[
  ['rooms', 'bathrooms', 'sq.ft.', 'pool', 'deck', 'quality']
], df['price'])
# Now let's predict the price of an imaginary house
# It's slightly larger than the $225k house, with a lower quality
model.predict([
  [6, 2, 1600, False, False, 8]
])[0] # Price of $201,054 predicted
```

#### Case 3 - Predictive Model of Categorical Variable

I chose the Brooklyn data from the data,
as that's the only place I've lived in NYC.
When I looked at the data,
I just picked a few columns that I thought would be important,
mostly from personal experience and kept it short.

```python
df = pd.read_excel('../data/nyc-sales/rollingsales_brooklyn.xlsx',
                   na_values='',
                   header=4,
                   usecols=['NEIGHBORHOOD', 'BUILDING CLASS AT PRESENT',
                            'RESIDENTIAL UNITS', 'GROSS SQUARE FEET', 'SALE PRICE'],
                   )
print(f'Original dataframe shape: {df.shape}')
df.head()
```

Here we read the data into a dataframe.
Then we need to prepare the data,
there's a lot of missing data in the form of null-like values or 0s where not appropriate.
Here we drop the rows with missing data of various kinds.

```python
df = df.dropna(subset=['BUILDING CLASS AT PRESENT'])
df = df.dropna(subset=['RESIDENTIAL UNITS'])
df = df[df['RESIDENTIAL UNITS'] != 0]
df = df[df['SALE PRICE'] != 0]
df = df.dropna(subset=['GROSS SQUARE FEET'])
for col in df.columns:
    print(col, df[col].isnull().sum())
print(f'New dataframe shape: {df.shape}')
```

This removes a ton of the rows.
We can probably do better than this using imputation,
and consider the context we might be able to leave more of the data in.
Square footage for example is zero 9234 times,
but that's probably because it's not a residential unit and we're only looking at residences.

Then we one-hot encode the categorical data,
the building class and neighborhood are categories so they need boolean columns for each value.
Then we split out some training and prediction data.

```python
df = df.sample(frac=1).reset_index(drop=True)
train_rows = int(df.shape[0] * 0.75)
Y_train = df['SALE PRICE'][:train_rows]
X_train = df.drop(columns=['SALE PRICE'])[0:train_rows]
Y_actual = df['SALE PRICE'][train_rows:]
X_predict = df.drop(columns=['SALE PRICE'])[train_rows:]
print(f'X_train dataframe shape: {X_train.shape}')
print(f'Y_train dataframe shape: {Y_train.shape}')
print(f'X_predict dataframe shape: {X_predict.shape}')
print(f'Y_actual dataframe shape: {Y_actual.shape}')
```

Now we can train the model and evaluate its performance.

```python
model = LinearRegression()
# Then train it using the real data as a pandas dataframe
model.fit(X_train, Y_train)
# Now add a column to the X_predict dataframe with the predicted sale price
X_predict['PREDICTED SALE PRICE'] = model.predict(X_predict)
# Now add a column to the X_predict dataframe with the actual sale price
X_predict['ACTUAL SALE PRICE'] = Y_actual.values
# Now add a column to the X_predict dataframe with the difference between
# - the predicted and actual sale price
X_predict['DIFFERENCE'] =
  (X_predict['ACTUAL SALE PRICE'] - X_predict['PREDICTED SALE PRICE'])
  / X_predict['ACTUAL SALE PRICE']
X_predict.head()
```

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

## Discussion 20.2: The Importance of Optimizing Gradient Descent

### Discussion 20.2 Instructions

As you have learned,
gradient descent is an effective way to
minimize an objective function using input features to
determine the parameters of a model to predict a target variable.
The examples so far have used a constant learning rate,
and the effects of changing this learning rate can affect the ability to
actually find the minimum of the objective function.

In this discussion,
you will focus on the problem of optimization in gradient descent.
Specifically,
you will work on the issue of balancing computational complexity with that of
ensuring that the minimum value is found.
In activity 20.1,
you examined the balance of too small vs. too large a step size to find the minimum.
In addition to these considerations,
other approaches that build on the basic gradient descent algorithm intend to
light the computational mode as well as to utilize dynamic learning rates.

In your discussion post,
answer the following questions regarding issues that
may arise when building a model using gradient descent:

1. A small learning rate avoids overstepping the true minimum.
What issues can arise from using too small of a step size?
2. A larger learning rate means a faster descent towards the minimum.
What issues can arise from using too large of a step size?
3. Using every example from a very large dataset is ideal but
can be very computationally intensive.
Stochastic gradient descent uses a sample of the data to
determine the downward step in each iteration, rather than using the entire dataset.
Do you think the sample size matters in this case? Why or why not?
4. A different approach would be to use a dynamic learning rate that
changes through the iterative cycle.
If you were to use a dynamic learning rate,
would you rather have the learning rate be large at first and smaller later,
or start small and increase as iterations pass?
Why would this type of dynamic learning rate be preferable?

### Discussion 20.2 - My Response

#### 1. Issues of using a Small Learning Rate

A small learning rate results in two major problems.
Firstly, because the rate is small, it takes a much longer time on average to
converge to the minimum of the objective function.
Secondly,
because the rate is so small, the starting point might be closer to a local minimum,
than the global minimum for the objective function.
When this happens, the small learning rate might not be enough to
push the model beyond the valley of the local minimum to
the summit of the global minimum.
So it stays in the local minimum and slowly converges to a sub-optimal solution.

#### 2. Issues of using a Large Learning Rate

A large learning rate, like the small one, results in two main problems again.
Firstly, because the rate is large,
it might overshoot the global minimum of the objective function and
as the error decays it might not have enough momentum to leave the local minima.
This might also result in instability and oscillation around the global minimum.
This second problem is that of stability.
If the learning rate is too large to decay with a reduced error associated with
landing near a minimum,
then the model might oscillate around the minimum and never converge.

#### 3. Sample Size in Stochastic Gradient Descent

The balance in selecting the sample size in stochastic gradient descent is between
computational load and accuracy.
If the sample size is too small then
the learning rate, as we learned in the central limit theorem,
might not be representative of the entire dataset.
This results in a gradient descent that is noisy (or bouncy in other words) and
may not converge accurately to the global minimum nor very quickly.
However, the larger the sample size,
the more data needs to be processed at each step of the gradient descent.
Approaching 100% sample size means you're doing more work than
if you just used a static gradient descent.
One has to strike a balance.

#### 4. Dynamic Learning Rate

The dynamic learning rate is a way to balance the issues of
small and large learning rates.
There are various ways to implement a dynamic learning rate.
But the easiest to reason about is one where you use a linear function where
for each step during the descent, the learning rate is reduced by a constant factor.
That way you start with a large learning rate and
as you perform more steps the learning rate reduces.
This way you get the benefits of a large learning rate at the beginning and
the benefits of a small learning rate at the end.
And large to small learning rates are the best way to converge to a global minimum.
This is because you can quickly move towards a global minimum without much concern for
stability and then as you get closer to the global minimum,
you can reduce the learning rate to reduce chances at overshooting the global minimum.

## Discussion 20.3: Application of Bayes Theorem

### Discussion 20.3 Instructions

In this discussion,
you will apply the ideas of Naive Bayes to
an example in which you are predicting more than two classes.
To do this you will slightly adjust your appraoch and
practice the concept of maximum a posteriori (MAP) estimation.
In this discussion,
you will explain how you can use the Naive Bayes algorithm to
fill in a missing value in a categorical column of
small sample dataset.
An example of the MAP estimation is shown below:

$$
P(y|x_i,\dots,x_n) = P(y) \prod_{i=1}^n \frac{P(x_i|y)}{P(x_1, \dots, x_n)}
$$

In the previous examples, $y$ was a binary variable,
so it was possible to calculate a ratio of posterior probabilities to
determine the classification.

If there are more than two outcomes possiible for the target, $y$,
you will choose the largest posterior probability from all the options.
This is called the MAP estimation.
For example,
suppose that you are using Naive Bayes to predict the species of penguins from
three options:
Adelie, Gentoo, and Chinstrap.
Results are shown below after
computing the posterior probabilities for each species $x_i$:

* $P(Adelie|x) = 0.35$
* $P(Gentoo|x) = 0.45$
* $P(Chinstrap|x) = 0.20$

Clearly the data suggests that
the new observation is most likely to be a Gentoo penguin.
This illustrates the MAP concept because
it demonstrates the selection of of the result,
which maximizes the posterior probability.

For this discussion,
a small dataset is provided that represents a hypothetical student's recent behavior.
Your goal is to determine the missing value for the last row using MAP when
the following criteria are true:
there is an upcoming deadline, no party, and the student feels lazy.
To do so,
you need to compute four posterior probabilities where $x = [near, no party, lazy]$.

* $P(party|x)$
* $P(study|x)$
* $P(pub|x)$
* $P(tv|x)$

| Deadline | Party | Lazy | Activity |
| -------- | ----- | ---- | -------- |
| urgent   | yes   | yes  | study    |
| urgent   | no    | yes  | study    |
| near     | yes   | yes  | party    |
| none     | yes   | yes  | party    |
| near     | no    | no   | study    |
| none     | no    | yes  | pub      |
| near     | no    | yes  | tv       |
| near     | no    | yes  | ???      |

Because this is a small sample,
you won't encounter the issue of extremely small probabilities that
require the use of logarithms.
You will, however,
end up with certain examples that have zero probability.
You can overcome this issue by assigning very small probabilities to
events that were not observed in the training data.
This technique called Laplace smoothing or probability smoothing.

In the discussion post,
address the following prompt:

Explain how smoothing these probabilities changes the computation.
As a reference,
you can use an approach similar to the one shown in the videos when
calculating the probability of whether an email is normal or spam when
they don't have words in common.

### Discussion 20.3 Response

Smoothing probabilities in the context of the Naive Bayes algorithm helps with
the issue of zero probabilities for events not observed in a small dataset.
Smoothing is a technique to assign very small probabilities to these unobserved events.
This ensures no probability is entirely zero, just close to it.
This is important because zero probabilities would lead to
outright rejection of any outcome not observed.
It also messes with the math of the Naive Bayes algorithm because
of the many zero multiplications that would occur.

Laplace smoothing,
though not mentioned by name in this discussion,
is one way to smooth such data.
Commonly people will add one to the numerator and denominator of
the probability calculation.
This guarantees unobserved events still get a small probability in
the MAP estimation.
Particularly overfitting problems get addressed through this smoothing process.

In general,
applying smoothing like this,
the computation of probabilities in the Naive Bayes algorithm becomes more resilient to
small datasets and unobserved events.
It also generalizes data much better than
the harsher borders of possibilities than the purely observed data would suggest.
Ultimately the model becomes more realistic and responsive to real-world events.
Because in the real world,
some things might be literally impossible,
but many things are also just highly unlikely and
smoothing the data like this helps the model account for that,
especially when the sample size is small.

## Discussion 20.4: Use Cases for Naive Bayes and Gaussian Naive Bayes Theorems

### Discussion 20.4 Instructions

When implementing Naive Bayes algorithm in practice,
the choice of the correct probability for the prior term in
Bayes theorem determines which version of Naive Bayes is used.
For example, the popular Python scikit-learn library that
is used for ML algorithms presents three versions of Naive Bayes:
binomial, multinomial, and Gaussian.
Using these theorems requires the selection of
the appropriate version of the estimator for the particular problem.

For the spam email detection example used in previous parts of this module,
you may use either binomial or multinomial versions depending on the way that
the text from the emails is presented.
The Gaussian version of Naive Bayes theorem would be used when
a feature contains continuous numeric values.
Each of the versions of Bayes theorem seeks to predict a target variable.

Your response for this discussion is divided into two parts:

#### Discussion 20.4 Part 1 Instructions

Below, three sample datasets and predictive tasks are provided.
For the first part of your discussion post,
your goal is to identify the appropriate version of Naive Bayes to use to
predict the target column in each of the three datasets according to
the nature of the features.
In the post, make sure to include the following:

* Identify the best version of Naive Bayes theorem to use to
predict the target variable for each of the three datasets
* Justify your reasoning for choosing the version of
the Naive Bayes theorem that you selected for each dataset.

#### Discussion 20.4 Part1 Dataset 1

| Day | Free | Credit | Yours | Money | Target |
| --- | ---- | ------ | ----- | ----- | ------ |
| 2   | 0    | 3      | 1     | 1     | spam   |
| 1   | 1    | 3      | 2     | 0     | spam   |
| 5   | 2    | 4      | 1     | 0     | ham    |
| 3   | 2    | 4      | 1     | 2     | ham    |

#### Discussion 20.4 Part1 Dataset 2

| Day | Free | Credit | Yours | Money | Target |
| --- | ---- | ------ | ----- | ----- | ------ |
| 1   | 0    | 1      | 1     | 1     | spam   |
| 1   | 1    | 1      | 1     | 0     | spam   |
| 1   | 1    | 0      | 1     | 0     | ham    |
| 1   | 1    | 1      | 1     | 1     | ham    |

#### Discussion 20.4 Part1 Dataset 3

| Stem Length | Flower Width | Flower Length | Target |
| ----------- | ------------ | ------------- | ------ |
| 3.2         | 5.6          | 1.2           | rose   |
| 4.1         | 5.5          | 1.1           | rose   |
| 10.2        | 7.6          | 2.0           | tulip  |

#### Discussion 20.4 Part 2 Instructions

For the second part of your discussion post,
consider the five example datasets below.

1. Car Prices in Poland
2. Amazon Alexa Reviews
3. Rings in Abalone Mussels
4. Amazon Product Reviews
5. Classifying Brazilian Business Types

In your discussion include the following:

* Choose one of the five datasets above and provide a brief description of the data.
* Identify the target variable for the dataset *(binomial, multinomial, or Gaussian)*.
* Based on the Naive Bayes theorem that you selected for the dataset,
  describe the features that you would use to predict the target variable.

### Discussion 20.4 Response

#### Discussion 20.4 Part 1

Here in an ordered list, I'll say what I think the best version of
Naive Bayes is for each dataset.

* Spam Prediction Dataset1: Multinomial
  * There's more than two non-numerical possible categories for the target.
* Spam Prediction Dataset2: Binomial
  * Here there's only two non-numerical possible categories for the target.
* Flower Prediction Dataset3: Gaussian
  * The features are continuous numerical values, we need continuous probability.

#### Discussion 20.4 Part 2

I chose the Polish Car Prices dataset.
There's 9 features and a target could frankly be any one of them.
You might want to know how likely a car model is for a given city.
Or maybe the engine volume to make.
These features are either numeric and continuous or categorical and discrete.

The target variable I was interested in was the city the sale occured in.
I figured there might be some relation to the kind and usage of the car and
where it was purchased.
For example, city dwellers might not want a large and heavy car model.
This is categorical data with many values, so the multinomial version of
Naive Bayes is the best choice.
I use all the other features to try and predict the city.

The features that seem most to predict the city are:
mileage, year, sale price, and engine volume.
I won't use the province it comes from because that's very much deterministic.
A city exists in only exactly one province.

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
* [Bayes Theory][-bayes]

<!-- Hidden References -->
[-prob]: probability.md "Probability"
[-matrix]: matrix.md "Matrix"
[-grad-desc]: gradient-descent.md "Gradient Descent"
[-bayes]: bayes-theory.md "Bayes Theory"
