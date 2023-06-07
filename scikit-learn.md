---
created: 2023-06-07T14:46:28.383Z
modified: 2023-06-07T15:51:27.000Z
tags: [sklearn,python,library,machine,learn,algorithm,data,analysis,pcde,module20]
---
# SciKit-Learn

## What is SciKit-Learn?

SciKit-Learn is a [Python][-py] library that
offers support for implementing the vast majority of machine learning algorithms.
It is arguable the most useful ML library in Python because
it contains many functions and tools for implementing predictive algorithms and
performing statistical analysis of data.

## Install

The `scikit-learn` library can be installed using `pip`.
To install, just enter the following command in your terminal:

```bash
pip install scikit-learn
```

Once installed, you can verify it works by opening the Python REPL,
using the `python` command by itself.
Then trying to `import` the library by entering the following command:

```python
import sklearn
```

## Training vs Testing Datasets

Before diving deeper into how to use SciKit-Learn,
it is important to understand how to treat the data that
is provided to make the desired prediction.

Suppose you are given a dataset with 1000 rows and two columns,
one that contains the hours that a student spent on an assignment and
the other contains the grade on that assignment.
Assume that you want to use linear regression to
predict the grade of a student based on how many hours were spent on the assignment.

Given that you are provided with only one dataset,
you need to find a way to use the data both to
train the linear regression algorithm to make an accurate prediction and to
test the predictions.
In other words,
you want to split the data into a training set and a testing set.
The training set will be used to train the predictive algorithm,
and the testing set will be used to test the accuracy of the algorithm.

Consider the following example.
Suppose you are given a dataframe, `df`,
that contains the two columns describe above.
The first step will be to seperate the data into two dataframes,
`X` and `y`.
The `X` is the conventional name for the dataframe that contains
feature data that are *independent* that will be used to make the prediction of
the *dependent* or *target* variable, `y`.

Then, you can define `X` and `y` to be:

```python
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values
```

After this step,
you need to split each set into a training and a testing set.
This can be quickly accomplished by using the `train_test_split` function in
the `sklearn.model_selection` module.

```python
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y)
```

Here the code splits `X` and `y` into training and testing sets.
The testing set will contain 20% of the original data.
Setting the `random_state` variable equal to a certain value (in this case 0) will
ensure reproducibility of the results.

>**Note**: This is a fundamental step in machine learning.
>Using too much of the data to train the model will risk overfitting the model.
>This makes future predictions more brittle and less responsive to real-world data.

## Select Applications of SciKit-Learn

SciKit-Learn is extremely popular,
not only because it offers access to a wide range of ML algorithms,
but also because it was built so almost any learning algorithm can be built using it.

### First Example Application

This example illustrates how to implement linear regression using SciKit-Learn.
The first step is to import the necessary libraries.
Because you want to implement linear regression,
you need to import the `linear_model` module from SciKit-Learn.

```python
from sklearn import linear_model,train_test_split
```

Next suppose that you have a dataframe, `df`.
As explained, you need to define which columns of the `df` dataframe will be used as
`X` values and which will define the variable *target* or *dependent* variable, `y`.

```python
X = df.iloc[:, :-1].values
y = df.iloc[:, 1].values
```

Then, you need to split the data into training and testing sets.

```python
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0)
```

After doing so,
you are ready to train your linear regression algorithm.
First, initialize the `r` classifier:

```python
r = LinearRegression()
```

Once this is done,
you can retrieve the intercept and the coefficient of the line of best fit for
your data:

```python
print(r.intercept_)
print(r.coef_)
```

Finally, you can use the `predict` method to make predictions on the testing set:

```python
y_pred = r.predict(X_test)
```

Although the example above applies to linear regression,
the fundamental idea to keep in mind is that
essentially any ML algorithm can be used in SciKit-Learn by
following these same steps.

A comprehensive list of examples can be found in
the [SciKit-Learn Docs][sklearn-user-guide].

## References

### Web Links

* [Scikit-Learn Developers. “User Guide.” Scikit-Learn. 2021. Accessed June 7, 2023.][sklearn-user-guide]

<!-- Hidden References -->
[sklearn-user-guide]: https://scikit-learn.org/stable/user_guide.html "Scikit-Learn User Guide"

### Note Links

<!-- Hidden References -->
