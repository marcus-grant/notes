---
created: 2023-04-20T12:21:10.523Z
modified: 2023-05-04T12:56:20.588Z
tags: [pcde,module16,transit,api,web,python,cdc,change,data,capture,database,container]
---
# PCDE Course Module 16 Content: Transit Data & APIs

## Introduction

In this module,
you will be working on another project that you can add to your portfolio.
Throughout this module,
you will learn about location-based applications and
how to build the various components to create one yourself.
You will also be introduced to two new tools,
[Mapbox][-mapbox] and [Maven][-maven],
and you will learn about the curl command,
which is used to transfer data to or from a server.

In Project 16.1, you will build a transit data application.
To complete this project, you will need to use knowledge from earlier modules to
enhance a Flask web application provided by Dr. Sanchez that
displays the position of buses on a map using data from the MBTA.

Here is an overview of the goals and expectations for this module’s project:

You will be using the MBTA API to determine the position of
buses (longitude and latitude) along Route 1.
Take the time to familiarize yourself with the format of
the data returned by the API and the documentation provided by the MBTA.

You will be using a [MySQL database][-mysql] that you will create to
store the information that you retrieve from the MBTA API.
You will then periodically make calls to the MBTA API,
parse the [JSON][-json] data returned by the API,
and insert new rows into the table that you have created.

You also learned about [change data capture (CDC)][-cdc] and
how it is necessary to
propagate changes from the master database to other databases.
You will use [Debezium][-debezium] to monitor changes to your MySQL database and
propagate the changes to a MongoDB database.

In the final part of the project,
you will analyze the data stored in the MySQL database.
After letting your web application run for 12 hours,
you will assess some insights that you can gather from the data you have collected.
This is the ultimate goal of a data engineer:
to be able to find patterns in data and to draw conclusions from that data.

The anticipated time to complete this project is approximately 11 hours.

Although the time to complete the project may vary,
be sure to set aside enough time to complete the final project for submission.

To review the final project details,
please see the [full description of Project 16.1][-project16].

## Knowledge Check 16.2: Mapbox

* Q1: What code do you need to include in your HTML header when
using the Mapbox library?
  * HTML **(WRONG)**
  * JavaScript and CSS **(Correct)**
* Q2: Which feature can you add to your map by using the Mapbox `.addTo(Map)` function?
  * A marker **(Correct)**
* Q3: Which of these features does Mapbox include?
  * Vector tiles **(Correct)**
* Q4: What is the first command needed when adding a layer to a Mapbox map?
  * `map.addLayer()` **(WRONG)**
  * `map.on('load', () => {})` **(Correct)**
* Q5: Which RGBA `fill-color` code defines a shade of the color green?
  * `rgba(0, 255, 0, 0.5)` **(Correct)**
    * Could be anything where the second number is largest
    * Also note the first three numbers are 0-255 and the last is 0-1 (alpha)
* Q6: Which of the following is NOT something you can do in Mapbox?
  * Set the color of a park to green **(WRONG)** (inversion error)
  * Highlight a route on a map **(WRONG)** (inversion error)
  * Set the sky color to blue **(Correct)**

## Discussion 16.1: Use Cases of Location-Based Applications

### Discussion Prompt

With modern technology,
society has shifted to become dependent on applications for navigation,
rideshares, geotags, and even advertisements.
These apps rely on location-based services (LBS).
Starting in the late 1990s, organizations started experimenting with GPS and new,
more powerful mobile devices that
could handle computationally heavy graphic user interfaces (GUIs).
This took off,
and developers have been finding new ways to
utilize geopositioning data ever since.

Today, when an application seeks to use and store user location data,
there are many terms to consider.
Not only is location data a privacy and security concern,
but if an application requests location services from
a device and there is not a clear reason for the application to use this data,
the user may be resistant to installing the app altogether.
For example,
if your favorite mobile game Candy Crush started asking for your location,
you might become suspicious because there is no direct need for that information.

There are some use cases where location services are the entirety of
an application or device,
and therefore the data must be processed and stored in an appropriate manner.
Most intelligent location services also utilize much more than just
GPS latitude and longitude;
if a device is connected to WiFi, the location can be more precisely triangulated.
Some applications, such as truck freight tracking,
also use location trackers set up on the side of
the freeways along with GPS services.

Many of the advertisements you see on
your mobile devices are a result of LBS selling data for profit.
This is why you often see the same advertisements as your friends.
Organizations such as Facebook and Amazon will purchase location data to
gain knowledge of an individual's physical location.
Then, these major platforms will sell advertisements based on
common location interests.
Although this raises ethical questions,
the transfer and sale of personal information is a common and
profitable aspect of many applications.

In this discussion,
you will identify an existing LBS and
answer the following questions related to it.
The LBS can be any specific device or application.
Provide a detailed explanation for each of the following questions:

* What security and privacy risks does this LBS pose?
* How often should the LBS ping the device for its location?
* Can the LBS be turned off?
* Who has access to the user data history
(just the user, an organization as a whole, the government, other entities, etc.)?
* Would you sell the user data?
* Could the LBS be improved?

After answering all of the questions above,
think of a mobile application that shouldn’t have LBS access.
Then think about whetheryou have personally experienced an application asking for
your location when there is no clear reason that it should need that information.
Provide a short example and discuss this with your peers.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

**Suggested Time**: 60 minutes

**Suggested Length**: 200~250 words

### My Response

#### The Application

My application of LBS is a dog tracking collar I use,
one is an AirTag and the other is GPS based.
We have a dog who is prone to running off if it spots an interesting animal.

#### Security and Privacy Risks

The collar and associated application pose several privacy risks.
The AirTag phones home to Apple servers via any nearby iPhone,
or internet connected device with a bluetooth radio.
This creates a rough calculation of the AirTag's location in any populated area.
The GPS tracker is more reliable and uses a cellular connection to
report its location to a server whenever it moves.

Why mention that?
Well my dog, most of the time is near me or a family member.
That means the services tracking the dog can reasonably guess where we are.
And while Apple has the resources to hire the best security experts,
the startup that created the GPS tracker doesn't.
Data leaks means that someone could find out where we live,
where we work, and where we hang out and at what times.

#### Frequency of Location Updates

The AirTag system to be as power efficient as possible doesn't update very often.
But this is still useful because it gives you general locations where
the dog has been and following it will eventually lead you to the dog.
The GPS system updates whenever it detects motion,
so it's only active when it needs to be and updates a few times a minute.

#### Can the LBS be Turned Off?

Yes - The AirTag can be turned off by an app as can the GPS tracker.
The reason we don't do this is because it renders the device useless,
should we ever forget to turn it back on whenever we let the dog out or walk it.
So we're kind of incentivized to leave it on and charge them whenever we
take the collar off at home.

#### Who has Access to the User Data History?

The companies that make the devices and the apps that use them.
Although I must say,
Apple makes it extremely inconvenient to access the data and
I don't know how GPDR doesn't seem to apply in
the same way to them as it does for others.
You can view maps of where it has been in snapshots,
but I can't actually dump all of the data they have on my tag.

#### Would You Sell the User Data?

We don't know,
Apple is extremely opaque about what they do with the data.
The GPS tracker company is a startup and
the privacy disclosure is somewhat vague about it.

#### Could the LBS be Improved?

Yes,
I'm a firm believer in local processing and storage of data and
think basically all these concerns disappear if the data is stored and
the application is hosted locally or on remote servers that I control.
The question is how do we make that easy enough that it's just a turnkey solution?

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [PCDE Project 16: Build a Transit Data Application][-project16]
* [Mapbox][-mapbox]
* [MySQL][-mysql]
* [Maven (Java Build Tool)][-maven]
* [JavaScript Object Notation (JSON)][-json]
* [Change Data Capture (CDC)][-cdc]
* [Debezium][-debezium]
* [CSS][-css]
* [MBTA API][-mbta-api]

<!-- Hidden References -->
[-project16]: pcde-project-16.md "PCDE Project 16: Build a Transit Data Application"
[-mapbox]: mapbox.md "Mapbox"
[-mysql]: mysql.md "MySQL"
[-maven]: maven.md "Maven (Java Build Tool)"
[-json]: json.md "JavaScript Object Notation (JSON)"
[-cdc]: cdc.md "Change Data Capture (CDC)"
[-debezium]: debezium.md "Debezium"
[-css]: css.md "CSS"
[-mbta-api]: mbta-api.md "MBTA API"
