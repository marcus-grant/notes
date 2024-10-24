---
created: 2024-07-12T13:31:00.000Z
tags: [home,network]
---

Kraeftvaegen Home Network
=========================

Overview
--------

These are notes about the home network at Mom & Dad's house in Kräftvägen 1, Lidingö.

Previous Setup
--------------

We're moving in so we need to know what's already there.

### UniFi Main Switch
For starters we have a UniFi 8-way switch in
the net closet (in the bathroom) with 2 SFP uplinks.
This is a managed switch so VLANs might be mapped to different ports.
Therefore it's very important that until we replace it or
get access to its admin UI we don't mess with the connections.
Below are the known wired connections to it:

* Port 1:
  * Connects to port 4 on old ISP router
  * More info in next section of connection lists.
* Port 2:
  * Connects to `AP Hall` labelled wall socket
  * `AP Hall` appears to be the access point in the hallway by main entrance.
* Port 3:
  * Unoccupied
* Port 4:
  * Connects to Port 1 of junction box in the top right corner of net closet
    * Labelled `AP Tvätt`
* Port 5:
  * Connects to security system wireless transciever in net close outlet.
  * It's the white box with that flower logo.
  * **NOTE**: On the handdrawn diagram it claims it's connected *Port 6*
    * Verifiably untrue right now
* Port 6:
  * Connects to *Port 2* of same junction box as in *Port 4* on top right.
  * Labelled `AP Ute`.
* Port 7:
  * Goes to cable cable raceway along left window of net closet.
  * More details on what this is in next port.
  * Labelled on handdrawn diagram as `Philib ????`
    * This is probably the sprinkler system sensor.
      * Takes ethernet.
      * Sits on other side of wall on the outside.
* Port 8:
  * This also goes into the same raceway as *Port 7*.
  * Could be the outdoor AP
    * ...but that contradicts the junction box from Port 6.
  * Needs further investigation.

### Old ISP Router

This is the old `technicolor` ISP router that's been there... for too long.

* Port WAN:
  * Connects to Junction socket labelled `Fiber IN`
    * This comes from the Fiber ONT's LAN port 1 upstairs in the living room.
* Port 1:
  * Connects to the Siemens Gigaset C470IP DECT base station.
* Port 2:
  * Unoccupied
* Port 3:
  * Unoccupied
* Port 4:
  * Connects to Main UniFi switch in previous section.

New Router from Telia
---------------------

Now we have a router from Telia.
It's going to replace the old technicolor that came with the house.
Eventually it will be replaced by a linux PC but that's for another time.
Below is the port map.

* Port WAN:
  * Connects to the Fiber ONT's LAN port 1 upstairs in the living room.
  * This port on the router is a 2.5G port.
* Port 1:
  * Connects to the Siemens Gigaset C470IP DECT base station.
  * 1G port.
* Port 2:
  * Unoccupied
* Port 3:
  * Unoccupied
* Port 4:
  * Next to WAN port
  * Connects to the Main UniFi switch in the net closet.
  * 2.5G port.
