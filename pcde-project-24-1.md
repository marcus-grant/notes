---
created: 2023-06-28T18:19:23.173Z
modified: 2023-06-30T19:13:34.308Z
tags: [pcde,module24,project,mosquitto,thingsboard,firebase,mqtt,protocol,sensor,data,database]
---
# Project 24.1: Streaming Live Data to ThingsBoard

## Introduction

In the first part of this project, you will set up your [Mosquitto][-mosq],
[ThingsBoard][-tb], and Firebase environments.
You will begin by setting up your [MQTT protocol][-mqtt] to
produce temperature and humidity data.
Next, you will ensure that the data produced by
the MQTT protocol is published correctly to ThingsBoard.
Finally, you will create a new project and a Realtime database in
[Firebase][-fb] and send the temperature and humidity data to it.

This project is worth a total of 100 points.

## Instructions

### Step 1

In a Terminal window, create a new folder called `Project_24_Docker`.
Below is the YAML code for the `docker-compose.yml` file.
Place it inside the `Project_24_Docker` folder.
Note, you can also just copy and paste this code into the `docker-compose.yml` file.

```yaml
version: "3"
services:
  broker:
    image: eclipse-mosquitto
    volumes:
      - "./mosquitto:/mosquitto"
      - "./mosquitto/config:/mosquitto/config"
      - "./mosquitto/data:/mosquitto/data"
      - "./mosquitto/log:/mosquitto/log"
    ports:
      - "1883:1883"
      - "9001:9001"
```

Inside the `Project_24_Docker` folder, create a folder titled `mosquitto`.
Inside the `mosquitto` folder, create three more sub-folders titled as follows:
`config`, `data`, and `log`.
Create a `mosquitto.config` file and place it inside the `config` folder.
Put the below configurations within it.

```txt
allow_anonymous true
listener 1883
persistence false
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
```

See the image below, which depicts the required folders and files:

```txt
└── Project_24_Docker
    ├── docker-compose.yml
    └── mosquitto
        ├── config
        ├── data
        └── log
```

Provide a screenshot to show that you correctly created all of
the required folders and that you placed the `docker-compose.yml` and
`mosquitto.config` files in the `Project_24_Docker` and config folders,
respectively.

### Step 2

In a terminal, navigate to the `Project_24_Docker` folder and
run the command below to initialize your Mosquitto container:

```sh
docker-compose up
```

Provide a screenshot of your Docker GUI to
show that you have successfully initialized the Mosquitto container.

### Step 3

In a local Terminal window,
run the command below to
install the [Paho MQTT Python client library][-paho] locally:

```sh
pip install paho-mqtt
```

Provide a screenshot to show that
you have successfully installed the Paho MQTT Python client library.

### Step 4

In a Terminal window, navigate to your home folder.
Enter the command below to navigate the your home folder: `cd`.

Inside of your home folder, create two folders named `.mytb-data` and `.mytb-logs`.

Provide a screenshot to show that
you created the `.mytb-data` and `.mytb-logs` folders in your home folder.

### Step 5

Inside the same location where you created the `Project_24_Docker` folder,
create a new folder titled `Project_24_MQTT`.
Inside the `Project_24_MQTT` folder, create a new subfolder titled ThingsBoard.
Download the `docker-compose.yml` file and place it inside the ThingsBoard folder.
Also inside of the ThingsBoard folder,
create two folders named `.mytb-data` and `.mytb-logs`.
Below is the file-tree layout that should result.

```sh
Project_24_MQTT
├── .mytb-data
├── .mytb-logs
└── ThingsBoard
    └── docker-compose.yml
```

Copy this code into the `docker-compose.yml` file.

```yaml
version: "2.2"
services:
  mytb:
    restart: always
    image: "thingsboard/tb-postgres"
    ports:
      - "8080:9090"
      - "9883:1883"
      - "5683:5683/udp"
    environment:
      TB_QUEUE_TYPE: in-memory
    volumes:
      - ~/.mytb-data:/data
      - ~/.mytb-logs:/var/log/thingsboard
```

### Step 6

In a Terminal window, navigate to the `ThingsBoard` folder that you created in
Step 4 and run the command below to initialize your `ThingsBoard` container:

```sh
docker-compose up
```

If the ThingsBoard container does not spin up correctly,
then change the ports on line 8 to `1883:1883` and try to
spin up the container again.

Provide a screenshot of your Docker GUI to show that
you have successfully initialized the ThingsBoard container.

### Step 7

Inside the `Project_24_MQTT` folder,
create a new subfolder titled `paho-mqtt`.
Create the `TBPublish.py` file, as shown below, and place it inside
the `paho-mqtt` folder.

```python
import time
import random
import paho.mqtt.client as mqtt
import json
PORT = 9883
THINGSBOARD_HOST = 'localhost'
ACCESS_TOKEN = 'DHT11_DEMO_TOKEN'

# Data capture and upload interval in seconds.

sensor_data = {'temperature': 0}

client = mqtt.Client()
# Set access token
client.username_pw_set(ACCESS_TOKEN)

# Connect to ThingsBoard using default MQTT port and 60 seconds keepalive interval
client.connect(THINGSBOARD_HOST, PORT, 60)
client.loop_start()

try:
    while True:
        temperature = random.randint(0, 100)
        
        print(f"Temperature: {temperature} humidity: {humidity}")
        sensor_data['temperature'] = temperature
        sensor_data['humidity'] = humidity

        # Sending humidity and temperature data to ThingsBoard
        client.publish('v1/devices/me/telemetry', json.dumps(sensor_data), 1)
        time.sleep(3)
except KeyboardInterrupt:
    pass

client.loop_stop()
client.disconnect()
```

Open the `TBPublish.py` file in VS Code.

See the text below, which depicts the required folders and files: 

```txt
Project_24_MQTT
├── ThingsBoard
│   └── docker-compose.yml
└── paho-mqtt
    └── TBpublish.py
```

Modify the `sensor_data` dictionary by adding another key, `humidity`,
with a corresponding value equal to `0`.
Inside the while loop,
add a statement to generate random integer values between 50 and 100.
Assign these values to the `humidity` variable.

Provide a screenshot to show that you created the `paho-mqtt` folder and
modified the code inside the `TBPublish.py` file to
add the `humidity` key with the correct values assigned to
the `humidity` variable.

### Step 8

Open a Terminal window in VS Code. Run the `TBPublish.py` file.

Provide a screenshot to show that
your code is correctly producing temperature and humidity data.

### Step 9

In a browser window,
navigate to `http://localhost:8080/`.
Log in to ThingsBoard using the credentials below:

```txt
Login: tenant@thingsboard.org
Password: tenant
```

Provide a screenshot to show that you successfully logged in to
ThingsBoard by using the credentials provided.

### Step 10

In ThingsBoard, from the menu on the left, select “Devices”.
You should see an existing device called DHT11 Demo Device.
This device publishes data produced by an MQTT protocol to ThingsBoard.
In other words,
this device is able to read the data produced by the `TBPublish.py` file and
send it to ThingsBoard.

Open the DHT11 Demo Device by selecting it.
Navigate to the Latest Telemetry tab to see the latest telemetry.

Provide a screenshot of the data in the latest telemetry tab to
show that the DHT11 Demo Device is publishing the data produced by
the `TBPublish.py` file to ThingsBoard.

### Step 11

Navigate to the main page of Firebase.
Follow the steps in Video 24.3 to add a new project called `module24Project`.

### Step 12

Add a Realtime Database with `temperature` document to
load data from thing board into.

### Step 13

Add a `firebase` rule node to Root Rule Chain in Thingsboard.
It should be an API call node.
It should be connected to the switch with a label.

### Step 14

Verify that data is being sent to the realtime database.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Mosquitto (MQTT Broker)][-mosq]
* [ThingsBoard (IoT Platform)][-tb]
* [Message Queue Telemetry Transport (MQTT)][-mqtt]
* [Firebase (Application Backend Platform)][-fb]
* [Paho (Python MQTT Library)][-paho]

<!-- Hidden References -->
[-mosq]: mosquitto.md "Mosquitto (MQTT Broker)"
[-tb]: thingsboard.md "ThingsBoard (IoT Platform)"
[-mqtt]: mqtt.md "Message Queue Telemetry Transport (MQTT)"
[-fb]: firebase.md "Firebase (Application Backend Platform)"
[-paho]: python-paho.md "Paho (Python MQTT Library)"
