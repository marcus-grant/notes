---
created: 2023-06-28T18:19:30.607Z
modified: 2023-06-30T20:45:09.595Z
tags: [pcde,module24,project,stream,firebase,realtime,database,alert]
---
# PCDE Project 24.2: Analyzing Live Streaming Data Using ThingsBoard

## Introduction

In the second part of this project,
you will set up an alarm rule chain to send information about
data that is above a certain threshold to [Firebase][-fb].
The data you will be using is live streaming from
the [MQTT protocol][-mqtt] that you set up in
[Project 24.1: Project 1 Part 1][-pcde-proj-24-2].
You will begin by setting up the alarm rule chain.
Next, you will connect the alarm rule chain to
your Realtime database in Firebase.
Finally, you will connect the Root Rule Chain to the alarm rule chain and
verify that the data is being correctly sent to Firebase.

This project will build on what you did in Project 24.1.
Therefore,
complete all of the steps of Project 24.1 before attempting Project 24.2.

## Instructions

### Step 1

Navigate to Firebase.
In the `module24Project` Realtime database,
create a new field titled `alarms` and initialize the corresponding field to zero.

Provide a screenshot to show that you created the alarm field inside
your Realtime database and initialized it to zero.

### Step 2

Navigate to the ThingsBoard home page.
Create a new rule chain titled `CreateAndClearAlarms` by
following the steps shown in [Mini-Lesson 24.5][-tb-alarm].

Provide a screenshot to show that
you created the `CreateAndClearAlarms` rule chain with
all of the necessary components.

### Step 3

Create another rule chain and name it `TempToFirebase`.

Provide a screenshot to show that
you created the `TempToFirebase` rule chain with all of the necessary components.

### Step 4

Open the `TempToFirebase` rule chain.
Add a `rest API call` node and name it `TempToFirebase`.
Replace the default link with the following link:

<https://module24project-default-rtdb.firebaseio.com/temperature.json>

Select `Add` to add the `TempToFirebase` node to your Rule Engine.
Connect the Input and `TempToFirebase` nodes.

Provide two screenshots.
The first screenshot should show that you added the `TempToFirebase` node to
your Rule Engine correctly.
The second screenshot should show that
you connected the Input and `TempToFirebase` nodes.

### Step 5

Create another rule chain and name it `AlarmToFirebase`.

Provide a screenshot to show that
you created the `AlarmToFirebase` rule chain with
all of the necessary components.

### Step 6

Open the `AlarmToFirebase` rule chain.
Add a `rest API call` node and name it `AlarmToFirebase`.
Replace the default link with the following link:

<https://module24project-default-rtdb.firebaseio.com/alarm.json>

Select `Add` to add the `AlarmToFirebase` node to your Rule Engine.
Connect the `Input` and `AlarmToFirebase` nodes.

Provide two screenshots.
The first screenshot should show that you added the `AlarmToFirebase` node to
your Rule Engine correctly.
The second screenshot should show that you connected the `Input` and
`AlarmToFirebase` nodes.

### Step 7

Open the `CreateAndClearAlarms` rule chain that you created in Step 2.
Add a `rule chain node`.
Title this node `AlarmToFirebase` and select `AlarmToFirebase` as the rule chain.
Select `Add` to add the `AlarmToFirebase` node to your Rule Engine.

Provide a screenshot to show that you added the `AlarmToFirebase` node to
your Rule Engine correctly.

### Step 8

Connect the `CreateAlarm` and `AlarmToFirebase` nodes.
Add `Created` as the link label.

Provide a screenshot to show that
you connected the `CreateAlarm` and `AlarmToFirebase` nodes with
a `Created` link label.

### Step 9
Add another `rule chain` node to the `CreateAndClearAlarms` rule chain.
Title this node `TempToFirebase` and select `TempToFirebase` as the rule chain.
Select `Add` to add the `TempToFirebase` node to your Rule Engine.

Provide a screenshot to show that you added the `TempToFirebase` node to
your Rule Engine correctly.

### Step 10

Connect the `MaxTemp` and `TempToFirebase` nodes.
Add `True` as the link label.

Provide a screenshot to show that
you connected the `MaxTemp` and `AlarmToFirebase` nodes with a `True` link label.

### Step 11

Open the Root Rule Chain in ThingsBoard.
Add a `rule chain` node.
Name it `CreateAndClearAlarm` and select `CreateAndClearAlarm` as the rule chain.
Select `Add` to add the `CreateAndClearAlarm` node to your Rule Engine.

Provide a screenshot to show that you added the `CreateAndClearAlarm` node to
your Rule Engine correctly.

### Step 12

Connect the `SaveTimeseries` and `CreateAndClearAlarm` nodes.
Add `Success` as the link label.

Provide a screenshot to show that
you connected the `SaveTimeseries` and `CreateAndClearAlarm` nodes with
a `Success` link label.

### Step 13

Navigate to Firebase and open the `alarm` and `temperature` fields.

Provide two screenshots.
The first screenshot should show that the `alarm` field is being populated with
the live streaming data from the `CreateAndClearAlarm` rule chain.
The second screenshot should show that
the `temperature` field is being populated with `temperature` and
`humidity` data.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Firebase][-fb]
* [Message Queue Telemetry Transport (MQTT)][-mqtt]
* [PCDE Project 24.1][-pcde-proj-24-2]
* [ThingsBoard: Create Alarms][-tb-alarm]

<!-- Hidden References -->
[-fb]: firebase.md "Firebase"
[-mqtt]: mqtt.md "Message Queue Telemetry Transport (MQTT)"
[-pcde-proj-24-2]: pcde-project-24-1.md "PCDE Project 24.1"
[-tb-alarm]: thingsboard.md#create-alarms "ThingsBoard: Create Alarms"
