---
created: 2023-06-19T13:27:17.983Z
modified: 2023-06-26T09:32:13.901Z
tags: [web,socket,python,network,communication,protocol,pcde,module22]
---
# Web Sockets in Python

## Introduction

We can implement [WebSocket][-ws] *servers* and *clients* in [Python][-py] using
the `websockets` library.

According to the [websockets documentation][ws-doc]:

>websockets is a library for building WebSocket servers and clients in
>Python with a focus on correctness, simplicity, robustness, and performance.
>
>It supports several network I/O and control flow paradigms:
>
>1. The default implementation builds upon [asyncio][-asyncio],
>Python’s standard asynchronous I/O framework.
>It provides an elegant coroutine-based API.
>It’s ideal for servers that handle many clients concurrently.
>2. The threading implementation is a good alternative for clients,
>especially if you aren’t familiar with asyncio.
>It may also be used for servers that don’t need to serve many clients.
>3. The [Sans-I/O][sans-io-home] implementation is designed for
>integrating in third-party libraries, typically application servers,
>in addition being used internally by websockets.

## Install Python Socket

It's on the Python Package Index, so just use [pip][-pip]:

```bash
pip install websockets
```

### Python WebSocket Server

Using the [`socket` module][-py-sock],
a server can be created where the server will listen for
incoming connections from clients.
The incoming connections will establish long-lived connections between
the *client* and the *server* through a socket.

Then the server establishes an indefinite loop to
keep sending updates to the client.

```python
# ws-stream-server.py
import socket
import time
HEADER = 10

ws = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ws.bind((socket.gethostname(), 9092))
ws.listen(5)

while True:
    (clientsocket, address) = ws.accept()
    print(f"Connect from {address} established")

    msg = "Hello From Server- You are Connected"
    msg = f"{len(msg):<{HEADER}}"+msg

    #clientsocket.send(bytes(msg, 'utf-8'))
# start pushing messages every 3 seconds
    for i in range(20):
        time.sleep(0)
        msg = f"The time is {time.time()}"
        msg = f'{len(msg):<{HEADER}}' + msg  # what is this doing?
        clientsocket.send(bytes(msg, 'utf-8'))
        print(msg)

```

### Python WebSocket Client

```python
# ws-stream-client.py
import socket
HEADER = 10

ws = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ws.connect((socket.gethostname(), 9092))

while True:
    full_msg = ''
    new_msg = True
    while True:
        msg = ws.recv(16).decode('utf-8')
        #print(f"got: {msg}")
        if new_msg:
            # get length from Header
            tmp_msg = full_msg + msg
            msg_len = int(tmp_msg[:HEADER])
            new_msg = False

        full_msg += msg
        if len(full_msg) >= msg_len + HEADER:
            total_msg_len = msg_len + HEADER
            print(f"M:{full_msg[0:total_msg_len]}")
            next = full_msg[total_msg_len:]
            full_msg = next
            new_msg = True
```

Note how this message handling allows for messages to be split up for
exceeding the allowed number of characters per message.
This is done by examining the length of the message and if the whole thing is
contained by the incoming `msg` buffer.
If it is not, it appends `full_msg` with the incoming `msg` on
the next iteration of the loop.
These sorts of chunking of data is going to be necessary to
manage the messages being sent.

## References

### Web Links

* [Augustin, Aymeric. websockets.readthedocs.io "websockets". 2023-06-19][ws-doc]
* [Benfield, Cory. sans-io.readthedocs.io "Sans I/O". 2023-06-19][sans-io-home]

<!-- Hidden References -->
[ws-doc]: https://websockets.readthedocs.io/en/stable/ "Augustin, Aymeric. websockets.readthedocs.io websockets"
[sans-io-home]: https://sans-io.readthedocs.io "Benfield, Cory. sans-io.readthedocs.io Sans I/O"

### Note Links

* [WebSocket][-ws]
* [Python][-py]
* [Socket (Python StdLib)][-py-sock]
* [Asyncio (Python Asynchronous Library)][-asyncio]
* [Python Package Installer (PIP)][-pip]

<!-- Hidden References -->
[-ws]: web-socket.md "WebSocket"
[-py]: python.md "Python"
[-py-sock]: python-socket.md "Socket (Python StdLib)"
[-asyncio]: asyncio.md "Asyncio (Python Asynchronous Library)"
[-pip]: pip.md "Python Package Installer (PIP)"
