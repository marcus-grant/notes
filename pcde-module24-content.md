---
created: 2023-06-28T18:11:09.866Z
modified: 2023-07-12T15:46:39.239Z
tags: [pcde,module24,kafka,thingsboard,mosquitto,kafka,big,data]
---
# PCDE Course Module 24 Content

## Introduction

In this module, you will learn about three different tools that can be used to
handle big data: [Mosquitto][-mosq], ThingsBoard, and [Kafka][-kafka].

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

## Knowledge Check 24.2: ThingsBoard

* Q1: What is a device in ThingsBoard?
  * an abstract component that records and transmits the telemetry data **(Correct)**.
* Q2: Which of the following are ThingsBoard components?
  * all the above **(Correct)**.
* Q3: What is the use of an alarm in ThingsBoard?
  * to monitor and notify users or clients when data reaches thresholds **(Correct)**.
* Q4: Which of the following needs to be set up in ThingsBoard to
  facilitate streaming data to devices?
  * root rule chain **(Correct)**.
* Q5: What is ThingsBoard?
  * Open Source IoT platform for data collection, processing, visualization and
    device management **(Correct)**.
* Q6: Which of the following functionalities can be found in the ThingsBoard Interface?
  * Rule management **(Correct)**.
* Q7: To configure ThingsBoard to receive telemetry data from one device.
  How many log nodes are required to setup in the Root Rule Chain?
  * 2 **(Correct)**.
* Q8: What is a rule chain?
  * a A logical group of rule nodes and their relations **(Correct)**.

## Discussion 24.2: Use Cases for ThingsBoard

### Discussion 24.2: Introduction

ThingsBoard is a robust platform that interacts with IoT devices and
the data that they produce.
ThingsBoard is device-based, meaning that it’s able to
analyze telemetry data derived from devices, applications, or sensors.
Therefore, ThingsBoard can be used in many applications,
ranging from industry applications to environment monitoring or smart working.
These use cases are described in greater detail below:

* **Smart Farming**
  * Thingsboard has a smart farming component that can easily embed into IoT solutions.
  * This particular dashboard allows users to monitor and control aeration inside silos.
  * [(ThingsBoard Authors 2022)][tb-smart-farm]
* **Environment Monitoring**
  * ThingsBoard can also be used in environment monitoring applications such as:
    * Air quality monitoring
    * Weather monitoring in countries or continents
    * Seismology monitoring and control
    * Noise level monitoring and control
  * [(ThingsBoard Authors 2022)][tb-env-mon]
* **Smart Working**
  * ThingsBoard has applications in smart working as well.
  * For example:
    * energy management
    * control of access and logins
    * tracking occupancy of meetings
  * [(ThingsBoard Authors 2022)][tb-smart-work]

### Discussion 24.2: Instructions

For this discussion, research other use cases of ThingsBoard or dive deeper into
the applications listed above.
In your discussion post, respond to the following prompts:

* Explain why ThingsBoard would be a good choice to use for your selected application.
* Determine if any ThingsBoard alarms should be included and
  describe how they would improve your application.
* Finally, consider which particular widgets could be used to
  enhance the analysis of your data.
  Explain which widgets you selected and describe what they would do.

Read the statements posted by your peers. Engage with them by responding with
thoughtful comments and questions to deepen the discussion.

### Discussion 24.2: Submission

I chose the smart working environment use case.

#### Explain why THingsBoard would be a good choice

Thingsboard is great for smart work environments because
it can broker streaming data from many IoT devices at irregular intervals and
apply complex logic to them both in code but also in more user friendly UIs.
This enables management of this logic and data by people who don't necessarily know
how to code while still providing complex functionality.

#### Determine if any alarms should be used

Security comes to mind first.
There could be a time of the day or night in this case where
any sensors detecting motion within a work environment past allowed work hours is
interpreted as a break in.
This could be an alarm that notifies the right people at that workplace of
a potential security concern.
But also simpler tasks like thermostat functionality could come with
an alarm that notifies an office manager that something might be wrong with
it if temperatures are increasing despite the AC system being set to cool to a temperature.

#### What Widgets

One of the big operational costs of a workplace are electricity bills.
There could be various widgets for sensors that report hourly, daily, monthly, etc.
electricity consumption for different parts of the workplace.
Those widgets could then be used to determine how to best lower those costs.

## Discussion 24.3: Use Cases for Kafka

### Discussion 24.3: Introduction

Kafka is used to create live streaming data pipelines and applications.
As you continue to learn about data streaming platforms,
you will build on your understanding of how Kafka is useful for
maintaining a steady messaging queue of data when the volume of data is massive.

This discussion will help you determine whether or not Kafka would be useful for
a particular project scenario.
Some project scenarios in which Kafka can be useful are:

#### Discussion 24.3: Project Scenarios

* Financial Domain: Kafka is used for fraud detection at
  [ING Bank][kafka-case-ing].
* Stock Market: The Pan-European stock exchange uses Kafka to
  power its [event-driven trading platform][kafka-case-trading].
* Location Sharing Applications:
  The [Real Time Locating System (RLTS)][kafka-case-rlts] uses Kafka to
  track transportation and logistics data to
  track the location of assets or people in real time.
* Web Traffic Tracking: Kafka can be used to track clicks, likes,
  and views on platforms such as Twitter, Amazon, and Google.
  For example,
  Kafka can be used to collect [web application metrics][kafka-case-web-metric]
  and to [analyze website visitors][kafka-case-web-visit] in real time.
* Business Applications: Kafka enables organizations to
  process live streams of large volumes of data to manage modern workloads.
  This [real time processing of massive data streams][kafka-case-rt-big-data]
  helps a variety of organizations to manage their businesses.
  Kafka is used by organizations in a variety of sectors including:
  [Audi, BMW, Disney, Generali, Paypal, Tesla, Unity][kafka-case-big-co]
  Walmart, William Hill and more Links to an external site.” (Waehner 2020).

### Discussion 24.3: Instructions

The key questions to consider when assessing whether or
not to use Kafka for a specific project are:

* Will the application transfer or create gigabytes of data on a daily basis?
* Do you think a simple message queue could easily handle the data or
  communication packets created by those utilizing the application?

For your discussion post,
choose any two project scenarios from the list above or
research your own use case examples.
Explain a case in which you would use Kafka and
a case in which this tool might not be the best choice.
Be sure to address the two questions above in both scenarios that you analyze.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

### Discussion 24.3: Submission

Kafka seemingly is capable of Gigabyte per seconds and up of data transfers.
It's hard to know just how much it is capable of because it would take so many nodes
to test where parallelism is limited.
It is however a complex way to implement MQTT based pipelines,
so it's important to determine if it's overkill for the application.
The two use cases I chose are that of collecting and distributing web metrics and
analyzing website visitation.

#### Kafka in Web App Metrics Cases

The lightweight MQTT protocol and the intermittent nature of
web applications and their collection of various usage metrics,
makes Kafka great at collecting extremely numerous streams of usage metrics.
Seemingly, even some of the most popular sites on the internet like YouTube or
Facebook might not overload a large enough Kafka cluster when collecting user
interface metrics.
However, if it's a web app with less traffic, this could easily be overkill.
User metrics during a web app is likely no more than
a few hundred bytes of data per second in intermittent bursts and
a single Mosquitto message queue and through personal testing Mosquitto is at least
capable of hundreds of megabytes a second,
meaning about a million simultaneous users should be possible.

#### Kafka in Website Visitation Analysis

Kafka is great for analyzing website visitation because
of its scalability and the lightweight protocol of MQTT.
It's easy to imagine a Kafka cluster that can handle the data of
many millions of site visit counters embedded in CDN servers or
javascript scripts counting visits.
It's very similar to collecting metrics to web applications and very likely if
you're collecting web app metrics you're also collecting visit metrics as well.
Since it's much simpler data to transmit, even with trackers embedded,
it's unlikely unless you're in the top 500 of visited sites that you need something
like Kafka for visit metrics by itself.



## References

### Web Links

* [EMQX. "EMQ Helps SAIC Volkswagen Build IoV Platform." EMQX. 17 Dec. 2022.][vw]
* [Hema. "MQTT Implementation on Celikler Holding's Power Plant Monitoring". Bevywise. 29 Sept. 2020.][celikler]
* [HiveMQ. "Car-Sharing Application Relies on HiveMQ for Reliable Connectivity". HiveMQ. 2022.][bmw]
* [IBM Corporation. "Telemetry Use Case: Home Energy Monitoring and Control". IBM. 17 Feb. 2022.][ibm-home]
* [IBM Corporation. "Telemetry Use Case: Home Patient Monitoring". IBM. 17 Feb. 2022][ibm-health]
* [ThingsBoard Authors. "Smart Farming and Smart Agriculture Solutions". ThingsBoard. 2022][tb-smart-farm]
* [ThingsBoard Authors. "Environment Monitoring Solutions". ThingsBoard 2022][tb-env-mon]
* [ThingsBoard Authors. "Smart Office Solutions". ThingsBoard. 2022][tb-smart-work]
* [Timuri, Timor and Richard Bras. "The Evolution of Kafka at ING Bank". Confluent. 2018][kafka-case-ing]
* [Confluent, Inc. "Pan-European Stock Exchange Relies on Confluent to Power Event Driven Trading Platform. Confluent. 2020][kafka-case-trading]
* [Daza, Lucio. "Using Kafka for Collecting Web Application Metrics in Your Cloud Data Lake". Towards Data Science. 3 June 2020][kafka-case-web-metric]
* [Hashemian, Vahid. "Real-Time Website Visitor Analysis with Apache Kafka". IBM. 11 Jan. 2018][kafka-case-web-visit]
* [Kwong, Dennis, Jac Noel, Jason Stark, Meritte Stidston, and Juan Fernandez. "Enabling Real-Time Processing of Massive Data Streams". Intel. 21 Aug. 2020][kafka-case-rt-big-data]
* [Waehner, Kai. "Real-Life Use Cases & Architectures for Event Streaming with Apache Kafka". SlideShare. 12 Oct. 2020][kafka-case-big-co]
* [Waehner, Kai. "Real Time Locating System (RLTS) with Apache Kafka for Transportation and Logistics". Kai Waehner. 7 Jan. 2021.][kafka-case-rlts]

<!-- Hidden References -->
[vw]: https://www.emqx.com/en/blog/emqx-in-volkswagen-iov "EMQ Helps SAIC Volkswagen Building IoV Platform"
[celikler]: https://www.bevywise.com/blog/iot-success-stories-mqtt-broker-celikler-holding/ "MQTT Implementation on Celikler Holding's Power Plant Monitoring"
[bmw]: https://www.hivemq.com/case-studies/bmw-mobility-services/ "Car-Sharing Application Relies on HiveMQ for Reliable Connectivity"
[ibm-home]: https://www.ibm.com/docs/en/ibm-mq/8.0?topic=cases-telemetry-use-case-home-energy-monitoring-control "Telemetry Use Case: Home Energy Monitoring and Control"
[ibm-health]: https://www.ibm.com/docs/en/ibm-mq/8.0?topic=cases-telemetry-use-case-home-patient-monitoring "Telemetry Use Case: Home Patient Monitoring"
[tb-smart-farm]: https://thingsboard.io/smart-farming/ "Smart Farming and Smart Agriculture Solutions"
[tb-env-mon]: https://thingsboard.io/use-cases/environment-monitoring/ "ThingsBoard Environment Monitor Solution"
[tb-smart-work]: https://thingsboard.io/use-cases/smart-office/ "Smart Office Solutions"
[kafka-case-ing]: https://www.confluent.io/kafka-summit-london18/the-evolution-of-kafka-at-ing-bank/ "Kafka at ING"
[kafka-case-trading]: https://assets.confluent.io/m/2d66dbb4330b91a6/original/20190425-CS-Euronext.pdf "Kafka at Pan-European Stock Exchange"
[kafka-case-web-metric]: https://towardsdatascience.com/using-kafka-for-collecting-web-application-metrics-in-your-cloud-data-lake-b97004b2ce31 "Kafka for Web Metrics"
[kafka-case-web-visit]: https://developer.ibm.com/tutorials/realtime-visitor-analysis-with-kafka/ "Kafka for Realtime Visitor Analysis"
[kafka-case-rt-big-data]: https://www.intel.com/content/dam/www/public/us/en/documents/pdf/enabling-real-time-processing-of-massive-data-streams.pdf "Kafka Enabling Real-Time Processing of Massive Data Streams"
[kafka-case-big-co]: https://www.slideshare.net/KaiWaehner/reallife-use-cases-architectures-for-event-streaming-with-apache-kafka "Kafka Use Cases for Live Event Streaming"
[kafka-case-rlts]: https://www.kai-waehner.de/blog/2021/01/07/real-time-locating-system-rtls-apache-kafka-asset-tracking-transportation-logistics/ "Kafka RLTS"

### Note Links

* [PCDE Project 24.1][pcde-proj-24-1]
* [PCDE Project 24.2][pcde-proj-24-2]
* [PCDE Project 24.3][pcde-proj-24-3]
* [Message Queue Telemetry Transport (MQTT)][-mqtt]
* [Mosquitto (MQTT Broker)][-mosq]
* [Paho (Python MQTT Library)][-paho]
* [Firebase][-firebase]
* [Thingsboard (IoT Platform)][-thingsboard]
* [Kafka][-kafka]
* [Node.JS (Javascript Runtime)][-node]

<!-- Hidden References -->
[pcde-proj-24-1]: pcde-project-24-1.md "PCDE Project 24.1"
[pcde-proj-24-2]: pcde-project-24-2.md "PCDE Project 24.2"
[pcde-proj-24-3]: pcde-project-24-3.md "PCDE Project 24.3"
[-mqtt]: mqtt.md "Message Queue Telemetry Transport (MQTT)"
[-mosq]: mosquitto.md "Mosquitto (MQTT Broker)"
[-paho]: python-paho.md "Paho (Python MQTT Library)"
[-firebase]: firebase.md "Firebase"
[-thingsboard]: thingsboard.md "Thingsboard (IoT Platform)"
[-kafka]: kafka.md "Kafka"
[-node]: nodejs.md "Node.JS (Javascript Runtime)"
