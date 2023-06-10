---
created: 2023-06-09T12:52:26.223Z
modified: 2023-06-09T13:52:30.000Z
tags: [neuron,network,machine,learn,algorithm,data,pcde,module21]
---
# Neural Network

## Introduction

**Neural Networks** are a type of *supervised learning* algorithm that
is used across the data engineering and science fields.
Inspired by biological neurons and complex pathways between neurons in the brain,
neural networks are incredibly receptive to errors in the training data.
Typically,
neural networks are made out of a dense web of interconnected neurons in which
each neuron takes a set of values (real-world inputs) and outputs a decision.
Or as [Wikipedia - Neural Network][wiki-nn] puts it:

>A **neural network** can refer to either a neural circuit of biological neurons
>(sometimes also called a biological neural network),
>or a network of artificial neurons or nodes,
>in the case of an artificial neural network.
>Artificial neural networks are used for solving [machine learning][-ml] problems;
>they model connections of biological neurons as weights between nodes.
>A positive weight reflects an excitatory connection,
>while negative values mean inhibitory connections.
>All inputs are modified by a weight and summed.

Because neural networks are based on biological neurons,
maybe it's worth comparing artificial vs. biological neurons.

### Components of Neural Networks

#### Biological Components

Biological neural networks are composed of axons, dendrites, and synapses.

#### Artificial Components

Artificial neural networks are composed of *nodes*,
inputs, outputs, weights and biases.

### Information Flow of Neural Networks

#### Biological Information Flow

Electrical pulses enter the neuron through dendrites.
The information flows through the cell and is processed.
Then, the output electric pulse is sent by the synapse to
the next neuron through an axon.

#### Artificial Information Flow

There are three layers of neurons.
The *input layer* initially processes the external information and
then sends the signals to the *hidden layer*,
which extracts relevant characteristics and features.
The important features are sent to the final layer or *output layer*,
which produces the desired output.

### Training Neural Networks

#### Biological Training

Synapses can increase or decrease the signal sent to the next neuron.
This is called *synaptic plasticity*.
It changes the signal by changing the chemical composition of the synapse.

#### Artificial Training

Weights and biases can be applied to change the signal sent to the next *node*.
The information changes as a product of [matrix][-matrix] or tensor multiplication.

## Neural Network Advantages

Input problems can be represented in *attribute*-value pairs,
which can be discrete-valued, real-valued,
or represented as a vector of several real or discrete valued *attributes*.
This is a robust way to represent data points with
vast amount of different data inputs available.

For example, when preprocessing training data,
images will be converted into a table of pixels with the $x$ and $y$ coordinates
(*attributes*) corresponding to a pixel brightness or color (*value*).
The resulting two-dimensional table can then be fed into the model for training.
These networks also allow for data to be preprocessed into discrete values or
vector values when needed.

Errors and noise in training data don't necessarily affect the outcome.
Since neural networks require large amounts of training data,
any error or outlier in the training data will not affect the outcome of the model.
Simply speaking, the artificial neural network will identify and
filter out any errors in the data within the first input layer.

## Neural Network Disadvantages

Neural networks are computationally expensive.
The training process is computationally expensive and
requires a large amount of training data.
The training process requires so much computational power that
often it is difficult to construct even distributed systems to
cope with all the calculations and memory requirements.
Neural networks by their nature also require some level of data dependency.
This is why sometimes it's hard to split neural network training into
several computing nodes to share the load.

## Neural Network Use Cases

* Visual interpretation
* Image generation
* Speech recognition
* Audio generation
* Robot control
* Image enhancement
* Audio enhancement
* Identification and prediction of trends

## References

### Web Links

* [Wikipedia.org. 'Neural Network' Accessed 2023-06-09][wiki-nn]

<!-- Hidden References -->
[wiki-nn]: https://en.wikipedia.org/wiki/Neural_network "Wikipedia.org. 'Neural Network' Accessed 2023-06-09"

### Note Links

* [Machine Learning][-ml]
* [Matrix][-matrix]

<!-- Hidden References -->
[-ml]: machine-learning.md "Machine Learning"
[-matrix]: matrix.md "Matrix"
