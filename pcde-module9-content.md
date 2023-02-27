---
created: 2023-02-23T09:11:16.774Z
modified: 2023-02-27T13:53:07.000Z
tags: [pcde,module9,content,git,github,python,portfolio,pages,class,decorator,wrapper]
---
# PCDE Course: Module 9 Content

## Associated Notes

<!-- **DELETEME:** This is a test of the deploy workflow! -->
<!-- **DELETEME:** This is ANOTHER test! -->

* [VSCode][vscode-zk]
* [Git][git-zk]
* [GitHub][github-zk]
* [Python: Classes][py-classes-zk]
* [Python: Advanced Functions][py-adv-func-zk]
* [Python: Decorators][py-decorators-zk]
* [Python: Wrappers][py-wrappers-zk]

## Codio Coding Activity 9.1: Debugging Your Code

### 1. Debugging Your Code

#### Debugging the Function score()

The code on the left defines a function score() that takes no arguments,
but defines the global variable score throughout the program.
Modify the code on the left so that the output of your program is 0.
In fact, if you try to run the following command python Q1.py in the Terminal window,
you see that the output produced is not the one that you would expect.

Below, you have been provided with a simple debugging tool:
Code Visualizer.
Click on the button Code Visualizer to launch it and debug your code.
Feel free to resize the windows to see the complete output.

HINT: You must indent the blocks below. You can do so by dragging them.

#### Solution

```py
def score():
    global score
    score = 0
    print(score)
score()
```

### 2. Debugging Your Code II

#### Debugging the Function add_underscores()

The code on the left defines a function `add_underscores()` that
takes a single string object word as an argument and
returns a new string containing a copy of the word with
each character surrounded by underscores.
For example, `add_underscores("python")` should return `_p_y_t_h_o_n_`.

However, if you try to run the following command python Q2.py in the Terminal window,
you see that the output produced is not the one that you would expect.

Below, you have been provided with a simple debugging tool: Code Visualizer.
Click on the button Code Visualizer to launch it and debug your code.
Feel free to resize the windows to see the complete output.

#### Solution

```py
def add_underscores(word):
    new_word = "_"
    for i in range(len(word)):
        new_word =new_word+ word[i] + "_"
    return new_word

word = "python"
print(add_underscores(word)
```

### 3. Debugging Your Code III

#### Debugging the Function average()

The code on the left contains the function average that
takes two numbers as input and returns their average.

However,
if you try to run the following command python Q3.py in the Terminal window,
you will see that
the code has bugs and the output produced is not the one that you would expect.

Below, you have been provided with a simple debugging Tool: Code Visualizer.
Click on the button Code Visualizer to launch it and debug your code.
Feel free to resize the windows to see the complete output.

#### Problem

```py
def average(x, y):
    result = x+y/2
    return result

print(average(4.0, 9.0)) # should print 6.5
```

#### Solution

```py
def average(x, y):
    result = 0
    result += x
    result += y
    result /= 2
    return result

print(average(4.0, 9.0)) # should print 6.5
```
 
### 4. Debugging Your Code IV

#### Debugging the Function buggy_function()

The function buggy_function() on the left has exactly one bug.
The function should return `True` if
the input `x` is either an even integer less than or equal to 10,
or an odd integer greater than 10.
Otherwise, the function should return False.
However,
when you run the function in the Terminal window via `python Q4.py` with the argument 14,
you see an unexpected result.

Below, you have been provided with a simple debugging Tool: Code Visualizer.
Click on the button Code Visualizer to launch it and debug your code.
Feel free to resize the windows to see the complete output.

#### Problem

```py
def buggy_function(x):
    is_even = (x % 2 == 0)

    if type(x) != int:
        return False

    if x <= 10:
        if is_even:
            return True
    if x > 10:
        if not is_even:
            return True
    else:
        return False

      
test = buggy_function(14)
print(test)
```

#### Solution

```py
def buggy_function(x):
    if type(x) != int:
        return False
    if x > 10 and x % 2:
        return True
    if x <= 10 and not x % 2:
        return True
    return False

      
print(f'Test x = 14: {buggy_function(14)}')
print(f'Test x = 13: {buggy_function(13)}')
print(f'Test x = 9: {buggy_function(9)}')
print(f'Test x = 8: {buggy_function(8)}')
print(f'Test x = 3.5: {buggy_function(3.5)}')
```

### 5. Debugging Your Code V

#### Debugging the Function factorial()

The function `factorial()` on the left computes the factorial of
a number via the formula:

$$n! = n \times (n - 1) \times (n − 2) \times \dots \times 1$$
 
However, when you try to run the script in
the terminal via `python Q5.py` you will see that,
due to the presence of bugs, the code outputs a wrong result.

Below, you have been provided with a simple debugging Tool: Code Visualizer.
Click on the button Code Visualizer to launch it and debug your code.
Feel free to resize the windows to see the complete output.

#### Problem

```py
def factorial(n):
   counter = 0
   total = n
   while counter <= n:
       total *= (n-counter)
       counter += 1
   return total

print(factorial(3)) #should print 6
```

#### Solution

```py
def factorial(n):
   counter = 1 
   total = 1 
   while counter <= n:
       total *= (counter)
       counter += 1
   return total

print(factorial(3)) #should print 6
```

## Discussion 9.1: The Debugging Process

Have you debugged any programs before?
From what you have learned in this module so far,
what is the purpose of debugging,
and how do you feel that it may be useful to you in future work?
What would be a good strategy to find bugs quickly in
your program using the debugging process?

In your post,
answer the questions above and include an example of Python code that
contains at least two syntax errors.
Explain which steps you would consider taking to debug your code and fix the errors.

Discussion Prompt:

Read the statements posted by your peers. Engage with them by responding with
thoughtful comments and questions to deepen the discussion.

**Suggested Time**: 45 minutes

**Suggested Length**: 250 words

This is a required activity and will count toward course completion.

## Knowledge Check 9.1: GitHub Basics

* Q1: Which command can be used to copy a repository to your account in GitHub?
  * fork **(Correct)**
* Q2: Which repo name command can be used to
download a repo from your account to your local machine?
  * clone **(Correct)**
* Q3: Suppose you made changes on your local repo and you want to copy them to your GitHub repo.
Which repo name command would you use to do this?
  * push **(Correct)**
* Q4: Which key needs to be added to the online GitHub account to enable secure access to the repo?
  * Public SSH key **(Correct)**
* Q5: Suppose you delete a file by mistake locally.
Which command can be used to retrieve the code again from the remote repo?
  * pull **(Correct)**
* Q6: When setting up git locally and on GitHub, one step is to generate ssh keys and
register them with GitHub.
Where do you register the keys?
  * Git Agent **(Correct)**
* Q7: If changes are made locally and you'd like to review names of modified files,
which command can be used to do this?
  * git status **(Correct)**
* Q8: Which extension needs to be loaded into VS Code to publish a repo to GitHub?
  * GitHub Extensino **(WRONG)**
  * GitHib Pull Requests and Issues **(Correct)**

## Activity 9.1: Using GitHub

In this activity,
you will be required to download the Jupyter Notebook file `MIT.ipynb` on
your local machine and demonstrate your understanding of GitHub and its commands.

To complete the activity, perform the following steps:

1. Using your personal GitHub account, create a repository named `PCDE-Activity 9.1`.
2. Clone your repository to your local computer and add the Jupyter Notebook to it.
3. Push the file to the remote repository.
4. Open your local instance of Jupyter Notebook and edit the `MIT.ipynb` file to
remove any errors.
There are three obvious mistakes in the file.
Make sure you fix them all.
Add any additional file you may need to your repository to ensure that
the content of the Notebook renders as expected.
5. Commit and push your changes to the remote repository and ensure that
everything works as expected.
6. Optional: If you want to experiment further, select the `README.md` file in
your remote repository and try to edit it so
it displays `Repository for Activity 9.1` as a Markdown header.
7. Ensure that your repository is set to be public so
your Learning Facilitator can mark your submission.
Instructions about how to do so can be found at this link:
[How to Make a GitHub Repository Public][github-repo-mgmt].
Submit the website URL to your GitHub repository.

## References

### Web Links

* [Managing your Repositories' Settings & Features (from GitHub Documentation)][github-repo-mgmt]

<!-- Hidden References -->
[github-repo-mgmt]: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/setting-repository-visibility "Managing your Repositories' Settings & Features (from GitHub Documentation)"

### Note Links

* [VS Code][vscode-zk]
* [Git][git-zk]
* [GitHub][github-zk]
* [Python: Classes][py-classes-zk]
* [Python: Advanced Functions][py-adv-func-zk]
* [Python: Decorators][py-decorators-zk]
* [Python: Wrappers][py-wrappers-zk]

<!-- Hidden References -->
[vscode-zk]: ./vscode.md "VS Code"
[git-zk]: ./git.md "Git"
[github-zk]: ./github.md "GitHub"
[py-classes-zk]: ./python#Classes "Python: Classes"
[py-adv-func-zk]: ./python#Advanced-Functions "Python: Advanced Functions"
[py-decorators-zk]: ./python#Decorators "Python: Decorators"
[py-wrappers-zk]: ./python#Wrappers "Python: Wrappers"
