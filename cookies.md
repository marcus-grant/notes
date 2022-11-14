---
tags: #www,#cookies,#web,#infosec
---
# Cokies

* Text files with small bits of information stored on a browser.
* Browser stores this information locally in the form of a *cookie* and sends it back to the same *server* during later requests.

## What Are they Used for?

* Among other things this helps identify who the user making requests to the server is
  * Potentially other things like settings, preferences, etc. can be stored as well.
* Session management in particular is where they get used.
  * A site will generate a unique ID for each visitor and store that ID number on each user's machine in a *cookie* file.
  * This could be part of a shopping cart on an e-commerce site where the cookie might store product numbers and quantities.
  * Ensures that the user is logged in the whole session or untill the cookie expires.

## Lifespan of a Cookie

* Session *cookies* are typically deletd when the session ends.
* More permanent *cookies* have their lifespan set on a defined expiration date & time.
  * Once that predetermined time passes, they are deleted from browser and the server will no longer accept it.
* To forcefully remove a *cookie*, or *pop*'ing it you should set the cookie attribute `max_age` to 0.
  * In [[flask|Flask]] this gets managed by using the `make_response` & `set_cookie` function.

```python
@app.route('/delete-cookie/')
def delete_cookie():
  res = make_response('Your desired message')
  res.set_cookie('foo', 'bar', max_age=0)
  return res
```

## References

* [HTML.COM: Ultimate Guide on Cookies][cookies-guide]
* [MDN: Using HTTP Cookies][mdn-cookies]

<!-- hidden references -->
[cookies-guide]: https://html.com/resources/cookies-ultimate-guide/ "HTML.COM: Ultimate Guide on Cookies"
[mdn-cookies]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies "MDN: Using HTTP Cookies"
