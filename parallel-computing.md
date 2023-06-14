---
created: 2023-06-14T19:07:50.003Z
modified: 2023-06-14T20:07:54.000Z
tags: [parallel,computer,software,data,science,process,pcde,module22]
---
# Parallel Computing

## Introduction

>**Parallel computing** is a type of computation in
>which many calculations or processes are carried out simultaneously.
>Large problems can often be divided into smaller ones,
>which can then be solved at the same time.
>There are several different forms of parallel computing:
>**bit-level**, **instruction-level**, **data**, and **task parallelism**.
>Parallelism has long been employed in high-performance computing,
>but has gained broader interest due to
>the physical constraints preventing frequency scaling.
>As power consumption (and consequently heat generation) by
>computers has become a concern in recent years,
>parallel computing has become the dominant paradigm in
>[computer architecture][-comp-arch] mainly in the form of multi-core processors.

## Amdahl's Law

Optimally,
the speedup from parallelization would be linear;
that is doubling the number of processing elements would halve the runtime.
That is mostly not the case.
Some can have near-linear speedup, but most are sub-linear,
flattening out in speedup at very few additional processing elements,
resulting in diminishing returns for each additional processing element.

This phenomenon is known as **Amdahl's law**,
which states that the theoretical speedup of a program when executed in
parallel is limited by the time needed for the sequential fraction of the program.
The theoretical speedup possible with Amdahl's law is described by this formula:

$$
S_{latency}(s) = \frac{1}{1 - p + \frac{p}{s}}
= \frac{s}{s + p (1 - s)}
$$

Where:

* $S_{latency}(s)$ is the potential speedup in latency of execution of the task.
* $s$ is the speedup in latency of the execution of
  the parallel-capable part of the task.
* $p$ is the ratio of the parallel-capable part of the task to
  the whole task.

## Dependencies

As **Amdahl's law** shows,
the sequential portions of a computation task limit the potential speedup of
parallel computation.
So it becomes important to figure out how much of a task is sequential which
can be done by analyzing the **dependencies** of the task.
**Dependencies** are the relationships between tasks that
**depend** on another portion of the task to be completed before
it can be started.

## Bit-Level Parallelism

**Bit-level parallelism** is a form of parallel computing based on
increasing processor word size.
Increasing the word size reduces the number of
instructions the processor must execute in order to perform an operation on
variables whose sizes are greater than the length of the word.

## Instruction-Level Parallelism

**Instruction-level parallelism** is a form of parallel computing that
groups instructions together and executes them simultaneously.
Modern processors are capable of
executing multiple instructions per clock cycle.
This is known as super-scalar execution, hyper-threading, etc.

## Task Parallelism

**Task parallelism** is a form of parallel computing that
distributes threads of execution across available processors.
The threads operate simultaneously on different cores but
on different pieces of data.
If the threads heavily depend on each other,
then the application is more of a concurrent program than a parallel one.

## Data Parallelism

**Data parallelism** is a form of parallel computing that
distributes subsets of the same data across multiple processors,
each of which operates on the data independently.
This is useful in highly regular computations where the amount of data
is easily divisible into separate independent chunks that
can be calculated simultaneously with little or no dependency on each other.

## References

### Web Links

* [Wikipedia. "Parallel Computing". Accessed 2023-06-14][wiki-parallel-compute]

<!-- Hidden References -->
[wiki-parallel-compute]: https://en.wikipedia.org/wiki/Parallel_computing "Wikipedia. 'Parallel Computing'. Accessed 2023-06-14"

### Note Links

* [Computer Architecture][-comp-arch]

<!-- Hidden References -->
[-comp-arch]: computer-architecture.md "Computer Architecture"
