---
created: 2023-05-31T07:34:15.973Z
modified: 2023-06-02T19:10:54.341Z
tags: [bayes,theory,math,probability,machine,learn,gradient,descent,inference,classification,pcde,module20]
---
# Bayes Theorem

## Introduction

Used to calculate conditional [probabilities][-prob],
**Bayes Theorem** is a fundamental concept in probability theory.
This includes machine learning.
Bayes theorem is used to calculate the probability of an event
occurring given that a related event has already occurred.
This is called conditional probability, and given two events $A$ & $B$,
it can be expressed by using the notation $P(A|B)$.
The theory is useful when a series of events exists with
outcomes that partially depend on the occurrence of another event.
In $P(A|B)$, $A$ is the event of interest and $B$ is the event that has occurred.

Imagine that you have three bags that are filled with different coins.
You randomly select a coin out of a random bag, and it's a quarter.
What is the probability that the coin came from the first bag?
If you can determine the probability of choosing a quarter,
then you can calculate the probability the coin you picked came from the first bag.

## Proof of Bayes Theorem

$P(A|B) = \frac{P(B|A)P(A)}{P(B)}$

### Proof of Bayes Theorem - Step 1

Begin by defining the probability of two events, $A$ & $B$,
happening simultaneously.
This is represented by $P(A \cap B)$.
The $\cap$ symbol is used to denote the intersection of two events,
or when the two events occur simultaneously.
$P(A \cap B)$ can be derived by multiplying the probability of $A$ by
the probability that event $B$ will happen,
given that event $A$ has occurred or $P(A) * P(B|A)$.

To demonstrate proof of this theory,
consider the following example.
Suppose that you want to compute the probability of finishing an ice cream cone.
This can be calculated by computing the probability that
the store has ice cream in stock multiplied by the probability that
you can eat the entire ice cream cone given that the ice cream is in stock.
In this example, define $P(A)$ as the probability that
the store has ice cream in stock.
$P(A|B)$ will be the probability that
you eat the entire ice cream cone,
given that the ice cream was in stock.

Therefore,
the probability that you can finish the ice cream and
that the ice cream is in stock can be computed by using the following formula:

$$P(A \cap B) = P(A) * P(B|A)$$

### Proof of Bayes Theorem - Step 2

Similarly to what you learned in Step 1,
the probability of events $A$ and $B$ happening simultaneously is also
equal to the probability of $B$ multiplied by the probability of $A$,
given $B$ has occurred or $P(B) * P(A|B)$.
This is illustrated in the following equation:

$$P(A \cap B) = P(B) * P(A|B)$$

### Proof of Bayes Theorem - Step 3

Because the left hand sides of Steps 1 & 2 are exactly the same,
you can also set the right hand sides equal to each other:

$$P(B) * P(A|B) = P(A) * P(B|A)$$

### Proof of Bayes Theorem - Step 4

Dividing both sides by $P(B)$ yields the following equation:

$$P(A|B) = \frac{P(A) * P(B|A)}{P(B)}$$

### Proof Conclusion

Therefore you have proven Bayes Theorem of conditional probability.
This means that given the probability of two events occurring,
you can calculate the probability of
one event occurring given that another event has already occured.

## Extension of Bayes Theorem

In many implementations,
you may see Bayes Theorem written a bit differently because
there are more than just two events occurring.
Next,
you will work to adjust your Bayes equation to
account for multiple events by reformatting the theory.
You will be seeking the probability of some event, $E_i$,
given the probability of another event, $A$.
This will be written as $P(E_i|A)$.
If you plug this into the original Bayes equation,
the result is:

$$P(E_i|A) = \frac{P(E_i) * P(A|E_i)}{P(A)}$$

However,
often you will not know the denominator in this equation,
which is the probability of $A$.
In the next steps,
you will work to identify a common substitute for $P(A)$.

Let $E_i$ to represent a partition of the sample space $S$,
and let $S$ represent the set of all possible outcomes.
Let $A$ represent some event that has occured.
Because $S$ holds all possible outcomes,
$A$ must belong to the set $S$ that is derived from the first step.
See the example below ot illustrate this theory:

### Bayes Extension - Step 1

$A = A \cap S$

### Bayes Extension - Step 2

For this example, $S$ represents the set all events $E_i$, thus

$$S = E_1 \cup E_2 \cup E_3 \cup ... \cup E_n$$

$$A = A \cup {E_1, E_2, E_3, ... E_n}$$

### Bayes Extension - Step 3

Then use the property of distribution to distribute the intersection,
as shown below:

$$A = (A \cup E_1) \cap (A \cup E_2) \cap (A \cup E_3) \cap ...
(A \cup E_n)$$

### Bayes Extension - Step 4

Take the probability of both sides,
as show by the equation below:

$$P(A) = P((A \cup E_1) \cap (A \cup E_2) \cap (A \cup E_3) \cap ...
(A \cup E_n))$$

### Bayes Extension - Step 5

Because $A$ and $E_i$ are disjoint sets,
you know that $P(A \cup B) = P(A) + P(B)$, thus.

$$P(A) = P(A \cap E_1) + P(A \cap E_2) + P(A \cap E_3) + ... P(A \cap E_n)$$

### Bayes Extension - Step 6

According to the multiplication of independent events theorem,

$$P(A) = P(E) * [P(\frac{A}{E_1}) + P(\frac{A}{E_2}) + P(\frac{A}{E_3}) + ...
P(\frac{A}{E_n})]$$

### Bayes Extension - Step 7

Thus you can use the summation to get this:

$$P(A) = P(E) * \sum_{k}^{n} P(E_i) * P(A | E_i)$$

### Bayes Extension - Step 8

While this appears differently, you can now derive Bayes to be:

$$P(E_i|A) = \frac{P(E_i)P(A|E_i)}{\sum_{k}^{n} P(E_i) * P(A|E_i)}$$

## Example of Bayes in Action

You have two bags full of poker chips.
Bag one has seven red and two blue chips while
bag two has five red and nine blue chips.
You draw a chip at random and it turns out to be red.
Compute the probability that the chip was drawn from bag one.

First, define your known probabilities.

* Let $X$ represent the event that the chip was chosen from bag one.
* Let $Y$ represent the event that the chip was chosen from bag two.
* Let $A$ represent the event that the chip is red.
* $P(X) = P(Y) = \frac{1}{2}$
* There are seven red chips out of total nine in bag one, thus...
  * $P(drawing a red chip from bag one) = P(A | X) = \frac{7}{9}$
* $P(drawing a red chip from bag two) = P(A | Y) = \frac{5}{14}$

The goal of this problem is to find the probability that
the chip came from bag one,
given that it is red.
Thus, you must find $(X|A)$ using Bayes theorem.
See the example below to work through this problem.

### Example - Part One

 $$P(X|A) = \frac{P(A|X) * P(X)}{P(P(X)P(A|X)+P(Y)P(A|Y))}$$

### Example - Part Two

$$P(X|A) = \frac{\frac{7}{9} * \frac{1}{2}}{\frac{1}{2} * \frac{7}{9} +
\frac{1}{2} * \frac{5}{14}}$$

### Example - Part Three

$$P(X|A) = \frac{\frac{7}{18}}{\frac{7}{18} + \frac{5}{28}}$$

### Example - Part Four

$$\frac{98}{143} = 0.685 = 68.5\%$$

You have now determined that after drawing a red chip,
the probability that it was drawn from the first bag is 68.5%.
This example illustrates how to apply Bayes theorem to
a real world problem.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Probability Theory][-prob]

<!-- Hidden References -->
[-prob]: probability.md "Probability Theory"
