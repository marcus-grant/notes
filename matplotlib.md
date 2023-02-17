---
created: 2023-02-15T22:01:18.000+01
modified: 2023-02-15T22:01:18.000+01
tags: [matplotlib,python,plot,visual,pcde,module2,data]
---
# Matplotlib: Python Plotting Library

Hello World!

## Histograms

Say you have a list of randomly chosen numbers, perhaps chosen using numpy,
how would you want to visually inspect the distribution?
Histograms are the best way to plot this relationship.

Histograms are concerned with the outcomes of [random variables][prob-randvar-zk].
They examine the distribution of possible outcomes of
a single random variable.
To learn more read the previously linked notes on the theory,
in the more broad [probability theory notes][prob-zk].

To do this, we will use the `hist` function from the `matplotlib.pyplot` module.
After generating a list of random numbers, we can plot a histogram of
the distribution of the randomly chosen numbers.

```python
# Data as sampling from an unseen population
# Choose at random from 0 through 9
import numpy as np
import matplotlib.pyplot as plt
# np.random.seed(69)

a = np.random.choice(np.arange(0, 10), 100)
plt.hist(a, bins=10)
```

This simply chooses 100 random numbers from 0 through 9, and plots a histogram.
The `bins` parameter specifies the number of bins to use in the histogram.
The resulting chart looks like this:

![basic-histogram](2023-02-16-17-01-18.png)

### Bins

One of the most important decisions made when
creating histograms is the number of **bins** to use.
The number of bins is a tradeoff between
the amount of detail in the histogram
and the amount of information lost due to *binning*.

In matplotlib, the number of bins is specified using the `bins` parameter,
as was seen before.
It can however be specified in a number of different ways.
Such as: a numpy or python `range` object, or a list of bin edges.
The below code is just as valid and produces bins 0 through 10 inclusive.

```python
plt.hist(a, bins=np.arange(0, 11))
```

Each bin tells us how many times a value fell within that bin.
Since this is random set of 100 numbers,
the number represented by each bin above is actually a percentage of the total.

#### Problem of Bin Size

A lot of tweaking is involved in choosing the right number of bins.
The number of bins is a tradeoff between the amount of detail in the histogram
and the amount of information lost due to *binning*.

To read more about it, [allaboutcircuits.com has a great article][normal-dist-hists-circuits]
on histograms in general and on the problem of bin size.
And [here is a great interactive tool][bin-size-tool] to
help you visualize the problem and
get a feel for how to choose the right number of bins.

***TODO: Add more details on the problem of bin size in probability.md***

But to summarize:

* Each bin with at least one value in it is called a **bin with mass**.
* There should be no bins with no mass between bins with mass.
* Generally, histograms show somewhat Guassian distributions.
  * Therefore the bins should follow that general shape.

## References

### Web Links

* [Probability Density Function (from probabilitycourse.com)][intro-prob-density]
* [The Normal Distribution: Understanding Histograms & Probability (from allaboutcircuits.com by Robert Keim)][normal-dist-hists-circuits]
* [Interactive Histogram Bin Sizing Learning Tool][bin-size-tool]

<!-- Hidden References -->
[intro-prob-density]: https://www.probabilitycourse.com/chapter4/4_1_1_pdf.php "Probability Density Function (from probabilitycourse.com)"
[normal-dist-hists-circuits]: https://www.allaboutcircuits.com/technical-articles/normal-distribution-understanding-histograms-probability/ "The Normal Distribution: Understanding Histograms & Probability (from allaboutcircuits.com by Robert Keim)"
[bin-size-tool]: http://www.shodor.org/interactivate/activities/Histogram/ "Interactive Histogram Bin Sizing Learning Tool"

### Note Links

* [Probability][prob-zk]
* [Probability: Random Variables][prob-randvar-zk]

<!-- Hidden References -->
[prob-zk]: ./probability.md "Probability"
[prob-randvar-zk]: ./probability.md#random-variables "Probability: Random Variables"
