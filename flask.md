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
