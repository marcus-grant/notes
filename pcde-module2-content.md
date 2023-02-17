---
created: 2023-02-15T20:56:09.436Z
modified: 2023-02-17T08:54:44.771Z
tags: [python,numpy,statistics,probability,math,matplotlib,distribution,pcde,module2,data,visual]
---
# PCDE Course Module 2 Content

## Introduction

INTRO HERE

## Knowledge Check 2.2: Probabilities and Histograms 

* Which type of plot is recommended to display the probability of an event?
  * A line plot
  * A box plot
  * A swarm plot
  * A histogram **(Correct)**
* Which argument should be used in the .hist() function to display the value of
the events’ probability?
  * density **(Correct)**
  * likelihood
  * prob
  * height
* What is the recommended number of bins in
a histogram displaying the probability of 14 possible outcomes?
  * 7 **(INCORRECT)**
  * 10
  * 14 **(Correct)**
  * 28
* What does the `np.random.choice()` function generate?
  * It generates a random sample of strings
  * It generates a random sample of integers **(Correct)**
  * It generates a random sample of floats
  * It generates a random sample of booleans
* An event with a probability of 0.07 is:
  * Guaranteed to happen
  * Never going to happen
  * Very likely to happen
  * Not very likely to happen **(Correct)**
* What is the probability of the event of getting an even # when rolling a die?
  * 0.5 **(Correct)**
  * 0.33
  * 0.16 **(INCORRECT)**
  * 0.66 **(INCORRECT)**
* What is the probability of the event of
drawing a queen from a standard deck of cards?
  * 0.079 **Correct**
  * 0.79
  * 0.81
  * 0.081
* Which of the following is true?
  * Probability & stats are the same
  * Probability is a branch of applied math
  * Probability deals with the likelihood of events a posteriori
  * Probability is a branch of theoretical math **(Correct)**

## Mini Lesson 2.6 Probability Distribution Functions

Mostly uses notes from [Probability][probability-zk] and
[Normal Distribution][normal-dist-zk].

## Knowledge Check 2.3: Probability Density Functions and Histograms

* What is sampling?
  * Sampling is selecting the least significant feature of the data
  * Sampling is extracting a smaller portion of
your data to get a representation of the whole **(Correct)**
  * Sampling is replacing some of your data with other data to obtain better results
  * Sampling is slecting the most significant feature of the data
* Which of the following is true?
  * The area under a distribution can be less than 1
  * Given a histogram of continuous readings,
the probability is computed in terms of an area **Correct**
  * Given a histogram of continuous readings,
the probability is computed in terms of a height
  * The area under a distribution can be greater than 1
* Which of the following is false?
  * A distribution with a smaller variance is narrower than
a distribution with a larger variance
  * Distributions always have different maximum values
  * Distributions with larger variance is narrower than
a distribution with a smaller variance **(Correct)**
  * The mean of a distribution changes given different data
* Which of the following is not a type of random variable?
  * Integer **(Correct?)**
  * Discrete
  * Boolean
  * Continuous
* In a histogram representing the probability of an event:
  * The total area highlighted by the bins must be equal to one **(Correct)**
  * The total area highlighted by the bins does not represent anything
  * The total area highlighted by the bins can equal something other than one
  * The Y-axis represents the possible outcomes of an event
* A good probability density function:
  * Does not change when the number of bins is varied
  * None of these
  * Fits the underlying distribution function for the event in consideration **(Correct)**
  * Cannot be a continuous function
* What is true about the density of the data produced by the following code?
`a = np.random.choice(np.arange(0,10),1000)`
  * You get a density with bins with
similar heights representing 1 000 outcomes 0~9 **(Correct)**
  * You get a density wit bins with
exactly the same height representing 1 000 outcomes between 0~9
  * You get a density with bins with
similar heights representing 1 000 outcomes between 0 and 10
  * You get a density with bins with very different heights representing
1 000 outcomes between 0 and 9

## Mini Lesson 2.7: Basics of Matplotlib

Mostly uses notes from [MatplotLib: Python Plotting Library][py-matplotlib-zk].

## Mini-Lesson 2.8: Types of Matplotlib Plots

Notes are covered in [MatplotLib: Python Plotting Library][py-matplotlib-zk].

## Notes Links

* [NumPy: Numerical Python][py-numpy-zk]
* [Probability][probability-zk]
* [MatplotLib: Python Plotting Library][py-matplotlib-zk]
* [Normal Distribution][normal-dist-zk]

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [NumPy: Numerical Python][py-numpy-zk]
* [Probability][probability-zk]
* [Normal Distribution][normal-dist-zk]
* [MatplotLib: Python Plotting Library][py-matplotlib-zk]

<!-- Hidden References -->
[py-numpy-zk]: ./numpy.md "NumPy: Numerical Python"
[probability-zk]: ./probability.md "Probability"
[py-matplotlib-zk]: ./matplotlib.md "MatplotLib: Python Plotting Library"
[normal-dist-zk]: ./normal-distribution.md "Normal Distribution"
