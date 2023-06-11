---
created: 2023-05-11T18:08:47.350Z
modified: 2023-06-11T11:56:47.061Z
tags: [machine,learning,statistics,math,data,science,gradient,descent]
---
# Machine Learning

## Introduction

>**Machine Learning** (**ML**) is a field devoted to understanding and
>building methods that let machines "learn" -
>that is, methods that leverage data to improve computer performance on set of tasks.
>-- [Wikipedia - Machine Learning][wiki-machine-learning]

**Machine learning** [algorithms][-algo] are an
increasingly popular problem-solving tool.
Rather than rely on direct [programming][-lang] instructions to solve a task,
ML algorithms find patterns in data that
correspond to a specific output.
[Computer science][-cs] and [mathematics][-math] study this branch of algorithms.

In practice,
the data being sorted can be an entire data warehouse or
dozes of data sensors relaying real-time information.
The sheer amount of data processing required to
produce an accurate ML model also requires tremendous computing power.
This is why there has been a continual increase in interest in ML over this decade:
as devices get more powerful, so do the ML algorithms that run on them.

In order for ML Algorithms to work,
a set of input data called *training data* must be used.
In basic terms, the algorithm will ingest the training data and
compute a desired result based on the characteristics discovered in training data.
There are two categories of ML data and each of
the following techniques falls under on of the two.

The first ML category is **supervised learning**.
In this type of algorithm,
the input data has the answer key attached to the dataset.
This means that the algorithm already knows all of the answers while
it is being trained and can work from those answers to optimize the solution.

The second category of ML is **unsupervised learning**.
In **unsupervised learning**,
the answer key is not present in the training data.
There are many different ways to implement this approach,
most of which take time and experience.
The **unsupervised learning** learning algorithms will memorize the outcome of
events or data points and generate a desired output after
learning how these outcomes were generated.

## Reinforcement Learning

[Reinforcement learning][-rl] is a type of **unsupervised learning** algorithm.
Reinforcement learning focuses on optimizing the path to a desired solution.

## Neural Network

[Neural Networks][-nn] are a type of **supervised learning** algorithm that
is used across the data engineering and science fields.
Inspired by biological neurons and complex pathways between neurons in the brain,
neural networks are incredibly receptive to errors in the training data.
Typically,
neural networks are made out of a dense web of interconnected neurons in which
each neuron takes a set of values (real-world inputs) and outputs a decision.

## K-Means Clustering

[K-Means Clustering][-kmean] is a method of [vector][-matrix] quantization,
originally from signal processing, that aims to partition $n$ observations into
$k$ clusters in which each observation belongs to the cluster with the nearest mean,
serving as a prototype of the cluster.
Clustering is a method of **unsupervised learning** and a common technique for
[statistical][-stats] data analysis used in many fields.

## Confusion Matrix

A [confusion matrix][-confusion] is a table or matrix that
allows analysis of the accuracy of an ML algorithm in
more nuanced ways than simply scoring overall accuracy as a single ratio.
The table lays out on each axis all possible classifications of the data.
Then *usually* the horizontal axis represents the predicted values and
the vertical axis represents the actual values.
Then each cell represents the frequency of the predicted values against
their actual values as given by the data.

## References

### Web Links

* [Machine Learning (from Wikipedia, the free encyclopedia)][wiki-machine-learning]

<!-- Hidden References -->
[wiki-machine-learning]: https://en.wikipedia.org/wiki/Machine_learning "Machine Learning (from Wikipedia, the free encyclopedia)"

### Note Links

* [Computer Science][-cs]
* [Programming Language][-lang]
* [Mathematics][-math]
* [Algorithm][-algo]
* [Reinforcement Learning][-rl]
* [Neural Network][-nn]
* [K-Means Clustering][-kmean]
* [Matrix][-matrix]
* [Statistics][-stats]
* [Confusion Matrix (Machine Learning)][-confusion]

<!-- Hidden References -->
[-cs]: computer-science.md "Computer Science"
[-lang]: programming-language.md "Programming Language"
[-math]: math.md "Mathematics"
[-algo]: algorithm.md "Algorithm"
[-rl]: reinforcement-learning.md "Reinforcement Learning (Machine Learning)"
[-nn]: neural-network.md "Neural Network (Machine Learning)"
[-kmean]: k-means-cluster.md "K-Means Clustering (Machine Learning)"
[-matrix]: matrix.md "Matrix"
[-stats]: statistics.md "Statistics"
[-confusion]: confusion-matrix.md "Confusion Matrix (Machine Learning)"
