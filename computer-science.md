---
created: 2023-06-09T10:51:40.316Z
modified: 2023-06-09T12:18:44.007Z
tags: [computer,science,mathematics,data,algorithm,structure,program,software,automation,index]
---
# Computer Science

## Introduction

>**Computer science** is the study of computation, information, and automation.
>Computer science spans theoretical disciplines
>(such as algorithms, theory of computation, and information theory)
>to applied disciplines
>(including the design and implementation of hardware and software).
>Though more often considered an academic discipline,
>computer science is closely related to computer programming.
>
>--[Wikipedia. 'Computer Science' 2023][wiki-cs]

## Foundations

[Algorithms][-algo] and [data structures][-ds] are foundational topics in
computer science.
The [theory of computation][-computation] concerns abstract models of
computation and is a branch of mathematical logic.

>***TODO*** fill out these fields as more of them are covered later in notes.

## Philosophy

### Epistemology of Computer Science

Despite the word "science" in its name,
there's debate over whether computer science is a discipline of science,
[mathematics][-math] or engineering.
Allen Newell and Herbert A. Simon argued in 1975,

>Computer science is an empirical discipline.
>We would have called it an experimental science, but like astronomy, economics,
>and geology, some of its unique forms of observation and experience do not
>fit a narrow stereotype of the experimental method.
>Nonetheless, they are experiments.
>Each new machine that is built is an experiment.
>Actually constructing the machine poses a question to nature;
>and we listen for the answer by observing the machine in
>operation and analyzing it by all analytical and measurement means available.

It has since been argued that computer science can be classified as
an empirical science since it makes use of
empirical testing to evaluate the correctness of programs,
but a problem remains in defining the laws and theorems of computer science
(if any exist) and defining the nature of experiments in computer science.
Proponents of classifying computer science as an engineering discipline argue that
the reliability of computational systems is investigated in
the same way as bridges in civil engineering and airplanes in aerospace engineering.
They also argue that while empirical sciences observe what presently exists,
computer science observes what is possible to
exist and while scientists discover laws from observation,
no proper laws have been found in computer science and
it is instead concerned with creating phenomena.
([Stanford University 2021][stanford-cs])

## Fields

### Data Structures and Algorithms

[Data structures][-ds] and [Algorithms][-algo] are studies of
commonly used computational methods and their computational efficiency.

### Theory of Computation

The [theory of computation][-computation] is according to Peter Denning,
"the fundamental question underlying computer science".
And further he states that "the question is, what can be automated?".
The theory of computation is concerned with answering questions about
what can be computed and what amount of resources are required to
perform those computations.

### Information Theory and Coding Theory

[Information theory][-info],
which is closely tied to [probability][-probability] and statistics,
is related to the quantification of information.
As Claude Shannon put it in 1948,

>Information is the resolution of uncertainty.

### Programming Language Theory

[Programming language theory][-lang] is concerned with the design,
implementation, analysis, characterization and classification of
programming languages and their individual features.

### Software Engineering

### Artificial Intelligence (AI)

**Artificial Intelligence** is a field devoted to understanding and
applying the processes of problem-solving, decision-making,
learning, communication and environmental adaptation to
computers and computer programs.

These topics include:

* [Machine learning][-ml]
* Computer Vision
* Neural Networks
* Natural Language Processing (NLP)
* Computational Game Theory
* Evolutionary Computation
* Autonomic Computing
* Representation and Reasoning
* Pattern Recognition
* Robotics
* Swarm Intelligence

### Computer Systems

This field splits into several sub-categories of study involved in
the actual implementation of computers and computer systems.
This includes:

* Computer Architecture
* [Operating Systems][-os]
* Input and Output
* Embedded Systems
* Real-time Computing
* Dependable Computing
* Parallel Computing
* Computer Networks
* [Databases][-db]

## References

### Web Links

* [Wikipedia. 'Computer Science'. Accessed 2023-06-09][wiki-cs]
* [Philosophy of Computer Science][stanford-cs]
  * Angius, Nicola, Giuseppe Primiero, and Raymond Turner,
    "The Philosophy of Computer Science",
    The Stanford Encyclopedia of Philosophy (Spring 2021 Edition)
  * [<https://plato.stanford.edu/archives/spr2021/entries/computer-science/>][stanford-cs]

<!-- Hidden References -->
[wiki-cs]: https://en.wikipedia.org/wiki/Computer_science "Wikipedia. 'Computer Science'. Accessed 2023-06-09"
[stanford-cs]: https://plato.stanford.edu/archives/spr2021/entries/computer-science/ "Philosophy of Computer Science"

### Note Links

* [Algorithms][-algo]
* [Data Structures][-ds]
* [Theory of Computation][-computation]
* [Mathematics][-math]
* [Probability][-probability]
* [Programming Languages][-lang]
* [Machine Learning][-ml]
* [Operating Systems][-os]
* [Databases][-db]
* [Information Theory][-info]

<!-- Hidden References -->
[-algo]: algorithm.md "Algorithm"
[-ds]: data-structure.md "Data Structure"
[-computation]: computation.md "Theory of Computation"
[-math]: math.md "Mathematics"
[-probability]: probability.md "Probability"
[-lang]: programming-language.md "Programming Language"
[-ml]: machine-learning.md "Machine Learning"
[-os]: os.md "Operating System"
[-db]: database.md "Database"
[-info]: information-theory.md "Information Theory"
