---
created: 2023-02-01T16:23:54.310Z
modified: 2023-02-03T12:59:19.395Z
tags: [python,statistics,probability,math,data,analysis,science,pcde,module7]
---
# Statistics in Python

## Introduction

### TESTING OF AUTOMATIC BUILDS!!!!

Python is one of the main ways that data engineers &
data scientists today analyze data using statistical methods.
This will go over some of the [python][py-zk] specific details in
how we analyze statistics on a dataset.

>Note: A lot of these topics should be covered more substantively in
>a *statistics* or [*probability*][prob-zk] note.

### Topics

*the below list is the agenda for module 7 in the [PCDE course][pcde-overview-zk]*

* Normal Distribution
  * Mean
  * Variance
  * Unbiased Variance
* Building a model to predict housing prices
  * Data: over 1000 houses with 80 data points each
  * Predicting the dependent variable using independent variables
  * Finding the correlation of independent variables with the dependent variable
  * Using 4 columns out of 80 for the model
    * Finding the most correlated variables allows making the best predictions

## Sample Variance vs. Population Variance

The problem we're usually trying to solve is that
there's a *population* out there and
we can't sample all of them.
But we still need to try to *infer* the statistics that apply to
the whole population.

```mermaid
flowchart TD
direction LR
    A[Population fa:fa-people-group]
    A --> |Sampling fa:fa-magnifying-glass| B[Sample fa:fa-person]
    A --> |Inference fa:fa-thought-bubble| B
```

So let's take a look at an example.
We might be talking about the blood pressure of a population,
let's say an entire country like Sweden.
It will become clear that as we take different samples from different parts of
the country,
we'll see that depending on the sample,
different means will appear.

That's normal.
We can only expect for variances to occur in different sample means taken from
different parts of the population.

### Estimating Population Statistics from a Sample

Take this series of numbers:

```mermaid
graph TD
  A[5, 4, 4, 9, 9, 8, 2, 0, 3, 6]
  A --> B[Mean = 5, Variance = 8.2]
```

These were generated from using a uniform random distribution.
It turns out that:

* Mean = 5
* Variance = 8.2

You can see visually, roughly the variance.
There's numbers like 0 & 9,
so there's 10 values with the middle linearly being 5.

*Variance $\sigma^2$ is computed as*

$\sigma^2 = \frac{\Sigma(x - \mu_x)}{N}$

*Where the $\mu$ (mu or mean) above is computed using*

$\mu_x = \frac{\Sigma_nx_n}{N}$

Let's work through this example to verify the calculation.

$\mu_x = \frac{5 + 4 + 4 + 9 + 8 + 2 + 0 + 3 + 6}{10} = \frac{50}{10} = 5$

Then let's shift the sample mean *x* so it matches the population mean *X*.

Shifted $x, X = x - \mu_x$

This places the 0 of the x-axis around the mean, *normalizing* it.
This is part of calculating *variance* & the *standard deviation*.

Let's take a random sample of five within that population:

```txt
[5, 4, 9, 8, 6]
```

This produces a *mean* of `6.4` & *variance* of `3.4`.
That's quite different from the *mean* of 5 and
*variance* of `8.2` that the population had.
This clear when examining the numbers,
the minimum is `4`, the maximum is `9`,
it's clear that the variance is going to be lower and
the mean is going to be higher.

![variance-mean-sample-error](2023-02-01-18-19-50.png "Population sample mean and variance error")

* Generate a population of 200 from a uniform random distribution
* Pick samples of 50 and calculate mean & variance
  * Subtract the mean & variance from the original mean & variance
* Notice the error in the error in variance doesn't appear
* Below is a solution
  * Instead of dividing by N, divide by N-1

![variance-mean-sample-error-unbiased](2023-02-01-18-20-57.png)

Now the variance converges quite well, what's up with that?
Let's see what happens in python, with a little notebook analysis.

```python
import numpy as np

p = np.array([5, 4, 4, 9, 9, 8, 2, 0, 3, 6])
pmean = p.mean()
pvar = np.var(p)
s = np.array([5, 4, 9, 8, 2])
smean = s.mean()
svar = np.var(s, ddof=0)
pmean, smean, pvar, svar
# Results: (5.0, 5.6, 8.2, 6.64)
```

We calculate the mean `pmean`, and variance `pvar`.
Then we take the small random sample `s`.
Then we get the *sample* mean & variance:
`svar` & `smean` using `np.var` & `np.mean`.
Now let's try again by dividing by N - 1 instead.

```python
import numpy as np

p = np.array([5, 4, 4, 9, 9, 8, 2, 0, 3, 6])
pmean = p.mean()
pvar = np.var(p)
s = np.array([5, 4, 9, 8, 2])
smean = s.mean()
svar = np.var(s, ddof=1)
pmean, smean, pvar, svar
# Results: (5.0, 5.6, 8.2, 8.3)
```

Notice how when the `ddof` or
the *delta degrees of freedom* changes from 0 to 1,
The variance suddenly changes from `6.64` to `8.3`.

### Sources of Bias

Statisticians realized this disparity and formalized it as **Bessel's correction**.
To read a bit more about it,
here's [Wikipedia's Article about Bessel's Correction][bessel-correction-wiki].
Essentially when taking a sample from a population,
the *variance* can differ from the *population variance* immensely.
Let's look at the extreme case.
Here's a population.

$(0, 0, 0, 1, 2, 9)$

$\mu = 2, \sigma^2 = 10.33$

Sample: $(0, 2)$

$\mu_x = 1$,
$\sigma^2 (uncorrected) = \frac{(x_1 - \bar{x})^2 + (x_2 - \bar{x})^2}{N}$
$= \frac{(1+1)}{2} = 1$

$\mu_x = 1$,
$\sigma^2 (corrected) = \frac{(x_1 - \bar{x})^2 + (x_2 - \bar{x})^2}{n-1}$
$= \frac{(1+1)}{1} = 2$

Because of the smaller possibilities presented by a sample,
getting the *variance* of the sample is biased towards smaller numbers than
what is expected for any given sample.
When samples are larger and closer to the population size,
these unbiased correctors are less necessary.

The unbiased corrector could however be any number known as a *degree of freedom*.
In coding languages this is often referred to as the `ddof`,
or *designated degree of freedom*.
The usual *variance* calculation where the denominator is $N$,
has a *degree of freedom* of 0.
The typical *unbiased corrector* we use in
*Bessel's Correction* is 1,
but it could be any cardinal number to correct for particularly small samples.

### Caveats

There are three caveats to *Bessel's Correction*:

  1. It does not yield an unbiased estimator of *standard deviation*
  2. The corrected estimator usually has higher *mean squared error*
      * Higher than typical uncorrected mean estimators
  3. It is only necessary when the population mean is unknown
      * Corrected estimators are only necessary when population mean unknown
      * Because different scaling factors can be chosen to minimize *MSE*

### Using Python to Demonstrate Variance Bias

Here we'll demonstrate this effect using python, numpy, scipy & matplotlib.

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm
np.random.seed(1337)

Npts = 200
diffMean = []
diffVariance = []
bestMean = []
bestVar = []
p = np.random.uniform(0, 100, Npts)
pmean = p.mean()
pvar = np.var(p)
N = 100

for i in range(N):
    sample = np.random.choice(p, 50)# choose sample from pop.
    smean - sample.mean()           # sample mean
    svar = np.var(sample, ddof=0)   # sample variance
                                    # ddof 0 or 1 means div by N or N-1
                                                                       
    diffMean.append(pmean-smean)    # mean diff sample & pop.
    bestMean.append(np.sum(diffMean) / len(diffMean))# accumulate & avg.
    diffVariance.append(pvar-svar)  # var diff between sample & pop.
    bestVar.append(np.sum(diffVariance) / len(diffVariance))# acc. & avg

# plot results
plt.scatter(range(N), bestMean, color='b', label='Mean Error')
plt.ylabel('Error')
plt.scatter(range(N), bestVar, color='g', label='Variance Error')
plt.legend(loc='upper right')
print(pmean, pvar)

```

A random uniform population, `p`, is created from 0 to 100 of `Npts = 100` points.
A *population mean & variance* is calculated, `pmean` & `pvar`, respectively.
Then 100 different random `sample`s of that population are taken by looping.
Each sample has their *sample mean & variance* calculated `smean`, `svar`,
with a *degree of freedom* or `ddof` of 0.

As more samples are having their *mean & variance* calculated,
`diffMean` is a list that gets appended with the differences between
*population mean* & *sample mean*.
This is effectively the error between *sample mean* & *population mean*.
Then the `bestMean` is a running average of
the *population* & *sample means'* difference.
The same is then done for the difference & average difference between
*population variance* & *sample variance*.
And finally `matplotlib` or `plt` is used to plot the average error over time.

![sample-mean-var-error-ddof0](2023-02-02-12-04-01.png)

Notice that sample mean error is quite steady,
even at the first few samples taken.
Also, the difference between
*population variance* & *sample variance*
changes significantly as more random samples are evaluated,
but it does eventually converge around 20.
Now, change the `ddof=0` to `ddof=1` and see what happens.

![sample-mean-var-error-ddof1](2023-02-02-12-05-05.png)

With *Bessel's Correction* and a *degree of freedom* of 1,
suddenly the error converges faster, and actually gets close to 0.

### Summary

* Population variance and mean assumes perfect knowledge of whole population
* Sample variance & mean is imperfect and will always have some error
* Sample mean is often much closer to population mean
* Sample variance often needs to be corrected and is biased
* Bessel's correction of N - 1 is often much closer to population variance
  * It however distorts sample mean from population mean

## Plotting Mean & Variance in Python

Here we'll take a look at another case of sample mean & variance caveats.
Say we have a population of (-2, -1, 0, 1, 2).
We also have a sample from the population of (0, 1, 2).

$\mu = \frac{\sum_N (x)}{N} = \frac{(-2 + -1 + 0 + 1 + 2)}{5} = 0$

$\sigma^2 = \frac{\sum_N (x-\mu)^2}{N}$
$= \frac{(-2^2 + -1^2 + 0^2 + 1^2 + 2^2)}{5} = \frac{10}{5} = 2$

Remember,
this is the population mean and variance, no biased correctors are necessary.
Then we take the sample mean & variance.

$\mu_x = \frac{\sum_N(x)}{N} = \frac{(0 + 1 + 2)}{3} = 1$

$\sigma_x^2 = \frac{\sum_N(x - \mu_x)^2}{N- 1}$
$= \frac{((0 - 1) + (1 - 1) + (2 - 1))}{3 - 1}$
$= \frac{(-1 + 0 + 1)}{2} = 1$

Things to note:

* When taking the *variance*, the sum is essentially the samples shifted by the mean
  * Instead of sqaure-summing, (0, 1, 2)...
  * You're effectively square-summing (-1, 0, 1)
* The unbiased *variance* (N - 1) is still quite a ways off, 1 vs 2
  * So even with the unbiased estimator we're still a ways off from *population*.
  * So we're still underestimating the *sample variance* from *population*.
* When there's mean error in the sample,
  * the shift that occurs when calculating *variance* affects its error as well

Here is some code that calculates & plots *variance* from any given mean.
We will try and show how *variance* is affected by the mean.
[NumPy][numpy-zk] automatically calculates the mean from the given sample.
Because of this we need to create our own function to compute *variance*,
from a given mean (irrespective of what the real mean is)
and a bias *degree of freedom*.

```python
import numpy as np
import matplotlib.pyplot as plt

population = np.array([5, 4, 4, 9, 9, 8, 2, 0, 3, 6])
sample = np.array([5, 4, 4, 8, 6])

def variance(sample, mean, bias):
    s2 = 0
    for i in range(0, len(sample)):
        x = sample[i] - mean
        s2 = s2 + (x * x)
    var = s2 / (len(sample) - bias)
    print(var)
    return var

N = 10

var_pop = []
var_sample = []

for mean in range(0, N):
    var_pop.append(variance(population, mean, 0))

for mean in range(0, N):
    var_sample.append(variance(sample, mean, 0))

plt.scatter(range(N), var_pop, color='b', label='Population')
plt.scatter(range(N), var_sample, color='r', label='Sample')
plt.ylabel('Variance')
plt.xlabel('Mean')
plt.legend(loc='upper right')
```

The `var_pop` & `var_sample` take the sample & population respectively and
computes the *variance* from a given *mean* increasing from 0 to 9.
Notice how not only the *variance* changes with the mean in a quadratic manner,
but how in the *sample variance* (y-axis) it is always underestimated from
the *population variance*.

![population-mean-vs-var](2023-02-03-11-24-11.png "Biased sample variance vs population variance as function of mean")

>What we've uncovered here is an interesting fact about the relationship between
>*population variance* & *sample variance*.
>The *sample variance* is always underestimated from the *population variance*.

Now let's see how the sample performs when you unbias the *sample variance* with
the *Bessel correction* of **1**.
Just change the line: `var_sample.append(variance(sample, mean, 1))`.
then re-run the code above to see what happens.

![pop-unbiased-sample-mean-vs-var](2023-02-03-11-34-02.png "Unbiased sample variance vs population variance as function of mean")

This uncovers the other interesting fact about *sample variance* in code.
>*Sample variance* when using Bessel's un-biasing corrector will
>be much closer to the *population variance* than without.

For exploring the notebook yourself,
[my gist on population vs sample variance as function of mean][pop-sample-var-vs-mean-gh].

## Exercise: Normal Distribution from Sample

### Problem

Given a blood pressure sample of
*[76, 64, 62, 81, 70, 72, 81, 63, 67, 77]*,
Use [python][py-zk] with [NumPy][numpy-zk] to
calculate its **sample mean**, **sample variation**, and **standard deviation**.
Remember,
because this is a sample,
there's certainly more people in the world with blood pressure than this,
we need to compute the **sample not population** versions of these statistics.
We also know that very likely that
the underlying population that's the superset of this sample,
is a normally distributed population.

Using what we know about the normal distribution,
find out answers to these questions:

* What percentage of the sample data point lies within one standard deviation?
* What percentage of the normal distribution lies within one standard deviation?
* Do you think blood pressure follows a normal distribution?

### Setting Up Python Analysis

First, let's get the basic statistics of the sample.

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
np.random.seed(1337) # Fix the seed for consistent 'random' results

# Sample of people's blood pressures
sample = np.array([76, 64, 62, 81, 70, 72, 81, 63, 67, 77])

# Construct the dataframe from blood pressure sample
df = pd.DataFrame({'blood pressure': sample})

# Compute sample mean, variance, std dev.
mean_s = df['blood pressure'].mean()
var_s = np.var(df['blood pressure'], ddof=1)
std_s = np.sqrt(var_s)

mean_s, var_s, std_s
```

This will create the numpy array containing the blood pressure sample.
Then we also construct the basic version of the dataframe `df`,
that will contain one column of those sample values.

Then using that dataframe,
we can calculate the *mean*,
*variation*, and *standard deviation*.
Remember,
**we must use the unbiased variation to compute these**.
That means that we take the `np.var(sample, ddof=1)`,
and compute the standard deviation by taking its square root.

### Blood Pressure Sample Results

It turns out from the previous code that
we have a *sample mean* of 71.3,
*sample variation* of 52.5,
and *sample standard deviation* of 7.24.

*...or more neatly...*

$\mu_s = 71.3$

$\sigma^2_s = 52.5$

$\sigma_s = 7.24$

### Analyzing Blood Pressure Sample Deviation

Now,
create a dataframe of the sample items.
Then a column that first checks deviation from mean for each item in the sample.
Then a column for the square deviation from the mean.
Finally,
check to see which rows are within one standard deviation of the mean,
where the result is a boolean true or false.

```python
# Add columns comparing each sample measurement deviation to mean
df['deviation from mean'] = df['blood pressure'] - mean_s
df['square deviation'] = np.power(df['deviation from mean'], 2)
df['within std'] = (np.abs(df['deviation from mean']) <= std_s).astype(bool)
df
```

Above we did the work to construct the table using a dataframe below.
Then a column for that measurement's deviation from the sample mean.
Then the square of that deviation.
Finally,
we did a boolean condition to see if the standard deviation is larger than the deviation.

|   | blood pressure | deviation from mean | square deviation | within std |
|--:|---------------:|--------------------:|-----------------:|-----------:|
| 0 |             76 |                 4.7 |            22.09 |       True |
| 1 |             64 |                -7.3 |            53.29 |      False |
| 2 |             62 |                -9.3 |            86.49 |      False |
| 3 |             81 |                 9.7 |            94.09 |      False |
| 4 |             70 |                -1.3 |             1.69 |       True |
| 5 |             72 |                 0.7 |             0.49 |       True |
| 6 |             81 |                 9.7 |            94.09 |      False |
| 7 |             63 |                -8.3 |            68.89 |      False |
| 8 |             67 |                -4.3 |            18.49 |       True |
| 9 |             77 |                 5.7 |            32.49 |       True |

#### How many Measurements Are within Standard Deviation?

Looking at the final column,
**5 measurements in this sample are within one standard deviation of the mean**.

#### Graphing the Result

Let's plot the result using `matplotlib`.
We'll use the `axvline` function to define vertical lines.
One red one for the *mean* location.
Two green lines for the single *standard deviation from mean*.

```python
plt.hist(df['blood pressure'], bins=6, edgecolor='black')
plt.axvline(mean_s, color='red', linestyle='dashed', linewidth=1.5)
plt.axvline(mean_s + std_s, color='green', linestyle='dashed', linewidth=1.5)
plt.axvline(mean_s - std_s, color='green', linestyle='dashed', linewidth=1.5)
plt.xlabel('Value')
plt.ylabel('Frequency')
plt.title('Sample of Normal Distribution')
plt.show()
```

Which gives us a table with disappointing results...

![blood pressure sample deviation](2023-02-03-13-31-26.png)

We don't see much of a normal distribution shape here do we...?

### Creating a Normally Distributed Random Sample

Let's compare to a programmatically created random sample of
a random normal distribution population.
Use [NumPy's][numpy-zk] `random.normal` module.

```python
mean_n = 0
std_n = 1
size_n = 1000

np.random.seed(1337)
normal_rand = np.random.normal(mean_n, std_n, size_n)
sample_n = np.random.choice(normal_rand, 100)
mean_sn = sample_n.mean()
var_sn = np.var(sample_n, ddof=1)
std_sn = np.sqrt(var_sn)
print("Normal Distribution Sample Statistics")
print("=====================================")
print(f"mean_s: {mean_sn}, var_s: {var_sn}, std_s: {std_sn}")

within_sn_std = np.abs(sample_n - mean_sn) <= std_sn
percent_sn_std = 100 * len([x for x in within_sn_std if x]) / len(sample_n)
print(f"Members within one standard deviation of the mean: {percent_sn_std}%")
```

The population is created as `normal_rand`.
Then the `numpy.random.choice` function is used to randomly pick one tenth of
the population as a sample.
Then we repeat the same process as before to
calculate the **sample** *mean*, *variance*, *standard deviation*.
And what do we get?

* Sample Mean: **-0.09**
* Sample Variance: **1.12**
* Sample Standard Deviation: **1.06**

Quite close to what you'd expect from a standard deviation.
If you don't remember the basics of probabilites,
refresh your memory in [the core concepts of probabilites][prob-zk].
But since we defined the population to have a mean 0, and standard deviation of 1,
this is exactly what we'd expect even for a sample one tenth the population.

And once more,
what we know from [our knowledge about probability distributions][prob-zk],
we know that a standard normal distribution should have roughly **68%** will
be within one standard deviation from the mean.
Here the random sample achieves **62%**,
not bad at all.

### How does the Blood Pressure Sample Compare to the Normal Sample?

To finish this exercise off,
first we'll chart the `hist`ogram of the normal distribution sample.

```python
plt.hist(sample_n, bins=20, edgecolor='black')
plt.axvline(mean_sn, color='red', linestyle='dashed', linewidth=1.5)
plt.axvline(mean_sn + std_sn, color='green', linestyle='dashed', linewidth=1.5)
plt.axvline(mean_sn - std_sn, color='green', linestyle='dashed', linewidth=1.5)
plt.xlabel('Value')
plt.ylabel('Frequency')
plt.title('Sample of Normal Distribution')
plt.show()
```

Again,
using `axvline` it's nice to get some guidelines of the mean and
the area that is one standard deviation away from it.
Which gives us this histogram...

![random-normal-sample-hist](2023-02-03-13-40-33.png)

Because this is a randomly chosen sample one tenth the size of
the sourced population,
we still get some random noise in there.
However,
this is about as good a normal distribution as can be expected.

It's hard to compare two histograms without them being together.
Plot the two previous histograms so they're side by side.
Again, we'll use the same basic code as before,
but the axis will need to get pulled out.

```python
fig, ax = plt.subplots(1, 2, figsize=(12, 4))
ax[0].hist(df['blood pressure'], bins=20, edgecolor='black')
ax[0].axvline(mean_s, color='red', linestyle='dashed', linewidth=1.5)
ax[0].axvline(mean_s + std_s, color='green', linestyle='dashed', linewidth=1.5)
ax[0].axvline(mean_s - std_s, color='green', linestyle='dashed', linewidth=1.5)
ax[0].set_xlabel('Value')
ax[0].set_ylabel('Frequency')
ax[0].set_title('Blood Pressure Sample')

ax[1].hist(sample_n, bins=20, edgecolor='black')
ax[1].axvline(mean_sn, color='red', linestyle='dashed', linewidth=1.5)
ax[1].axvline(mean_sn + std_sn, color='green', linestyle='dashed', linewidth=1.5)
ax[1].axvline(mean_sn - std_sn, color='green', linestyle='dashed', linewidth=1.5)
ax[1].set_xlabel('Value')
ax[1].set_ylabel('Frequency')
ax[1].set_title('Random Normal Sample')

plt.tight_layout()
plt.show()
```

Also,
don't forget to put the plots together again,
after defining them as `ax[0]` and `ax[1]`,
by using the `plt.tight_layout()` then `plt.show()` functions.
What we get is pretty telling.

![blood-pressure-vs-random-normal](2023-02-03-13-49-05.png)

Unfortunately,
the blood pressure sample just doesn't compare that well to
the normal distribution sample.
Remember the percentage of measurements from the sample that were within
one *standard deviation* of the *mean*?
It was 5 out of 10 or **50%**.
This random sample has **62%**,
and the perfect standard normal **68%**.

The primary problem here is that there just isn't very much data.

>Sampling this little data you have to be **really careful** to
>not draw too many conclusions when analyzing it.
>Small samples exhibit non standard behaviors more easily.

#### Further Reading

I put my
[Jupyter Notebook for this Exercise in a Github Gist][gist-blood-sample-vs-random-normal].
You can see everything done in one place perhaps more easily there.

## References

### Web Links

* [Bessel's Correction (from Wikipedia, the free encyclopedia)][bessel-correction-wiki]
* [Population vs. Sample Variance as Function of Mean Notebook (from Github gist by marcus-grant)][pop-sample-var-vs-mean-gh]
* [Comparison of a small Blood Pressure Sample to a Randomly Generated and Chosen Normal Distribution][gist-blood-sample-vs-random-normal]

<!-- Hidden References -->
[bessel-correction-wiki]: https://en.wikipedia.org/wiki/Bessel%27s_correction "Bessel's Correction (from Wikipedia, the free encyclopedia)"
[pop-sample-var-vs-mean-gh]: https://colab.research.google.com/gist/marcus-grant/7076e20c65cdb9e8eb3f16cf3d93c365/population-vs-sample-variance-as-function-of-mean.ipynb "Population vs. Sample Variance as Function of Mean Notebook (from Github gist by marcus-grant)"
[gist-blood-sample-vs-random-normal]: https://gist.github.com/marcus-grant/07792714a17de5f4ffd088daa9312568 "Comparison of a small Blood Pressure Sample to a Randomly Generated and Chosen Normal Distribution"

### Note Links

* [Probability][prob-zk]
* [NumPy][numpy-zk]
* [Python][py-zk]

<!-- Hidden References -->
[prob-zk]: ./probability.md "Probability Overview"
[numpy-zk]: ./numpy.md "NumPy Overview"

### Referenced By

* [PCDE Course Overview][pcde-overview-zk]
* [Python Overview][py-zk]

<!-- Hidden References -->
[pcde-overview-zk]: ./pcde-course-overview.md "PCDE Course Overview"
[py-zk]: ./python.md "Python Overview"
