---
created: 2023-06-08T18:21:43.240Z
modified: 2023-06-14T18:16:54.761Z
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

### Introduction for Discussion 21.2

Both reinforcement learning and
artificial neural networks are ubiquitous in contemporary society.
From self-driving cars to image recognition and object detection,
the world is full of technology that relies on these ideas.
There are many options for exploring these ideas with Python,
specifically using pre-built libraries to
implement reinforcement learning algorithms,
artificial neural networks,
and reinforcement learning using artificial neural networks.

Below are brief overviews of reinforcement learning and
artificial intelligence topics,
each paired with a link to a popular library implementation for the given task.
For this discussion post, your task is to identify a topic of interest from
the options below, read through the resource provided,
and respond to the specific questions for your selected prompt to
guide your discussion.
Be sure to specify which option you have selected at
the beginning of your discussion post.

Select a discussion prompt from the options below:

#### Artificial Neural Networks

An artificial neural network is an effective approach to
learning for both regression and classification problems.
For more complex applications,
it is important to understand the basic structure of
an artificial neural network (ANN).
Google has a popular open-source artificial neural network library called TensorFlow
which can be used to implement ANNs.
An exploratory tool called the [TensorFlow Playground][-tflow-playground]
can be used to experiment with the architecture of a neural network for
both classification and regression tasks.

* Visit the Playground and explore the different elements of the network,
  such as the nodes, layers, and activation functions.
* Explain how these different elements help a neural network to work.
* Describe each of the components of the neural network and
  explain how they work together in detail.
  Feel free to include drawings if you so choose.

#### Convolutional Neural Networks

A convolutional neural network (CNN) is an implementation of
the artificial neural network that gained popularity with
applications to image processing,
such as image classification and object detection.
Specifically, a CNN uses the convolution operation together with
a filter to extract features from images and then uses these features for learning.
Google’s TensorFlow has a [Machine Learning Glossary][google-ml-glossary] with
information about the convolution operation.

* Discuss how the convolution operation works.
* Explain the effects of using the CNN architecture to classify images through
  the TensorFlow example on the [CIFAR10 data][tflow-cifar10],
  which contains a collection of many tiny images.
* Provide a high-level description of the convolution operation,
  the task of image classification,
  and the performance of the network on the CIFAR10 example.

#### Transfer Learning

Transfer learning is the idea of learning in one situation,
then transferring to help performance in another.
With artificial neural networks,
this translates to utilizing a network that
is trained on a different dataset to help with a new task.
There are many resources available to make use of pretrained networks.
Specifically, the focus on this discussion is on networks that
are trained in language.
In these instances,
there are many reasons to allow one entitiy to use a very large dataset and
train a neural network on this data to make the weights from
the network accesible to others for model training.
The [Hugging Face Python library][hug-face-py] implements this type of
transfer learning.

* Discuss at least three of the transfer learning models available from
  the HuggingFace library.
* Explain how each of the examples of pre-trained networks that
  you selected can be used in predictive tasks.

#### Multi-Armed Bandit Problems

One of the first applications of reinforcement learning was to bandit problems.
The popular analogy is that of a multi-armed creature sitting behind a wall of
slot machines, moving its arms from lever to lever,
controlling all the machines.
The goal is to make the optimal choice of arm pulls by learning from experience.
One example application of the bandit problem is to A/B testing.
Google also implements the [TF-Agents library][tf-agent-lib],
which is built on top of its TensorFlow interface.
In this library, you can define an environment, actor,
and policy for the actor in the environment.

* Explain how the bandit algorithms are used on the mushroom dataset.
* Provide a summary of the specific problem,
  including a detailed description of the environment,
  agent, policies, and Upper Confidence Bound (UCB) algorithm that are implemented.

#### Game Environments for Reinforcement Learning

Reinforcement learning has been very successful in
the domain of human vs. machine game playing.
Examples from chess, Go, and Atari all demonstrate the success of
reinforcement learning being applied to multi-person game scenarios.
The [Open-AI Gym library][oai-gym] can help to
explore reinforcement learning algorithms.
Explore the available environments in the Open-AI Gym library.
Then, practice using the Deep Q-Network (DQN) algorithm with
the gym to train a model in the Train a Deep Q-Network with
[TF-Agents][tflow-q-agents] Links to an external site. example from TensorFlow.

* Describe your experience working with
  the OPEN-AI Gym library environments.
* Describe how you used the Deep Q-Network (DQN) algorithm to
  train a model in the example from TensorFlow.
* Explain the Deep Q-Network (DQN) algorithm in detail and
  delineate some example environments in which you could use a DQN to
  train a reinforcement learning agent.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

### My Response to Discussion 21.1

Reinforcement Learning seems the most interesting to me because
it appears the most open ended in its possibilities.
So games being run by Reinforcement Learning AIs seem very interesting.
The OpenAI Gym library seems to be a tool for
developing and evaluating reinforcement learning algorithms in
the context of the artificial environments of games.
Games are useful environments for reinforcement learning because
their constraints, rules and states are well defined,
especially in older games, like the Atari games that
the OpenAI Gym library was originally developed for.

This library focuses particularly on one kinds of
reinforcement learning algorithms called Q-learning,
specifically the Deep Q-Network (DQN) algorithm.
Q learning builds a table of state-action pairs and
the reward for each pair reflect the environment.
Add deep learning networks to this algorithm,
you train the network to predict the reward for
each state-action pair.
This leverages the strengths of deep neural networks that
are great at learning patterns in data to
improve the exploration phase of Q learning with
neural networks' ability to classify data.

To use the DQN algorithm in OpenAI Gym,
you can follow the example provided by
the [TF-Agents library tutorial][tflow-q-agents] from TensorFlow.
The example uses the CartPole environment,
which is a pole balancing game.
Where the state is represented by the position and velocity of a cart and
the angle and angular velocity of the pole on top of it in
a physics simulation simulating how the pole would move in real life.
The state space in this simulation are the possible angles,
velocities, and positions of the cart and pole.

To train the DQN algorithm for the CartPole environment,
you initialize a reward matrix with all zeros,
representing all possible cart and pole positions, angles and velocities.
Then, you run the simulation for a number of episodes,
and obvserve the reward for each state-action pair.
Then you take the state-action pair with the highest reward and
update the reward matrix with the reward for that state-action pair.

The result eventually becomes an algorithm able to
comfortably balance the pole on the cart in a number of circumstances.

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

## Discussion 21.2

### Discussion 21.2 Instructions

Reinforcement learning is a powerful tool in which an algorithm attempts to
get an agent to perform some task while maximizing a reward.
The agent can be in numerous states and perform certain actions,
which will bring the agent to a different state.
Reinforcement learning algorithms are used most often when programming games,
such as chess, Super Mario, and others (Kung-Hsiang 2018).

You have learned about the basics of Q-learning.
However, in this discussion,
you will examine two more reinforcement learning techniques and
compare them to one another.
Each algorithm has pros and cons which are important to
understand before implementing a specific solution to
your reinforcement learning model.

#### Discussion 21.2 State-Action-Reward-State-Action (SARSA)

State-Action-Reward-State-Action (SARSA) is an algorithm that
is very closely related to Q-learning.
The key difference is that SARSA is an on-policy algorithm,
meaning that it often finds a near-optimal solution (Gupta 2021).
SARSA differs from Q-learning in that it learns from performing actions on
the current policy.

The result of the SARSA equation is dependent on the current state,
current action, reward obtained, future state, and future action.
The formula for the SARSA algorithm is provided below (Gupta 2021):

$$
Q(s_t, a_t) = Q(s_t, a_t) + \alpha \left[ r_{t+1} +
\gamma Q(s_{t+1}, a_{t+1}) - Q(s_t, a_t) \right]
$$

There are some advantages and disadvantages to using the SARSA model.
One disadvantage is that SARSA is an on-policy algorithm,
meaning that it is often a near-optimal solution.
In order to obtain an optimal solution using SARSA,
it is necessary to implement a decay function,
which can become an unreliable parameter (Sarode 2018).
However, the advantages generally outweigh this drawback.
SARSA usually has a lower per-sample variance.
This means that it does not suffer converging issues as
some Q-learning algorithms do (Sarode 2018).
SARSA is more conservative than Q-learning.
This is a result of SARSA allowing for
negative penalties in the exploring process,
while Q-learning ignores possible negative penalties (Sarode 2018).
Whereas Q-learning can result in large negative penalties close to
the optimal path,
SARSA is a safer option because it attempts to
avoid these negatives in the solution completely.

A major motivation to choose SARSA over
traditional Q-learning techniques is its ability to avoid major risks.
In a situation where high negative penalties can generate serious harm,
you will most likely choose a close-to-optimal path rather than
risk a catastrophic failure.
Imagine that you are training a robot in the real world.
If the robot were to perform an incorrect action,
it could break itself and become useless.
In this situation, SARSA would be the desired technique because
the actions taken are naturally more conservative.

#### Discussion 21.2 Deep Q-Network (DQN)

Applying reinforcement learning to
real-world problems can often produce large Q-matrices that
contain thousands of cells.
In this case,
applying a traditional Q-learning algorithm can generate two problems:

1. The time-cost tradeoff to explore each state and action is too large.
  The more cells that a Q-matrix has, the longer it takes to explore,
  which quickly becomes impractical (Das 2020).
2. The larger the Q-matrix, the more memory is necessary to
  explore each state.
  For each exploration, the table must be saved and updated,
  which is very costly and memory intensive (Das 2020).

The main downfalls of Q-learning are its lack of generalizability and
lack of scalability.
When a Q-learning algorithm gets to a state that it has not yet discovered,
it has no idea which action is the best and must guess.
The larger the input size, the more guesses need to be performed.
Introducing a neural network to predict the best action for
a given state can solve these issues (Das 2020).

A Deep Q-Network (DQN) combines the concepts of
reinforcement learning and deep neural networks by
introducing a neural network into the Q-learning algorithm to
predict Q-values for a given state (Das 2020).
The input to the neural network is the current state,
and the output is a predicted Q-value for each possible action (Gupta 2019).
The following images show a Q-matrix and a deep neural network to
highlight the difference between traditional Q-learning and DQN:

As you can see, in a DQN,
the values of the next possible actions are not just calculated based on
the entries of the Quality matrix.
Rather, they are computed by the hidden layers in the neural network.
Finally, the value of the next action is determined by
taking the maximum output value from the DQN.

The main advantage of applying a DQN is scalability.
As the input size becomes larger, the performance of the model does not suffer.
DQN allows for the simplicity of Q-learning to be applied to larger problems.
The first notable implementation of DQN was with an Atari game bot in which
the input was a picture of the current Atari screen,
and the output was a predicted action that the agent should make to
win the game (Volodymyr et al. 2013).
To learn more about this interesting implementation,
read the Playing Atari with
Deep Reinforcement Learning article about this model.

For this discussion post,
you will propose a real-world use case for each of
the three reinforcement learning algorithms that
you have learned about so far (Q-learning, SARSA, and DQN).
In your discussion post, answer the following prompts:

* Identify a different real-world implementation for
  each of the three algorithms: Q-learning, SARSA, and DQN.
* Explain your reasoning for why the algorithm is best suited for
  the implementation.
* Explain why this is or is not a scalable solution.
* Explain why the other algorithms are not ideal for the implementation.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

### My Response

#### Q-Learning: Navigation

Q learning can be implemented in autonomous vehicles to
navigate their respected environments,
to constrain the problem space I'll explore an autonomous vacuum.
Rather than navigate from point A to B,
the vacuum will construct many paths to
fill space in the most efficient way possible while
avoiding walls, furniture, etc.
This works well because there's clear rewards,
filling space is good, hitting walls is bad.
It's also good because the environment is static and
somewhat discrete, the vacuum can only turn and move forward and back.

The scalability of this solution is good,
a set of rooms can be explored in a reasonable amount of time.
However, Q-learning suffers from dimensionality,
the Q matrix expands very quickly as the number of states increases.
So there is some concern for larger environments with
more obstacles scaling poorly.

So applying this algorithm to larger and more complex environments might
be ill advised.

#### SARSA: Video Game AI

Game playing AIs are a good fit for SARSA,
the agent can explore the environment and
avoid negative rewards like falling off the map or
colliding with enemies in platform games like Mario or Sonic.
The more conservative nature of SARSA is a good fit for
games where the agent can die or lose the game.
Conservative meaning it is less likely to explore and
incur penalties.

SARSA however still suffers from
the same scalability issues as Q-learning.
It still needs to construct a Q matrix and
the number of states can grow very quickly.

Q Learning wouldn't perform as well here because
it's more prone to explore and lead to actions that
end the game, thus increaseing learning time to
converge on a performant model.

#### DQN: Recommendation Systems

DQN is a good fit for recommendation systems,
such as song or movie recommendations.
In DQN the action and states are discrete,
but are instead represented as a vector of features within
a hidden layer of a neural network.

Here the entire corpus of media being recommended is the environment.
The states are the current media being consumed and
the actions are the next media to be recommended.
The rewards are the user's reaction to the recommendation,
which could be explicit interactions like a like or dislike or
implicit interactions like time spent consuming the media.

Since there's usually such a huge set of options for
each state and action combination,
the scalability of DQN is a good fit.
You don't need explicit rules for every possible combination of
states and actions, the neural network can learn the rules.
You also don't need to store a Q matrix for every possible combination,
instead you store the tensor weights of the neural network,
which is generally going to be much more compressible.

While it's possible to apply Q-learning or SARSA to
this sort of system,
their need for mapping every possible state and
action combination limits their scalability to the number of
possible choices.

## Knowledge Check 21.2: Reinforcement Learning and Deep Neural Networks

* Q1: Which of the following is correct about reinforcement learning?
  * Reinforcement learning is a supervised machine learning approach which
    gives rewards for correct decisions and punishments for incorrect ones.
    * Incorrect, reinforcement learning is not supervised.
  * Reinforcement learning is an unsupervised machine learning approach which
    gives rewards for correct decisions and punishments for incorrect ones.
    * Incorrect, reinforcement learning is not unsupervised.
  * Reinforcement learning is an unsupervised machine learning approach which
    gives rewards for optimal decisions and punishments for non-optimal ones.
    * Correct, (technically not supervised or unsupervised though)  
  * Reinforcement learning is a supervised machine learning approach which
    gives rewards for non-optimal decisions and punishments for optimal ones.
    * Correct, reinforcement learning is a supervised machine learning approach
      which gives rewards for non-optimal decisions and punishments for optimal
      ones.
* Q2: What is an action in reinforcement learning?
  * In reinforcement learning, moving from the start to a goal is
    called an action
    * Incorrect, moving from the start to a goal is called a path.
  * None of the above
    * Incorrect, there is a correct answer.
  * In reinforcement learning, acting on behalf of all
    the low probability events is called an action.
    * Incorrect, acting on behalf of all the low probability events is called
      exploration.
  * In reinforcement learning,
    moving from one state to another is called an action.
    * Correct, moving from one state to another is called an action.
* Q3: What are the three layers of neurons in deep neural networks?
  * Input, Hidden, Output
    * Correct, the three layers of neurons in
      deep neural networks are the input layer,
      the hidden layer, and the output layer.
  * Input, Biased, Output
    * Incorrect, the three layers of neurons in
      deep neural networks are the input layer,
      the hidden layer, and the output layer.
  * Start, Hidden, Finish
    * Incorrect, the three layers of neurons in
      deep neural networks are the input layer,
      the hidden layer, and the output layer.
  * Weight, Biased, Output
    * Incorrect, the three layers of neurons in
      deep neural networks are the input layer,
      the hidden layer, and the output layer.
* Q4: What does a Quality Matrix (Q-Matrix) consist of?
  * A row for each possible action and a corresponding column for each
    possible state for that action.
    * Incorrect, a Q-Matrix consists of a row for each possible state and a
      corresponding column for each possible action for that state.
  * A row for each possible state and a corresponding column for each
    possible action at that state.
    * Correct, a Q-Matrix consists of a row for each possible state and a
      corresponding column for each possible action for that state.
  * A column for each possible state and a corresponding row for each
    possible state at that state.
    * Incorrect, a Q-Matrix consists of a row for each possible state and a
      corresponding column for each possible action for that state.
  * A column for each possible action and a corresponding column for each
    possible state for that action.
    * Incorrect, a Q-Matrix consists of a row for each possible state and a
      corresponding column for each possible action for that state.
* Q5: Which of the following Python libraries can be used to
  implement deep neural network algorithms in Python?
  * NumPy
    * Incorrect, NumPy is a Python library for scientific computing.
  * TensorFlow
    * Correct, TensorFlow is a Python library for neural networks.
  * Pandas
    * Incorrect, Pandas is a Python library for data analysis.
  * SciPy
    * Incorrect, SciPy is a Python library for scientific computing.
* Q6: What is the significance of $\gamma$ in the Q-learning process?
  * Gamma is a variable that is used to predict the accuracy for
    the occurances of the state.
  * None of the above
  * Gamma is a discount factor that is used to balance current and
    future rewards.
    * Correct, Gamma is a discount factor that is used to balance current and
      future rewards.
* Q7: Which of the following is the first step in Q-Learning processes?
  * The first step in the Q-learning process is to
    pick the most probably state based on the reward matrix.
    * Incorrect, the first step in the Q-learning process is to
      pick a random state.
  * The first step in the Q-learning process is to pick the most
    probably action based on the reward matrix.
    * Incorrect, the first step in the Q-learning process is to
      pick a random state.
  * The first step in the Q-learning process is to pick a state randomly.
    * Correct, the first step in the Q-learning process is to
      pick a random state.
  * None of the answers are correct.
    * Incorrect, there is a correct answer.
* Q8: In deep neural networks, what is an activation?
  * It's a connection between neurons, represented by the arrows between layers.
    * Correct
  * It's a connection between the output layer and the hidden layer.
  * It's the connection between the input layer and output layer.
  * The connection between input layer and the hidden layer.
* Q9: Which of the following is an application of deep neural networks?
  * All of the above
    * Wrong
  * Image recognition
    * Correct
  * Weather prediction
  * Sports analytics

### Further Reading for OpenAI Gym (Module Used)

* [OpenAI Gym Home][oai-gym-home]
* [Open AI Gym (Gymnasium) Documentation Home][oai-gym]

## References

### Web Links

* [Activity 21.1 Starter Archive (Placeholder)][-pcde-act21-1]
* [TensorFlow Playground][-tflow-playground]
* [Google Machine Learning Glossary][google-ml-glossary]
* [TensorFlow Example on the CIFAR10 Data Convolutional Neural Network][tflow-cifar10]
* [Hugging Face Python Library][hug-face-py]
* [TF-Agents Library][tf-agent-lib]
* [OpenAI Gym Home][oai-gym-home]
* [Open AI Gym (Gymnasium) Documentation Home][oai-gym]
* [Train a Deep Q-Network with TF-Agents][tflow-q-agents]

<!-- Hidden References -->
[-pcde-act21-1]: https://gist.github.com/marcus-grant/f78e89bed3856ffff2793589ebc8a06e "Activity 21.1 Starter Archive (Placeholder)"
[-tflow-playground]: https://playground.tensorflow.org/#activation=tanh&batchSize=10&dataset=circle&regDataset=reg-plane&learningRate=0.03&regularizationRate=0&noise=0&networkShape=4,2&seed=0.00833&showTestData=false&discretize=false&percTrainData=50&x=true&y=true&xTimesY=false&xSquared=false&ySquared=false&cosX=false&sinX=false&cosY=false&sinY=false&collectStats=false&problem=classification&initZero=false&hideText=false "TensorFlow Playground"
[google-ml-glossary]: https://developers.google.com/machine-learning/glossary/ "Google Machine Learning Glossary"
[tflow-cifar10]: https://www.tensorflow.org/tutorials/images/cnn "Tensorflow Convolutional Neural Network (CNN) Tutorial"
[hug-face-py]: https://huggingface.co/docs/transformers/index "Hugging Face Python Library Documentation"
[tf-agent-lib]: https://www.tensorflow.org/agents "TensorFlow Agents Library"
[oai-gym]: https://www.gymlibrary.dev/ "Open AI Gym (Gymnasium) Documentation Home"
[oai-gym-home]: https://openai.com/research/openai-gym-beta "OpenAI Gym Home"
[tflow-q-agents]: https://www.tensorflow.org/agents/tutorials/1_dqn_tutorial "Train a Deep Q-Network with TF-Agents"

### Note Links

* [Machine Learning][-ml]
* [Reinforcement Learning][-rl]
* [Neural Network][-nn]
* [TensorFlow][-tflow]
* [K-Means Clustering][-kmean]
* [Confusion Matrix (Machine Learning)][-confusion]

<!-- Hidden References -->
[-ml]: machine-learning.md "Machine Learning"
[-rl]: reinforcement-learning.md "Reinforcement Learning"
[-nn]: neural-network.md "Neural Network"
[-tflow]: tensorflow.md "TensorFlow"
[-kmean]: k-means-cluster.md "K-Means Clustering"
[-confusion]: confusion-matrix.md "Confusion Matrix (Machine Learning)"
