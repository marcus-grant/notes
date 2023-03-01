---
created: 2023-02-23T09:11:16.774Z
modified: 2023-03-01T16:30:22.183Z
tags: [pcde,module9,content,git,github,python,portfolio,pages,class,decorator,wrapper]
---
# PCDE Course: Module 9 Content

## Associated Notes

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

## Mini-Lesson 9.3: Setting Up Your GitHub Account for GitHub Pages

Most of this is covered in
[the GitHub Pages section of the GitHub notes][github-pages-zk].

## Activity 9.2: GitHub Portfolio

In this activity,
you will be required to upload the content of
the repository “PCDE-Activity 9.1” that you created in Activity 9.1 to GitHub Pages.

To complete the activity, perform the following steps:

1. Following the steps in Mini-Lesson 9.3,
set up your GitHub account for GitHub Pages.
At the end of this step, in your remote GitHub profile,
you should have a repository named `<your_username.github.io>`.
2. Ensure that your local copy of
the “`PCDE-Activity 9.1`” repository is up to date on your local machine.
You can do so by
navigating to your local repository using your Terminal window (for Mac users) or
Git Bash (for Windows users) and typing `git pull`.
3. Select the `README.md` file in your remote repository and
edit it so it displays “`Repository for Activities 9.1 and 9.2`” as a Markdown header.
4. Navigate to “`Settings`” and
enable the “PCDE-Activity 9.1” repository to be published on GitHub Pages,
as demonstrated in Video 9.7.
To accomplish this step,
ensure that you select the main or root branch and select “`Save`”.
5. Open a new browser window and verify that you can navigate to
the following URL: `https://<your_username>.github.io/PCDE-Activity-9.1`.
You may need to refresh the page to see the changes.
6. Navigate to your remote GitHub repository,
`your_username.github.io`, and edit the README.md file by
adding the URL of the “PCDE-Activity 9.1” repository.
7. Submit the website URL to your GitHub Pages repository.

### Additional Details:

* Submission instructions: Submit the website URL to your GitHub Pages repository.
* Estimated time: 60 min

*This is a required activity and counts toward course completion.*

## Knowledge Check 9.2: Python Classes

* Q1: Which keyword can be used to create a class in Python?
  * class **(Correct)**
* Q2: How is a constructor defined inside a class in Python?
  * `def __init__(self, ...)` **(Correct)**
* Q3: Suppose there is a class called Employee that has a name and salary attribute.
If emp1 is created as an object of Employee, how would you access the name attribute?
  * `emp1.name` **(Correct)**
* Q4: What does the self keyword represent in Python?
  * The instance of a class **(Correct)**

## Knowledge Check 9.3: Python Advanced Functions

* Q1: Which of the following symbols represents the unpacking operator in Python?
  * `*` **(Correct)**
* Q2: Suppose you have a list, employees, with their names.
How would you print the names of the employees in
the list independently using the unpacking operator?
  * `print(*employees)` **(Correct)**
* Q3: Suppose you have two lists list1 and list2.
How would you create list3, which contains the elements of list1 and list2?
  * `list3 = [*list1, *list2]` **(Correct)**
* Q4: Suppose there is a function that is defined as `def multiply(*args)` with
some function body.
How many arguments do you need to pass when calling this function?
  * Any number of arguments **(Correct)**
* Q5: What is the output of this code snippet?

```python
def add(*args):
  result = 0
  for x in args:
    result = result + x
  return result
print(add(30,15,10,5))
```

* Q5 (Answer): 60 **(Correct)**
* Q6: Kwargs are used to pass named arguments to a function.
What is the format of the data that they store?
  * key-value pairs **(Correct)**
* Q7: Which of the following statements is correct when
applying a for loop to access data in kwargs?
  * `for k, v in kwargs.items():` **(Correct)**
* Q8: Can you pass unnamed arguments into a function in Python?
  * Yes **(Correct)**
* Q9: Which of the following statements is correct?
  * `args` is used to pass unnamed arguments into a function and
`kwargs` is used to pass named arguments into a function. **(Correct)**

## Knowledge Check 9.4: Python Decorators and Wrappers

* Q1: What is a wrapper function in python?
  * When a function calls another function inside itself,
the calling function is called a wrapper function. **(Correct)**
* Q2: What is the output of the following code snippet?

```python
def hi():
  return 'hi there!'
def wrapper(fun):
  text = 'hi from wrapper function'
  return f'{fun()} {text}!!!'
print(wrapper(hi))
```

* Q2A: `hi there! hi from wrapper function!!!` **(Correct)**
* Q3: What would be the output of the following code snippet?

```python
def hello():
    return 'hi there!'
  def wrapper(fun):
    return f'{fun()} {`hi again`}!!!'
print(wrapper(hello))
```

* Q3A: `hi there! hi again!!!` **(Correct)**
* Q4: Which statement can be used to end the execution of a function and
pass control back to the calling function?
  * `return` **(Correct)**

## References

### Web Links

* [Managing your Repositories' Settings & Features (from GitHub Documentation)][github-repo-mgmt]

<!-- Hidden References -->
[github-repo-mgmt]: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/setting-repository-visibility "Managing your Repositories' Settings & Features (from GitHub Documentation)"

### Note Links

* [VS Code][vscode-zk]
* [Git][git-zk]
* [GitHub][github-zk]
* [GitHub: Pages][github-pages-zk]
* [Python: Classes][py-classes-zk]
* [Python: Advanced Functions][py-adv-func-zk]
* [Python: Decorators][py-decorators-zk]
* [Python: Wrappers][py-wrappers-zk]

<!-- Hidden References -->
[vscode-zk]: ./vscode.md "VS Code"
[git-zk]: ./git.md "Git"
[github-zk]: ./github.md "GitHub"
[github-pages-zk]: ./github.md#Pages "GitHub: Pages"
[py-classes-zk]: ./python#Classes "Python: Classes"
[py-adv-func-zk]: ./python#Advanced-Functions "Python: Advanced Functions"
[py-decorators-zk]: ./python#Decorators "Python: Decorators"
[py-wrappers-zk]: ./python#Wrappers "Python: Wrappers"
