---
created: 2022-11-01T17:37:09.062Z
modified: 2023-03-13T20:19:58.393Z
tags: [pcde,client,server,flask,python,api,swagger,cookies,data,engineer,module11]
---
# Proffesional Certification Data Engineering - Module 11: Client Server Architecture

## Discussion 11.1: The Role of Flask in Client–Server Architecture

### Instructions

You have learned that Flask is a fundamental component of web applications,
and it is used for sending HTTP requests and responses to a web server.

#### Discussion Prompt

In this discussion,
you are encouraged to dive deeper into the role of
Flask in a client–server architecture.

In your response, make sure you include the following:

* An overview of the client–server architecture.
* Describe in detail how Flask works and how it’s used within the architecture.
Focus on the role of Flask in the architecture by
explaining how it communicates with
the other parts of the client–server architecture.
Be as specific as possible.
* Summarize the fundamental components needed to build a simple application,
such as the one demonstrated in Mini-Lesson 11.1.
* Include a simple example of
an application that displays a string on a web page on localhost:3000.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

**Suggested Time:** 60 minutes

**Suggested Length:** 300 words

This is a required activity and will count toward course completion.

### Discussion Answer

#### Client-Server Architecture

Client-Server Architecture is a model of computing where
the client and server are separate programs that communicate with
each other over a network.
The prime mediator of this communication is the HTTP protocol,
which we learned about last week, though many other protocols exist.

Using HTTP the client sends a request to the server,
which then responds with a response.
This way computation can be split up between the client and server,
which can involve many machines.

Being able to split up computation in this way has huge advantages:

* Authentication can be managed by a trusted server.
* You can scale an application by adding more servers.
* Users can access the application from anywhere.
* Servers can have their roles duplicated for redundancy.
* Many more...

#### Flask with Sample Application

Flask is a web framework for Python,
most known for its simplicity and versatility.
This is in contrast to more complex and batteries-included frameworks like Django.

Flask has an object called `app` which is the main entry point for the application.
There it associates routes with functions, that can optionally be defined by
function decorators, the likes we've seen before.
To create a `hello` route, we can do something like this:

```python
from flask import Flask
app = Flask(__name__)
@app.route('/hello')
def hello():
    return 'Hello World!'
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port = 3000)
```

Here the decorator defines a route `/hello` relative to the server's base URL.
Requesting that route, `GET` by default, will call the function `hello()` and
the response is taken from calling the `hello()` function.

Templates can be used to render HTML pages, by using the Jinja templating engine.
You simply create a template file, like `index.html`, and then call
`render_template('index.html')` to render it.

## Activity 11.1: Creating a Website Using Flask

In this activity,
you will follow some of the steps presented in Videos 11.1 and 11.2 to
create a simple Flask application.
You will need to download the Activity 11.1 files folder and
save it on your desktop.

Prior to beginning this activity,
be sure to review the submission instructions below to ensure that
you collect the required screenshots as you progress through the activity.

To complete this activity, perform the following steps:

* 1. Open the folder in VS Code and access the `app.py` file.
Complete the code following the instruction in the commented line.
Your application should display the `My first GET request` in a browser window.
  * a. Provide two screenshots, one of your modified code in VS Code and
one of your browser window displaying the line above.

* 2. Modify the `app.py` file so that it includes HTML code to
display the line `My first GET request` in a browser window.
Run and debug your code.
Ensure that the line `My first GET request` is displayed correctly in
HTML in the browser window.
  * a. Provide two separate screenshots in your submission file,
one of your modified code in VS Code and
one of your browser window displaying the line `My first GET *request*` in HTML.

* 3. Open the file *index.html* in the template folder and
include the correct HTML code so
that your browser window displays the text `Hello, my name is <your_full_name>`.
* 4. Provide a screenshot in your submission file.
Edit the app.py file by modifying the decorator app_route() to render the HTML template.
Provide a screenshot in your submission file.
Submission Instructions:

In your submission,
include a `.zip` file containing the code you modified to
accomplish the steps in the activity.
In the `.zip` file,
also include a Word document with
all the screenshots that you took to demonstrate your completion of the activity.
Be sure to number your screenshots as listed below:

* One screenshot of your modified code in VS Code and one screenshot of
your browser window displaying the line: `My first GET request`.
* One screenshot of your modified code in
VS Code and one screenshot of
your browser window displaying the line `My first GET request` in HTML.
* One screenshot of
your browser window displaying the line: `Hello, my name is <your_full_name>`.
* One screenshot demonstrating successful editing of
the `app.py` file by modifying the decorator `app_route()`.

Additional Details:

**Estimated time:** 90 min

This is a required activity and counts toward course completion.

## Activity 11.2: Adding a Cookie to a Website

*Cookies* are created by the websites you visit and
are stored on your local computer as text files.
They are used to store information about you,
such as who you are and what websites you have visited.
Every time your browser sends a new request to the *server*,
*cookies* are sent to the *server* with your request.
When the *server* responds, the *cookies* are sent back to your web browser.

In this activity, you will be modifying a Flask website to add books as *cookies*.
You will then look at your browser settings to see the *cookies* that you created.
Prior to beginning this activity,
be sure to review the submission instructions below to ensure that
you collect the required screenshots as you progress through the activity.

### To complete this activity, perform the following steps

1. Download the file `Activity 11.2 - Cookies.zip`.
Open the folder using Visual Studio Code.
2. Run the code.
Open your browser to `localhost:88` and
make sure that the page `Practicing Cookies!` is displayed.
3. Complete the method `addCookie`.
Add a cookie called `myFirstCookie` with
a value of `Hello World - my first cookie!`.
4. Run the web application and navigate to `http://localhost:88/addCookie`.
Verify that the cookie has been created by going to your web browser settings.
To access the web browser settings on Safari, select Safari from the top menu,
select `Preferences, Privacy`, and then select `Manage Website Data`.
To access the web browser settings on Chrome,
select the three-dots icon in the top right corner, select `Settings`,
then select `Cookies and other site data`.
Verify that the cookie has been created.
5. Complete the method `displayCookieValue`.
Make sure to include the code in a `try` block in case the cookie is not set.
If the cookie is set, then display `Found the cookie: + <cookie value>`,
otherwise display `Cookie not found!`.
Navigate to `http://localhost:88/displayCookieValue` and
look at the browser settings to confirm that your cookie was created.
6. From your browser settings, remove the cookie `myFirstCookie`.
Now refresh the page `http://localhost:88/displayCookieValue`.
Your page should display `Cookie Not Found!`
7. Complete the method removeCookie. Add code to remove, or pop,
the cookie `myFirstCookie`.
Note that to remove a cookie, you should set the cookie attribute `max_age` to 0:

```py
@app.route('/delete-cookie/')
def delete_cookie():
    res = make_response("Cookie Removed")
    res.set_cookie('foo', 'bar', max_age=0)
    return res
```

* Navigate your browser to `http://localhost:88/addCookie`.
Look at your browser settings and verify that the cookie has been created.
Test your new method `removeCookie` by
navigating to `http://localhost:88/removeCookie` and
confirm that the cookie has been removed from your browser.

You now have some hands-on experience of creating cookies by using Flask.

### Submission Instructions

Your submission for this assignment should be a Word document that includes
the following screenshots,
each labelled for the step that the screenshot represents:

1. A screenshot of Visual Studio Code showing the `app.py` from
the `Activity 11.2 - Cookies.zip` file.
2. A screenshot of the web browser pointing to
`http://localhost:88` and displaying `Practicing Cookies!`
3. A screenshot of the completed method `addCookie` in `app.py`.
4. A screenshot of the browser pointing to `http://localhost:88/addCookie` and
displaying `Cookie added!`
5. A screenshot of
the web browser settings displaying the new cookie `myFirstCookie`.
6. A screenshot of the completed method `displayCookieValue` in `app.py`.
7. A screenshot of the browser pointing to
`http://localhost:88/displayCookieValue` and displaying the cookie value.
Note: ensure you navigate to `http://localhost:88/addCookie` first in order to add the cookie.
8. After removing the cookie `myFirstCookie` from your browser,
point your browser to `http://localhost:88/displayCookieValue`.
Your browser should display `Cookie not found!`
9. A screenshot of the completed method for `removeCookie` in `app.py`.
10. A screenshot of your browser settings,
after pointing it to `http://localhost:88/removeCookie`,
showing that the cookie has been removed.

## References

### Note Links

* [Flask][flask-zk]
* [Cookies][cookies-zk]

<!-- Hidden Reference Links Below Here -->
[flask-zk]: ./flask.md "Flask"
[cookies-zk]: ./cookies.md "Cookies"
