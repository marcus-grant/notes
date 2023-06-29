---
created: 2023-06-29T09:09:35.069Z
modified: 2023-06-29T11:10:17.982Z
tags: [mosquitto,mqtt,publish,subscribe,message,queue,broker,topic,network,protocol,pcde,module24]
---
# Mosquitto

## Introduction

>Mosquitto is an open-source messaging *broker* that implements [MQTT][-mqtt] on
>data coming from IoT devices, by implementing the MQTT protocol.
>It is lightweight and is suitable for use on all devices from
>low power single board computers to high performance compute servers.
>
>--[(Eclipse Foundation 2022)][eclipse-mosq]

## Install Mosquitto with Docker

To install mosquitto using a [docker compose file][-docker] to
setup a [container][-cont],
define a [docker-compose file][-cont-comp] like below.

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

Some notes about the configurations:

* `version` depends on the schema of the compose file and compose runtime.
* `broker` is the name of the sole service being run in this container pod.
* `image` is the name of the docker image to be used.
* `volumes` are the directories to be mounted in the container, there's a few...
  * `mosquitto` is the root directory of the mosquitto installation,
    which is located in the same parent directory as the compose file.
  * `config` is the directory where the configuration file is located.
  * `data` is the directory where the data is stored.
  * `log` is the directory where the log files are stored.
* `ports` are the ports to be exposed by the container.
  * `1883` is the port used by mosquitto for MQTT communication.
  * `9001` is the port used by mosquitto for websockets communication.

## Configure Mosquitto

### Example Configuration

Here's an example configuration that can be used in the example from before.
There's other sections to describe some of the configuration keys.
The format is just a simple non-spaced key name,
followed by a space and a configuration value.

```txt
allow_anonymous true
listener 1883
persistence false
persistence_location /mosquitto/data
log_dest file /mosquitto/log/mosquitto.log
```

### allow_anonymous

* This specifies whether anonymous connections are allowed.
* The default is `true`.

### listener

* This specifies the port to listen on.
* The default is `1883`.

### persistence

* This specifies whether persistence is enabled.
* The default is `false`.

### persistence_location

* This specifies the directory where persistence data is stored.
* The default is `/mosquitto/data`.

### log_dest

* This specifies the destination for log messages.
* The default is `stderr`.
* To log to a file, use `log_dest file /path/to/file`.

## References

### Web Links

* [Eclipse Foundation. "Eclipse Home". mosquitto.org Jun 29. 2023][eclipse-mosq]

<!-- Hidden References -->
[eclipse-mosq]: https://mosquitto.org "Eclipse Foundation. 'Eclipse Home'"

### Note Links

* [Message Queue Telemetry Transfer (MQTT)][-mqtt]
* [Docker (Software Container Runtime)][-docker]
* [Software Containers][-cont]
* [Container Compose File Format][-cont-comp]

<!-- Hidden References -->
[-mqtt]: mqtt.md "Message Queue Telemetry Transfer"
[-docker]: docker.md "Docker (Software Container Runtime)"
[-cont]: container.md "Software Containers"
[-cont-comp]: container-compose.md "Container Compose File Format"
