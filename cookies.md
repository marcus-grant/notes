---
created: 2022-11-14T13:16:34.409Z
modified: 2023-03-15T16:31:45.986Z
tags: [www,cookies,web,infosec]
---
# Cookies

## Cookies Basics

**Cookies**, formally known as HTTP **cookies**,
are text files with small pieces of
information that are stored on a web browser (Mozilla 2021).
These small pieces of information are usually in the form of name-value pairs.
The information that a **cookie** is composed of is sent by the *server* along with
the response to the request sent by the web browser.
The browser stores this information in the form of a **cookie** and sends it back to
the same *server* with the later requests (Mozilla 2021).
This helps the *server* identify if the two requests are coming from the same browser.

## Applications of Cookies

*Cookies* are used for remembering stateful information for logins and
other purposes in the stateless HTTP protocol.
The uses of *cookies* can be categorized into three broad categories.

First, *cookies* are useful for session management.
A website might generate a unique ID number for each visitor and
store that ID number on each user's machine using a *cookie* file.
One way that *cookies* are useful is that “they can be used for shopping carts on
e-commerce sites” (Moraes 2020).
*Cookies* are used for ensuring that the user is logged in for the entire session.
It also helps in remembering the shopping carts, game scores,
and other data within a session (Moraes 2020).

*Cookies* are also helpful for user personalization on a web browser (Mozilla 2021).
*Cookies* are helpful in remembering user preferences, themes,
and other settings which makes it easy for users to configure page settings.

Another common way that *cookies* can be used for tracking activity.
*Cookies* are used for tracking users’ browsing behaviors and
by websites to recommend products or
send advertisements based on browsing history (Mozilla 2021).

## Cookie Lifespan

Session *cookies* are typically deleted when the session ends.
The session start time and session end time is usually determined by the browser,
which is based on the user activity.
For permanent *cookies*, their lifespan is based on an expiration date and time.
These types of *cookies* have a predetermined expiration date and
time and that’s when they are deleted from the browser.

To forcefully remove, or pop, a *cookie*,
you should set the *cookie* attribute `max_age` to
0 in the decorator function that does this.
The code below shows how to do this for
a general *cookie* using [Flask's][flask-zk]
`make_response` and `set_cookie` functions:

```py
@app.route('/delete-cookie/')

def delete_cookie():

    res = make_response("Your_desired_message")

    res.set_cookie('foo
```

* In [flask](flask.md) this gets managed by
using the `make_response` & `set_cookie` function.

```python
@app.route('/delete-cookie/')
def delete_cookie():
  res = make_response('Your desired message')
  res.set_cookie('foo', 'bar', max_age=0)
  return res
```

## Cookies in various Web Frameworks

### Flask

See [Cookies in Flask](flask.md#cookies-in-flask) for
a detailed explanation of how to do this in flask

## References

### Web Links

* [HTML.COM: Ultimate Guide on Cookies][cookies-guide]
* [MDN: Using HTTP Cookies][mdn-cookies]

<!-- hidden references -->
[cookies-guide]: https://html.com/resources/cookies-ultimate-guide/ "HTML.COM: Ultimate Guide on Cookies"
[mdn-cookies]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies "MDN: Using HTTP Cookies"

### Note Links

* [Flask][flask-zk]
* [Flask: Cookies in Flask][flask-cookies-zk]

<!-- Hidden Reference Links Below Here -->
[flask-zk]: ./flask.md "Flask"
[flask-cookies-zk]: ./flask.md#cookies-in-flask "Flask: Cookies in Flask"
