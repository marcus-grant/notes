---
created: 2023-04-13T12:37:51.414Z
modified: 2023-04-13T16:15:53.833Z
tags: [pcde,project,module15,jwt,auth,flask,web,api,python]
---

# PCDE Project 15.1: Creating a Books Web Application

## Overview

In this project,
you will expand on the concepts you learned in [Module 11][-pcde-mod11-content]
to create a website that shows your *collection* of books.
You will start by adding the cover image for each book so that
they are rendered on your website beside their corresponding book titles.
Next, you will add more users along with their respective usernames and passwords.
Building on what you learned in Module 11,
you will also set their roles to either `admin` or `reader`.
This will allow the users to perform different actions on the website based on
their roles.
Finally, you will define a function that only allows users with
the `admin` role to add new books to your website.

Prior to beginning this project,
be sure to review the submission instructions below to
ensure that you collect the required screenshots as
you progress through the project.

This project is worth a total of 100 points.

## Project Instructions

### Step 1

Open a Terminal window on your machine and install the `flask-restful` and
`flask-jwt-extended` libraries using the following commands:

```sh
pip install flask-restful
pip install flask-jwt-extended
```

Provide two screenshots.
One screenshot should show that
you successfully installed the `flask-restful` library.
One screenshot should show that
you successfully installed the `flask-jwt-extended` library.

### Step 2

Download and unzip the [Project 15.1][pcde-project-15-1-starter] folder on
your machine.
Provide a screenshot to show that you successfully opened the folder using VS Code.

### Step 3

In the `app.py` file, add two more books of your choice.
Provide a screenshot to show that
you successfully added two more books to the `books` list.

### Step 4

Inside the `static` folder,
add the cover images for the books that you just added.
Provide two screenshots, one for each new cover image,
to show that you successfully uploaded and opened the new cover images using VS Code.

### Step 5

Inside the `books.html` file,
add a line of html code to match each book cover to the book in the books list.
Use the following template for this line of html code:

```html
<img src="static/image{*book_id_reference*}.png" width = "50">
```

Once you are satisfied with your solution,
provide a screenshot to show that
you successfully added the correct html line of code in the `books.html` file.

### Step 6

Inside the `app.py` file, add two more users,
one with the role of `reader` and one with the role of `admin`.
Feel free to choose any username and password you would like to define these users.
Provide a screenshot to show that you successfully added two new users,
one with the role of `admin` and one with the role of `reader`,
in the `app.py` file.

### Step 7

Write the `admin_required(fn)` function to your `app.py` file.
This function will follow the template below:

```python
def admin_required(fn):
    @wraps(fn):
    def wrappers(*args, **kwargs):
        #add code below
    
        return fn(*args, **kwargs):
    return wrapper
```

This function should get the claim from the users defined in
your code and allow the users to add books only if their role is set to `admin`.
If a user’s role is not equal to `admin`,
then the function should return the following exception:

```python
    return jsonify(msg = ‘Admins only!’), 403
```

Provide a screenshot to show that
you correctly defined the `admin_required(fn)` function.

### Step 8

Run and debug your code in VS Code.
Provide a screenshot of your Terminal window to show that
your code ran correctly and successfully connected to `localhost:5000`.

### Step 9

In your browser, navigate to `localhost:5000/`.
Provide a screenshot of your browser window to
show that you correctly opened the page `localhost:5000/`.

### Step 10

Log in using the `admin` username and password that
you defined in your `app.py` file.
Provide a screenshot to show that you successfully logged in as an `admin`.
For example, you can use the `Testuser` account.

### Step 11

After logging in, navigate to the `Books` tab.
Provide a screenshot to show that
you can successfully see all the books defined in
the `app.py` file along with their correct cover images.

### Step 12

Navigate to the `Add Books` tab.
Provide a screenshot to show that you can add a book.
Then, log out of the `admin` account.

### Step 13

Next, log in using the `reader` username and password that
you defined in your `app.py` file.
Provide a screenshot to show that you successfully logged in as a `reader`.
For example, you can use the John account.

### Step 14

Navigate to the `Add Books` tab.
Try to add a new book.
You should receive an error message.
Provide a screenshot of the error message to show that
you can’t add a new book to
your website using an account with only `reader` privileges.

## Submission Instructions

### Submission Overview

Your submission for this project should be a Word document that
includes the following screenshots,
each labelled for the step that the screenshot represents:

### Screenshots 1

Provide two screenshots.
One screenshot should show that
you successfully installed the `flask-restful` library.
One screenshot should show that
you successfully installed the `flask-jwt-extended` library.

### Screenshot 2

Provide a screenshot to show that
you successfully opened the Project 15.1 folder using VS Code.

### Screenshot 3

Provide a screenshot to show that
you successfully added two more books to the books list in the `app.py` file.

### Screenshots 4

Provide two screenshots, one for each new cover image,
to show that you successfully uploaded and
opened the new cover images in the `static` folder using VS Code.

### Screenshot 5

Provide a screenshot to show that
you successfully added the correct html line of code in the the `books.html` file.

### Screenshot 6

Provide a screenshot to show that you successfully added two new users,
one with the role of `admin` and one with the role of `reader`,
in the `app.py` file.

### Screenshot 7

Provide a screenshot to show that
you correctly defined the `admin_required(fn)` function.

### Screenshot 8

Provide a screenshot of your Terminal window to
show that your code ran correctly and successfully connected to `localhost:5000`.

### Screenshot 9

Provide a screenshot of your browser window to
show that you correctly opened the page `localhost:5000/`.

### Screenshot 10

Provide a screenshot to show that you successfully logged in as an `admin`.

### Screenshot 11

Provide a screenshot to show that
you can successfully see all the books defined in
the `app.py` file along with their correct cover images in the `Books` tab.

### Screenshot 12

Provide a screenshot to show that you can add a book using the `Add Books` tab.

### Screenshot 13

Provide a screenshot to show that you successfully logged in as a `reader`.

### Screenshot 14

Provide a screenshot of the error message to
show that you can’t add a new book to
your website using an account with only `reader` privileges.

## Additional Details

Estimated time: **4 hours 30 minutes**
This is a required project and counts toward course completion.

## Grading Rubric

### Criteria

#### Step 1

* 5 pts
* Provide two screenshots:
  * One screenshot should show that
you successfully installed the flask-restful library.
  * One screenshot should show that
you successfully installed the flask-jwt-extended library.

#### Step 2

* 5 pts
* Provide a screenshot to show that
you successfully opened the Project 15.1 folder using VS Code.

#### Step 3

* 10 pts
* Provide a screenshot to show that
you successfully added two more books to the books list in the app.py file.

#### Step 4

* 10 pts
* Provide two screenshots, one for each new cover image.
* To show that you successfully uploaded and opened the new cover images in
the static folder using VS Code.

#### Step 5

* 10 pts
* Provide a screenshot to show that
you successfully added the correct html line of code in the the `books.html` file.

#### Step 6

* 5 pts
* Provide a screenshot to show that you successfully added two new users:
  * One with the role of admin.
  * One with the role of reader.

#### Step 7

* 10 pts
* Provide a screenshot to show that
you correctly defined the admin_required(fn) function.

#### Step 8

* 15 pts
* Provide a screenshot of your Terminal window to show that
your code ran correctly and successfully connected to localhost:5000/.

#### Step 9

* 5 pts
* Provide a screenshot of your browser window to
show that you correctly opened the page localhost:5000/.

#### Step 10

* 5 pts
* Provide a screenshot to show that you successfully logged in as an admin.

#### Step 11

* 5 pts
* Provide a screenshot to show that
you can successfully see all the books defined in
the app.py file along with their correct cover images in the "Books" tab.

#### Step 12

* 5 pts
* Provide a screenshot to show that you can add a book using the "Add Books" tab.

#### Step 13

* 5 pts
* Provide a screenshot to show that you successfully logged in as a reader.

#### Step 14

* 5 pts
* Provide a screenshot of the error message to show that
you can’t add a new book to your website using an account with
only reader privileges.

## Associated 15.2 Lecture

### Project Guide

In this mini project we're going to go through a number of tasks related to books.
The goal is to match up images of books within a database.

Then we're going to add some new useres with either `admin` or `reader` roles.

Then we're going to extend the security so
that only an `admin` an `/addbook` or `/addimage`.

These are the starting users defined in a [Python][-py]
[list of dictionaries][-py-collections].

```python
users = [
    {'username': 'testuser', 'password': 'testuser', 'role': 'admin'},
    {'username': 'John', 'password': 'John', 'role': 'reader'},
    {'username': 'Anne', 'password': 'Anne', 'role': 'reader'},
]
```

Here John and Anne are both `reader` users, defined by the `role` key.
Then `testuser` is an `admin` user, also defined by the `role` key.
The `admin` role will be allowed to do everything.
While `reader` roles can only access pre-existing books or images.

You could also add yourself as a user with the `admin` role.

### Project Starting Code

Here we'll start with some basic boilerplate to get started with the server.

```python
//TODO: Add changes lecturer describes
```

## References

### Note Links

* [PCDE Module 11 Course Contents][-pcde-mod11-content]
* [Python][-py]
* [Python: Collections][-py-collections]

<!-- Hidden References -->
[-pcde-mod11-content]: ./pcde-module11-content.md "PCDE Module 11 Course Contents"
[-py]: python.md "Python"
[-py-collections]: python-collections.md "Python Collections"

### Web References

* [PCDE Project 15.1 Starter Archive Download Link][pcde-project-15-1-starter]

<!-- Hidden References -->
[pcde-project-15-1-starter]: https://classroom.emeritus.org/courses/1412/files/712235/download
