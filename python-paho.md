---
created: 2023-06-29T09:33:56.346Z
modified: 2023-06-29T11:14:57.676Z
tags: [paho,message,queue,protocol,publish,subscribe,network,broker,python,pcde,module24]
---
# Paho (Python MQTT Library)

## Introduction

The **Paho Python Library** is used to connect to the [MQTT][-mqtt] *broker*.
This library implements a `client` class that can be used to
add MQTT support to a [python program][-py].
It makes *publishing* and *subscribing* to messages based on *topic* easy.

## Install

To install the Paho library, open a [terminal][-cli] and run the [pip][-pip] command.

```sh
python -m pip install paho-mqtt
```

The core of the Paho library is the `client` class,
which provides all of the functions to *publish* messages and *subscribe* to *topics*.

## Establish Publish Connection

The code below uses the `client` class to
connect to the *broker* that in this case is running on port 1883.

```python
import paho.mqtt.client as mqtt

broker_url = 'localhost'
broker_port = 1883

client = mqtt.Client()
client.connect(broker_url, broker_port)
```

## Publish Messages

After establishing a connection to a *broker* it's possible to
*publish* messages using the `publish` function.
The code below shows an example of how to use the `publish` function.

```python
topic = 'namespace/topic'
payload = 'publishing a message'
client.publish(topic, payload)
```

## Subscribe to a Topic

With messages being *published* to a *broker*, it's possible to *subscribe* to
a *topic* being used by one of the *publishers*.

```python
client.subscribe(topic)
```

## Asynchronous Processing of Subscribed Messages

The Paho library uses callback functions to manage messages processed by the *broker*.
Callback functions are functions that are executed once an event is captured,
this is a pattern of [asynchronous programming][-async].
In this example, the event to wait for, is a new message arriving to a *subscriber*.

The `on_message` function is an example of a callback function in which
the command tells the *broker* what to do once a message is received on a *topic*.
Below is an example implementation of this function.

```python
def on_message(client, userdata, message):
    print(f"Received message '{message.payload.decode()} on topic {message.topic}'")
```

## Asynchronous Connection to Broker Handling

Another callback function that needs to be defined is the `on_connect` function.
This tells the *client* what to do once it connects to the *broker*.
In this example,
one of the typical actions performed once a connection is established,
a *subscription* is made to the intended *topics*.

```python
def on_connect(client, userdata, flags, rc):
    print(f'connected with result code {str(rc)}')
    client.subscribe(topic)
```

## Assign Callback Functions to MQTT Client

Once all the desired callback functions are defined for the MQTT Client,
it's time to assign them to the client's member variables that
are called when these asynchronous events happen.
You connect them to the `client` like below.

```python
client.on_connect = on_connect
client.on_message = on_message
```

## Example - Temperature Sensor Publish and Subscribe

### Temperature Sensor Example Introduction

Here the basic concepts from before are applied.
Using the Paho library, a *subscriber* client & *publisher* client are made.
A *publisher* will *publish* fake temperature sensor data.
A *subscriber* will receive messages from the same *topic* from the *broker*.

### Temperature Sensor Publisher

First, setup the publisher client.
This client will simulate temperature readings from a sensor device and
*publish* the data to a *broker*.

```python
import json
import paho.mqtt.client as mqtt
import random
import signal
import sys
import time

topic = 'sensors/temperature'
broker = 'localhost'
port = 1883

client = mqtt.Client()
client.connect(broker, port, 60)
print(f'connected on {port}')

def disconnect():
    client.disconnect()

def signal_handler(sig, frame):
    if sig == 15:
        print('Kill Signal! Abrupt Exit!')
        sys.exit(0)
    if sig == 2:
        print('Keyboard Interrupt! Disconnecting!')
    elif sig == 15:
        print('Termination Signal! Disconnecting!')
    else:
        print("Generic termination signal with signal: {sig} & frame: {frame}")
    disconnect()
    sys.exit(0)

signal.sigint(signal.SIGINT, signal_handler)

while True:
  data = json.dumps({'temperature': random.randint(-20, 30)})
  client.publish(topic, data)
  print(f'published: {data}')
  time.sleep(1)
```

>**Note:** The `signal` handling is done to provide options for
>graceful disconnection to the MQTT broker.
>Without careful handling of publishers no longer publishing,
>problems can occur, so it's better to explicitly state we're disconnecting.

### Temperature Sensor Subscriber

Next, a *subscriber* client needs to be demonstrated to show how to
make a client *subscribe* to a *topic* on a *broker*.
Here the `temperature` topic is subscribed to with namespace `sensors`.

```python
import json
import paho.mqtt.client as mqtt
import time
import random

topic = 'sensors/temperature'
broker = 'localhost'
port = 1883

def on_connect(client, userdata, flags, rc):
    print(f'connected on {port}, broker {broker}, and result {rc}')
    client.subscribe(topic)

def on_message(client, userdata, message):
    payload = json.loads(message.payload)
    print(f'received message: {payload}')

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect(broker, port, 60)

client.loop_forever()
```

Once a broker is running on the localhost and port 1883 and
the *publisher* has been started for this broker,
Every second a new set of messages will be delivered with random temperatures.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Message Queue Telemetry Transfer (MQTT Protocol)][-mqtt]
* [Python][-py]
* [Command Line Interface (CLI)][-cli]
* [Python Package Installer (PIP)][-pip]
* [Asynchronous Programming Paradigm][-async]

<!-- Hidden References -->
[-mqtt]: mqtt.md "Message Queue Telemetry Transfer (MQTT Protocol)"
[-py]: python.md "Python"
[-cli]: cli.md "Command Line Interface (CLI)"
[-pip]: pip.md "Python Package Installer (PIP)"
[-async]: async.md "Asynchronous Programming Paradigm"
