---
created: 2023-02-23T09:11:16.774Z
modified: 2023-02-24T09:09:41.512Z
tags: [pcde,module9,content,git,github,python,portfolio,pages,class,decorator,wrapper]
foo: bar
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

## References

### Web Links

<!-- Hidden References -->

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
