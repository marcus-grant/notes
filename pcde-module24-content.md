---
created: 2023-06-28T18:11:09.866Z
modified: 2023-06-29T13:06:02.131Z
tags: [pcde,module24,kafka,thingsboard,mosquitto,kafka,big,data]
---
# PCDE Course Module 24 Content

## Introduction

In this module, you will learn about three different tools that can be used to
handle big data: [Mosquitto][-mosq], ThingsBoard, and Kafka.

In the first section, you will learn how to use Mosquitto and
the [Message Queuing Telemetry Transport (MQTT)][-mqtt] protocol to
handle large volumes of data.
First, you will be introduced to Mosquitto and
learn how the MQTT broker processes data so that it can be streamed to clients.
Next, you will learn how to set up a Mosquitto Docker container and
how to publish and subscribe to messages using Mosquitto.
To synthesize what you have learned,
you will then discuss data engineering use cases for Mosquitto.

In the next section,
you will learn how to use [ThingsBoard][-thingsboard] to stream big data.
To get started, you will learn how to create a project in Firebase and
how to configure ThingsBoard in a Docker container.
Then, you will learn about how ThingsBoard works in detail,
including how to set up an environment, how to create a Root Rule Chain,
and how to set up a widget.
Then, you will practice pumping data from ThingsBoard to Firebase.
Finally, you will discuss professional use cases for ThingsBoard.

In the last section of this module,
you will learn how to use Kafka to handle large amounts of live streaming data.
First,
you will be introduced to Kafka and learn how to install it in a Docker container.
Next, you will install Node.js and use it to construct a web server.
You will learn how to use the code blocks needed to
define a producer and a consumer, how to construct a web server using Kafka,
and how to use that web server to stream live data through a Kafka broker.
Then, you will discuss use cases for Kafka in the data engineering community.

## Module 24 Project Overview

In this module, you will also be working on three final projects that
you can add to your portfolio.

Here is an overview of the goals and expectations for this module’s projects:

Projects 24.1 and 24.2 are a ThingsBoard project that is divided into two parts.

In Project 24.1: Project 1: Part 1,
you will set up your Mosquitto, ThingsBoard, and Firebase environments.
To complete this project, you will begin by setting up your MQTT protocol to
produce temperature and humidity data.
Next, you will ensure that the data produced by
the MQTT protocol is published correctly to ThingsBoard.
Finally, you will create a new project and a Realtime database in Firebase and
send the temperature and humidity data to it.

The anticipated time to complete this project is approximately 2.5 hours.

In Project 24.2: Project 1: Part 2,
you will set up an alarm rule chain to send information about
live streaming data that is above a certain threshold to Firebase.
To complete this project, you will begin by setting up the alarm rule chain.
Next, you will connect the alarm rule chain to
your Realtime database in Firebase.
Finally, you will connect the Root Rule Chain to the alarm rule chain and
verify that the data is being correctly sent to Firebase.

The anticipated time to complete this project is approximately 2 hours.

In Project 24.3: Project 2,
you will be working with Kafka, one of the most successful applications for
handling the streaming of big data at scale.
You will use a Docker image created by Confluent that installs all of
the necessary Kafka components including, among others,
the broker and ZooKeeper.
You will begin with a simple Kafka implementation that you will use to
create a Python application that
publishes vehicle location longitude-latitude data to a Kafka topic.
Next, you will use Node.js to start a web server that acts as a consumer for
the messages received from the Kafka application.

The anticipated time to complete this project is approximately 2 hours.

Although the time to complete each project may vary,
be sure to set aside enough time to complete the three final projects for
submission.

To review the project details,
please see the full descriptions of each project at the links below:

* [Project 24.1][pcde-proj-24-1]
* [Project 24.2][pcde-proj-24-2]
* [Project 24.3][pcde-proj-24-3]

## Knowledge Check 24.1: Mosquito

* **Q1**: What is MQTT?
  * MQTT is a protocol for handling sensor data. **(Correct)**.
* **Q2**: Which of the following methods is used by the MQTT broker?
  * Publish and subscribe. **(Correct)**.
* **Q3**: What does MQTT stand for?
  * Message Queuing Telemetry Transport. **(Correct)**.
* **Q4**: Which python library can be used to connect to the MQTT broker?
  * Paho. **(Correct)**.
* **Q5**: Which of the following Python statements will subscribe a client to a topic?
  * client.subscribe("topic"). **(Correct)**.
* **Q6**: What are brokers?
  * Brokers are applications that enable devices, systems and services to
    communicate with each other and exchange information. **(Correct)**

## Discussion 24.1: Use Cases for Mosquitto

### Discussion 24.1: Introduction

You have learned about the challenges of processing IoT data and
how Mosquitto can help in processing the vast amounts of data produced by IoT devices.
Some use cases for Mosquitto include the following:

* Manufacturing
  * Mosquito is used by organizations such as [Celikler Holding][celikler] to
    receive and monitor power plant data.
* Healthcare
  * Mosquitto is used by organizations such as [IBM: Healthcare][ibm-health] to
    collect and analyze data from an implanted device.
* Telemetry
  * Mosquitto is used by organizations such as
    [IBM: Smart Home Monitoring][ibm-home] to collect and analyze data from
    smart home devices, such as thermostats.
* Automotive
  * Mosquitto is used by organizations such as [Volkswagen][vw] and
    [BMW][bmw] to collect and analyze data from smart vehicles.

### Discussion 24.1: Instructions

For this discussion, research other use cases for Mosquitto or dive deeper into
the applications above.
In your discussion post, respond to the following prompts:

* Identify three or more IoT devices that could publish data to an MQTT broker.
* Identify which applications could subscribe to the data published by each of
  these IoT devices and describe how this data could be used.
* Why is a publish/subscribe model more appropriate than an HTTP protocol for
  handling data for IoT devices.
  How does MQTT protocol facilitate the process of handling IoT devices?
* Explain why MQTT is a good choice for the application you selected.

### Discussion 24.1: Submission

#### Identify IoT Devices that Could Publish to an MQTT Broker

The application I chose is the IBM home energy monitoring one.
In this case one sensor above all else are important:
*current and voltage sensors*.
But others that could be used as well to help in
automating an increasingly complex home energy management systems are
*light sensors* to detect expected amount of photons that will hit the home.
Also, *battery management systems* will typically have a way of
reporting current charge.

#### Identify the Application that Could Subscribe to the Data Published

In this application [IBM reports][ibm-home] that:

>The remote connection could be set up by an individual, by a power utility,
>or by a central control point.
>The remote control point can read power usage and provide usage data.
>It can provide data to influence usage such as
>continuous pricing and weather information.
>It can limit load to improve overall power generation efficiency.

So in short, in concert with all the IoT sensors,
IoT actuators like electrical relays can be used to shut down certain circuits.
This would allow intelligent automation of home energy consumers to
times where electricity is cheap, *typically late evening to dawn*.

It also allows for analysis of consumption patterns and
in the case of home solar energy,
detect light radiation and compare it with the current and voltage reported by
the solar panels' sensors and detect any faults due to a mismatch in
actual power generation and expected generation for the current light levels.

As for batteries.
It is becoming increasingly common to have residential battery systems,
including electrical vehicles whose batteries are connected bidirectionally to
people's homes.
This opens opportunities to store electrical energy when there's excess production or
when electricity is cheap.
Then discharge the battery into the home electrical system when energy prices are high.
This requires a good deal of automation that only improves with
a sensor and actuator network optimized around home energy use.

#### Why is a Publish/Subscribe Model More Appropriate than an HTTP?

HTTP by design is a *request/response* model.
This means a client only receives a response *after* requesting one.
This is problematic for IoT devices for several reasons.
Home sensor connections need to have margins of intermittency in their connection.
They also may need a protocol more geared to low power consumption.

#### How Does MQTT Protocol Facilitate the Process of Handling IoT Devices?

MQTT solves both problems,
being able to queue intermittently connected *publishers* with
*subscribers* looking for this data when it's possible to be transmitted.
MQTT also enables connecting using lower power wireless communication protocols.
Zigbee is a very popular example of this that is well suited to sending data via
MQTT.

#### Explain Why MQTT is a Good Choice for the Application You Selected

MQTT is a good choice for home energy monitoring and automation.
Homes can be have intermittent internet connections.
Sensors in homes need to sometimes have low power consumption and
transmit to a broker with many rooms to penetrate a wireless signal.
Power companies piping into these automations are going to deal with
a veritable flood of intermittent data where each
MQTT broker can "act as a network concentrator" (IBM 2022).

## References

### Web Links

* [EMQX. "EMQ Helps SAIC Volkswagen Build IoV Platform." EMQX. 17 Dec. 2022.][vw]
* [Hema. "MQTT Implementation on Celikler Holding's Power Plant Monitoring". Bevywise. 29 Sept. 2020.][celikler]
* [HiveMQ. "Car-Sharing Application Relies on HiveMQ for Reliable Connectivity". HiveMQ. 2022.][bmw]
* [IBM Corporation. "Telemetry Use Case: Home Energy Monitoring and Control". IBM. 17 Feb. 2022.][ibm-home]
* [IBM Corporation. "Telemetry Use Case: Home Patient Monitoring". IBM. 17 Feb. 2022][ibm-health]

<!-- Hidden References -->
[vw]: https://www.emqx.com/en/blog/emqx-in-volkswagen-iov "EMQ Helps SAIC Volkswagen Building IoV Platform"
[celikler]: https://www.bevywise.com/blog/iot-success-stories-mqtt-broker-celikler-holding/ "MQTT Implementation on Celikler Holding's Power Plant Monitoring"
[bmw]: https://www.hivemq.com/case-studies/bmw-mobility-services/ "Car-Sharing Application Relies on HiveMQ for Reliable Connectivity"
[ibm-home]: https://www.ibm.com/docs/en/ibm-mq/8.0?topic=cases-telemetry-use-case-home-energy-monitoring-control "Telemetry Use Case: Home Energy Monitoring and Control"
[ibm-health]: https://www.ibm.com/docs/en/ibm-mq/8.0?topic=cases-telemetry-use-case-home-patient-monitoring "Telemetry Use Case: Home Patient Monitoring"

### Note Links

* [PCDE Project 24.1][pcde-proj-24-1]
* [PCDE Project 24.2][pcde-proj-24-2]
* [PCDE Project 24.3][pcde-proj-24-3]
* [Message Queue Telemetry Transport (MQTT)][-mqtt]
* [Mosquitto (MQTT Broker)][-mosq]
* [Paho (Python MQTT Library)][-paho]
* [Firebase][-firebase]
* [Thingsboard (IoT Platform)][-thingsboard]

<!-- Hidden References -->
[pcde-proj-24-1]: pcde-project-24-1.md "PCDE Project 24.1"
[pcde-proj-24-2]: pcde-project-24-2.md "PCDE Project 24.2"
[pcde-proj-24-3]: pcde-project-24-3.md "PCDE Project 24.3"
[-mqtt]: mqtt.md "Message Queue Telemetry Transport (MQTT)"
[-mosq]: mosquitto.md "Mosquitto (MQTT Broker)"
[-paho]: python-paho.md "Paho (Python MQTT Library)"
[-firebase]: firebase.md "Firebase"
[-thingsboard]: thingsboard.md "Thingsboard (IoT Platform)"
