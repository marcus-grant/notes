---
created: 2023-06-08T18:21:43.240Z
modified: 2023-06-11T17:37:50.107Z
tags: [pcde,module21,neural,network,reinforcement,learn,data,python,index]
---
# PCDE Course Module 21 Content

## Introduction

In this module,
you will learn about reinforcement learning and deep neural networks.
You will begin with an introduction to machine learning algorithms,
supervised learning, and unsupervised learning.
Next, you will learn about the k-means algorithm,
which is used to cluster points and create clustering pipelines in Python.
Then, you will delve into the confusion matrix in greater detail and
learn about the accuracy score.
In the next section,
you will gain an understanding of reinforcement learning and deep neural networks.
You will explore how a reward matrix is used to demonstrate states, actions,
and rewards in reinforcement learning.
Next, you will learn how the Quality matrix (Q-matrix) and
Bellman equation are used to solve reinforcement learning problems in Python.
Then, you will practice applying these concepts in various activities to
see reinforcement learning from a hands-on perspective.
Finally,
you will learn about deep neural networks exemplified by the Deep Dream exercise.
In the final assignment for this module,
you will practice coding a reinforcement learning algorithm.

## Discussion 21.1

## Knowledge Check 21.1: The K-means Algorithm and Machine Learning Algorithms

* Q1: Which of the following is a machine learning category?
  * Supervised learning **(correct)**
* Q2: Under which of the following categories does reinforcement learning fall?
  * Unsupervised learning **(correct)**
* Q3: Which of the following defines reinforcement learning?
  * It is an unsupervised learning technique which focuses on
    optimizing the path to a desired solution **(correct)**
* Q4: Which of the following accurately describes a reinforcement learning model?
  * The optimal outcome is derived from
    the outcome with highest reward **(correct)**
* Q5: What are artificial neural networks composed of?
  * nodes, inputs and outputs **(WRONG)**
  * nodes, inputs and outputs, and weights **(WRONG)**
  * nodes, inputs, outputs, weights and biases **(correct)**
* Q6: Which of the following is an advantage of artificial neural networks?
  * *"..."* errors and noise in training data don't
    necessarily affect the outcome **(correct)**
* Q7: Artificial neural networks can be used in which industry applications?
  * Speech recognition **(wrong)**
* Q8: Which of the following can be achieved with k-means?
  * All of the above **(correct)**
  * Identifying clusters of data for partitions **(correct)**
* Q9: How do you define the confusion metric of precision?
  * *"..."* correct positive results to
  the total number of positive results **(correct)**
* Q10: Which of the following 2-step processes is used in k-means?
  * expectation-maximization **(correct)**

## Discussion 21.2: Use Cases for Reinforcement Learning

***TODO***

## Activity 21.1: Reinforcement Learning Activity

### Introduction for Activity 21.1

In this activity,
you will explore how implementing an algorithm using
reinforcement learning can improve the performance of your results.
In particular,
you will work with a Python implementation that
simulates the movements of a self-driving cab to
calculate how many steps it takes to pick up and drop off a passenger at
the correct locations.

You will consider the implementations of
this problem with and without reinforcement learning,
and you will be asked to compare the performance, results, and penalties of
the algorithms.

### Instructions for Activity 21.1

1. In a Terminal window, run the following command to
   install the Python gym library.
   `python3 -m pip install cmake 'gymnasium[atari]' scipy`
2. Download the [Activity_21.1][-pcde-act21-1] folder and
   open it using your local instance of Jupyter Notebook.
   There are seven questions throughout the Jupyter Notebook for this activity.
   Some questions will require you to modify code,
   and others will require open-ended written responses.
3. Read the instructions and modify the code that is provided in
   the related cells for questions 1, 2, 3, and 5.
4. Read the instructions and complete the open-ended questions for
   questions 4, 6, and 7.
   Below each cell that contains a question,
   you will see a Markdown cell in which you can answer that question.
   Responses should fully answer the question that is provided,
   and each response should be approximately two to three sentences.

### Submission Instructions for Activity 21.1

Your submission for this activity should be a Jupyter Notebook that
includes your completed code and your open-ended responses:

1. Update the code cell by completing the print statement by
    calling the `observation_space` method to
    print the number of states in your environment.
2. Update the code cell by completing the code to encode the position of
    your agent and the pickup and drop-off locations in your environment.
    Then, run the code to generate a number that corresponds to a state between
    0 and 499.
3. Update the code cell by filling in the ellipsis with
    the state generated in the code cell for Step 2.
4. Explain the condition that will make the infinite `while` loop end.
5. Update the code cell by defining a Quality matrix with all zero entries and
    dimensions of 500 x 6.
    Then, assign this matrix to the `q_table` variable.
6. Describe the main difference between the implementation in Part3 and
    the one that was proposed in Part 2.
    Explain which equation is used to
    train the algorithm and fill the entries of the Quality matrix.
7. Compare the performances of the two approaches presented in this activity.
    Which one performed better?
    Include the number of steps taken each time the algorithm ran and
    the penalties that were incurred.

> **Note**: Part 1 = Steps 1-3, Part 2 = Step 4, Part 3 = Steps 5-7.


### Further Reading for OpenAI Gym (Module Used)

* [OpenAI Gym Home][oai-gym-home]
* [Open AI Gym (Gymnasium) Documentation Home][oai-gym]

## References

### Web Links

* [Activity 21.1 Starter Archive (Placeholder)][-pcde-act21-1]
* [OpenAI Gym Home][oai-gym-home]
* [Open AI Gym (Gymnasium) Documentation Home][oai-gym]

<!-- Hidden References -->
[-pcde-act21-1]: https://gist.github.com/marcus-grant/f78e89bed3856ffff2793589ebc8a06e "Activity 21.1 Starter Archive (Placeholder)"
[oai-gym]: https://www.gymlibrary.dev/ "Open AI Gym (Gymnasium) Documentation Home"
[oai-gym-home]: https://openai.com/research/openai-gym-beta "OpenAI Gym Home"

### Note Links

* [Machine Learning][-ml]
* [Reinforcement Learning][-rl]
* [Neural Network][-nn]
* [K-Means Clustering][-kmean]
* [Confusion Matrix (Machine Learning)][-confusion]

<!-- Hidden References -->
[-ml]: machine-learning.md "Machine Learning"
[-rl]: reinforcement-learning.md "Reinforcement Learning"
[-nn]: neural-network.md "Neural Network"
[-kmean]: k-means-cluster.md "K-Means Clustering"
[-confusion]: confusion-matrix.md "Confusion Matrix (Machine Learning)"
