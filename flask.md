---
tags: [#flask,#server,#backend,#python,#py,#http]
---
# Flask

## What is Flask?

It's a web framework for python, packaging an HTTP server on the machine.

## A Basic Flask Server

Create a python file, `app.py` like below.

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello World!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
```

Note the structure of `app.py` above. There's a decorator `@app.route('SOMEROUTE')` the specifie a route relative to where the server is run. The function that follows, in this case `index()` then gets called whenever the root of the server is reached as an HTTP endpoint. The function inside is expected to return a scalar value like text, html string or an HTTP object when an endpoint is reached.

### Responding with HTML

To handle HTML, templating is generally recommended, but static HTML file can also be served. To do this create an HTML file `index.html` in the project root of the flask server, like where `app.py` was placed. Then in `app.py` change `index` to return `render_template('index.html')`.

## Debugging Flask Servers

It can get complicated debugging flask servers. For VSCode include the snippet below in the `__main__` section:

```python
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, use_debugger=False, use_reloader=False, passthrough_errors=True)
```

Then create a `launch.json` file in the debugger like this:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Run flask file",
            "type": "python",
            "request": "launch",
            "env": {
                "FLASK_APP": "app.py",
                "FLASK_ENV": "development",
                "FLASK_DEBUG": "1"
            },
            "args":[
                "run",
                "--no-debugger",
                "--no-reload"
            ],
            "jinja": true,
            "program": "${file}",
            "console": "integratedTerminal",
            "justMyCode": true
        }
    ]
}
```

Now it will debug the file in which the run-debug is clicked on while open.

## Cookies in Flask

Using flask's `route` decorator you get `request` objects to inspect the request. To get cookies from the request simply use `request.cookies.get('COOKIE_NAME_OR_KEY')` to access it. In the below example is a book server that will either show the books if the session cookie proving a login is available, or it will go to a register page.

```python
@app.route("/books", methods=["GET"])
def getBooks():
    try:
        user = request.cookies.get("MySessionCookie")
        return render_template('books.html', books=books, username=user)
    except:
        return render_template("register.html")
```

Below is a basic cookie adding, displaying and removing app that shows the basics of what Flask can do in adding, accessing, and removing cookies.

```python
from flask import Flask, request
from flask import make_response
app = Flask(__name__)

@app.route("/addCookie")
def addCookie():
    response = make_response("<h1>Cookie added!</h1>");
    # add code to add cookie here
    response.set_cookie('myFirstCookie', 'Hello World - my first cookie!')
    return response

@app.route("/displayCookieValue")
def displayCookieValue():
    cookieValue = None
    # add code to get the cookie value (inside try block)
    try:
        cookieValue = request.cookies.get('myFirstCookie')
        if cookieValue != None:
            return "<h1>Found the cookie: {}</h1>".format(cookieValue)
        else:
            return "<h1>Cookie not found!</h1>"
    except:
        return "<h1>Cookie not found!</h1>"

@app.route("/removeCookie")
def removeCookie():
    res = make_response("Cookie removed!")
    # add code to remove cookie here (set max_age = 0)
    res.set_cookie('myFirstCookie', 'Hello World - my first cookie!', max_age=0)
    return res
```