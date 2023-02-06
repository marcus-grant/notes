---
created: 2023-02-01T16:14:24.799Z
modified: 2023-02-06T16:45:44.124Z
tags: [pcde,module7,content,knowledge,check,quiz,activity,assignment,project,discussion,self-study,python,statistics,data,model,analysis]
---
# PCDE Module 7 Content: A Model to Predict Housing Prices

## Notes

* ["Statistics in Python"][stats-py-zk] has several of this module's lectures in note form.

## Self Study Exercise 7.1: Statistics on Small Blood Sample

* Q1: Which function from the NumPy library in Python can be used to calculate variance?
  * None of the answers are correct
  * variance()
  * var()
    * **Correct**
  * calvar()
* Q2: Which function can be used in NumPy to create a random sample from a population?
  * mean()
  * ran()
  * rs()
  * random()
    * **Correct**
* Q3: What term is @ the denom. of the formula to compute sample variance?
  * N+1
  * N-1
    * **Correct**
  * N-2
  * N
* Q4: Which function in Python can be used to
calculate the average of data points in a given sample?
  * mean_data()
  * calmean()
  * avg()
  * mean()
    * **Correct**
* Q5: If the sample variance is noted by s^2,
what is the standard deviation of the sample denoted by?
  * cuberoot of s
  * s
    * **Correct**
  * sqrt(s)
  * s - 1

Most of this work is done explicitly in the notes on
[the exercise of comparing blood pressure samples to normal distribution][stats-py-ex-normal-sample-zk]

## Try-It Activity 7.2: Central Limit Theorem

### Intro

In this Try-It activity,
you will review the theory about the central limit theorem and experiment with
Python code to simulate and compute the mean of a sample distribution.
Throughout the Jupyter Notebook,
you will verify the hypothesis of the central limit theorem by
working on two different examples:
one with uniformly distributed samples and
one with exponentially distributed samples.

To start the Try-It activity,
check out [my Github gist containing the notebook][try-it-7-2-gist]
and open the items locally or in a colaboratory session.

Open the Jupyter Notebook file using your own local instance of Jupyter Notebook.
You can also use something like Colaboratory which works with gists.
There are also additional image files that
you will need to visualize the Try-It activity correctly.

Throughout the Jupyter Notebook,
detailed instructions will guide you through the activity and
suggest numerical values.
Run the code and visualize the results.
You may also change the numerical values to
visualize different outcomes and results.

### Discussion Prompt

Now that you have experimented with Try-It Activity 7.2,
discuss the results with your peers.
Describe the steps in the code.
What did you notice visually as you ran your code and
implemented changes?
How did the plots change as you satisfied the hypothesis of
the central limit theorem?

***TODO Link to this gist from colaboratory***
The rest of this document task from
<!-- [this jupyter notebook activity on Central Limit Theorem][] -->

**IMPORTANT INSTRUCTIONS:**
This activity is designed for you to experiment with Python code about
sampling, variance, and mean.
Feel free to change any numerical value throughout the code in
the activity to visualize different outcomes and results.

### The Central Limit Theorem Notebook

Again, the workbook Jupyter notebook is [here][try-it-7-2-gist].

### My Statement

#### Describe the steps in the code

This activity involves running various python based experiments with
the Central Limit Theorem.
Including:

* Determine the theoretical mean of uniform distributions
* Comparing it with a randomly sampled uniform distribution of various sizes

#### What did you notice visually as you ran your code & implemented changes?

Visually when working on the uniform distribution based on dice rolls,
it was obvious the more I increased both the number of rolls in a trial and
the number of trials I was taking means from
that the distribution start to converge towards the Gaussian.
Of note,
I most quickly noticed a change once the typical 30 sample size heuristic was crossed.
That's where you start seeing the least mean error in all the distributions.

Then moving on to the exponential distribution to
demonstrate the Central Limit Theorem applies to
all samples from all distributions.
We see the same thing,
the sample means converge towards the normal distribution once
more samples are taken.
You're given some example code to fill in values for,
and with every increase in sample size you converge on
the Gaussian distribution with the means every time.

## Self-Study Try-It Activity 7.3: Correlation (45:00)

### Intro

In this Try-It activity,
you will experiment with Python code that computes the correlation of
given data using both the NumPy and pandas libraries.
To start the activity,
download the zip file [correlation workbook jupyter notebook gist][try-it-7-3-gist]
and open the items.

Open the Jupyter Notebook file using your own local instance of Jupyter Notebook.
Alternatively,
use a notebook service like Colaboratory which works natively with gists and
are nice due to the ephemeral nature.
There are also additional image files that
you will need to visualize the Try-It activity correctly.

Now that you have experimented with Try-It Activity 7.3,
discuss the results with your peers.
Describe the steps in the code.
What did you notice visually as you ran your code and implemented changes?

**Suggested Time:** 45 minutes

This is a self-study activity and
does not count toward your final grade in this course.

### My Response

This notebook wasn't too hard to follow.
It was a nice way to walk through the concepts of a correlation,
especially with how we analyze them in [python][py-zk].
What was nice was seeing how we visualize it both using [pandas][py-pd-zk]
and [seaborn][py-seaborn-zk] by creating heatmaps to represent correlation.

What was new to me however was that I never knew that
there are other common ways to compute correlation coefficients.
When looking at [pandas][py-pd-zk] documentation for
the `corr()` `DataFrame` method apparently the `pearson` method
is only the most common.
You can also tell it to use the `method=kendall` or `method=spearman` methods.
Doing so in this notebook the only thing I really noticed is that
the `spearman` & `pearson` methods give very similar results.
The `kendall` method seems to create smaller correlations.

## Knowledge Check 7.2: Central Limit Theorem and Correlation (30:00)

* Q1: How are two variables, X & Y, related to each other if they have correlation of 0.95?
  * They are strongly correlated. When X increases, Y decreases
  * They are very strongly correlated. When X increases, Y also increases
    * **Correct**
  * They are poorly correlated. When X increases, Y also increases
  * They are poorly correlated. A change in one var doesn't cause changes in the other.
* Q2: What is the range of values for the Pearson correlation?
  * -inf to +inf
  * -1 to 0
  * -1 to +1
    * **Correct**
  * 0 to 1
* Which function can be used in a pandas dataframe to calculate the Pearson correlation?
  * corr()
    * **Correct**
  * correlation()
  * cov()
  * mean()
* What does the central limit theorem state about the sample mean?
  * None of the answers are correct
  * As the sample size gets larger, the dist. of sample means approx.s the normal dist.
    * **Correct**
  * As the sample size gets larger, the dist. fo sample means approx.s a non-normal dist.
  * As the sample size gets smaller, the dist. of sample means approx.s a normal dist.

## Knowledge Check 7.3: Linear Regression (35:00)

* Q1: Which types of data can linear regression be used to predict?
  * neither continuous nor discrete
  * continuous
    * **Correct**
  * both continuous and discrete
    * **NOT Correct**
  * discrete
    * **NOT Correct**
* Q2: In the linear regression formula $y=mx+x$, what is $y$ called?
  * a dependant variable
    * **Correct**
  * an intercept
  * a slope
  * an independent variable
* Q3: In the linear regression formula $y=mx+b$, what is $x$ called?
  * a slope
  * a dependent variable
  * an independent variable
    * **Correct**
  * an intercept
    * **NOT CORRECT**
* Q4: What is the key difference between simple regression & multiple regression?
  * multiple parameters to estimate
  * multiple equations
  * multiple independent variables
    * **Correct**
  * multiple dependent variables
* Q5: In the linear regression formula $y=mx+b$, what is $m$ called?
  * bias
  * weight
    * **Correct**
  * intercept
  * none of the others
* Q6: In the linear regression formula $y=mx+b$, what is $b$ called?
  * bias
    * **Correct**
  * slope
  * weight
  * none of the others

## Mini Lesson 7-2 - Markdown Syntax

All of the content here has notes taken on it in [my markdown notes][md-zk].

## Try-It Activity 7.4: Practice Writing in Markdown (60:00)

### Assignment Description

In this Try-It activity,
you will experiment with Markdown syntax to
create your own Markdown cheat sheet that you will
refer to when you need to look up Markdown examples.
To start the activity,
open your own local instance of Jupyter Notebook and create a new file.

To complete your personal cheat sheet,
please include the following elements in your Jupyter Notebook:

1. At the top, add a cell containing the title of your document and
an introduction to what Markdown is.
2. Create sections in your document that each describe how Markdown works.
For example, create a section named “Headers.”
Describe how headers can be written in Markdown and provide examples.
In your cheat sheet,
make sure to include as many elements as possible for completeness.
You can refer to [Mini-Lesson 7.2][pcde-mod7-7-2] as a guide.
3. Research how to include Python code in a Markdown cell and
be sure to add a description about that.
4. Create a table of contents.
The table of contents should contain a link to each cell.
Make sure that your table of contents works correctly.
If you are on the “Table of Contents” and click on a link for “Tables,”
your cursor should jump right to the cell containing the tables Markdown information.

### Discussion Prompt

Now that you have experimented with Try-It Activity 7.4,
share your experience with your fellow learners:

How was your experience of writing your own Markdown syntax?
Did you find any step of creating your own cheat sheet particularly challenging?
What additional tags did your peers include that you found interesting or
that were new to you?
Read the statements posted by your peers.
Engage with them by responding with
thoughtful comments and questions to deepen the discussion.

**Suggested Time:** 60 minutes

**Suggested Length:** 150-200 words

This is a required activity and will count toward course completion.

### My Response

Personally, I'm already quite deep into the markdown rabbit hole.
I discovered a knowledge management system about a year ago called zettelkasten.
Basically, you take notes in any manner you like,
ideally in modern times that would be digital notes in
an easy digitized markup format like markdown,
and make heavy use of the linking syntax to other notes of related subject matter.
Then having a site generator create a site,
complete with all the links each of
the notes and tracking back-links create what
is essentially a personal wikipedia for
all your knowledge that you've taken notes on to review.
Since you can easily create links in markdown to other notes,
this makes connecting ideas and topics together in
a network of knowledge fairly easy.

I have my own static site generator that handles all this in
a git repository containing my notes.
And whenever a note change is pushed to
the remote the static site generator renders a new webpage for
me to review on any device with a browser.
There's more complete turn-key solutions like Obsidian Notes that
will take care of all of this.
I highly recommend adopting some kind of system like this for the course.

So in answer to the discussion prompt.

#### How was your experience of writing your own Markdown syntax?

I love it, it's a core part of my work and personal knowledge management.
By writing markup in a human readable syntax
it makes writing rich text really useful in many ways.
Especially when you start considering the relationship between
markdown syntax to HTML.

#### Did you find any step of creating your own cheat sheet particularly challenging?

Not really,
I've used markdown a lot before I took this course.
But I can link to a helpful cheat sheet other people can use if they're interested.

#### What additional tags did your peers include that you found interesting?

I noticed some people bring up LateX syntax being possible in markdown.
I knew this already but haven't used it much so
the provided cheat-sheets are helpful.
Basically you just wrap the mathematical expressions in dollar signs and
use Latex syntax to describe the math.

## Building a Model to Predict Housing Prices Project (13:35)

Now that you've learned a lot of tools for data analysis,
you are ready to create a model and
start predicting outcomes.

### The Housing Data

Here is the [CSV file of the housing data][pcde-house-data-csv-gist]
which will get used in the Project.

The [notes on predicting house prices using linear regression & python][predict-house-price-zk]
cover the rest of this.

## References

### Web Links

* [PCDE Try It 7.2 Lesson on Central Limit Theorem][try-it-7-2-gist]
* [PCDE Try It 7.3 Lesson on Correlation][try-it-7-3-gist]
* [PCDE Course House Price Model Data CSV File][pcde-house-data-csv-gist]

<!-- Hidden References -->
[try-it-7-2-gist]: https://gist.github.com/marcus-grant/47917a2c2384711ae0ce9a1255cb54b8 "PCDE Try It 7.2 Lesson on Central Limit Theorem"
[try-it-7-3-gist]: https://gist.github.com/marcus-grant/16b6dcb1b1f02d6de06a8c3e8a0ca82d "PCDE Try It 7.3 Lesson on Correlation"
[pcde-house-data-csv-gist]: https://gist.github.com/marcus-grant/4a2624a319a8660b73bba5fc2ab68575/raw/6268cae7a2b4bfcf3613c1b099af811db4ae4a3c/houseSmallData.csv "PCDE Course House Price Model Data CSV File"

### Note Links

* [Statistics Using Python][stats-py-zk]
* [Statistics Using Python: Normal Distribution from Sample][stats-py-ex-normal-sample-zk]
* [Python][py-zk]
* [Python: Pandas][py-pd-zk]
* [Seaborn: Wrapper to Python's MatplotLib][py-seaborn-zk]
* [Markdown][md-zk]
* [PCDE Course Module 7 Mini Lesson 7.2 Markdown][pcde-mod7-7-2]
* [Predicting Housing Prices through Linear Regression Using Python][predict-house-price-zk]

<!-- Hidden References -->
[stats-py-zk]: ./statistics-python.md "Statistics Using Python"
[stats-py-ex-normal-sample-zk]: ./statistics-python.md#Exercise:-Normal-Distribution-from-Sample "Statistics Using Python: Normal Distribution from Sample"
[py-zk]: ./python.md "Python"
[py-pd-zk]: ./python-pandas.md "Python: Pandas"
[py-seaborn-zk]: ./python-seaborn.md "Seaborn: Wrapper to Python's MatplotLib"
[md-zk]: ./markdown.md "Markdown"
[pcde-mod7-7-2]: ./pcde-module7-content.md#Mini-Lesson-7-2---Markdown-Syntax "PCDE Course Module 7 Mini Lesson 7.2 Markdown"
[predict-house-price-zk]: ./predict-house-prices.md "Predicting Housing Prices through Linear Regression Using Python"

### Referenced By

* [PCDE Course Overview][pcde-overview-zk]

<!-- Hidden References -->
[pcde-overview-zk]: ./pcde-course-overview.md "PCDE Course Overview"
