---
created: 2023-03-06T10:43:49.354Z
modified: 2023-06-29T13:36:36.861Z
tags: [network,computer,protocol,ip,http,ssh,ftp,webdav,pcde,module10]
---
# Computer Networks

According to [Wikipedia][computer-nets-wiki]:

>A computer network is a set of computers sharing resources located on or
>provided by network nodes.
>The computers use common communication protocols over
>digital interconnections to communicate with each other.
>These interconnections are made up of telecommunication network technologies,
>based on physically wired, optical, and wireless radio-frequency methods that
>may be arranged in a variety of network topologies.

## Internet Protocol (IP)

>**Note:** Read more at [Internet Protocol Suite (TCP/IP)][-tcp-ip]

The Internet Protocol (IP) is the principal communications protocol being used on
the Internet.
As part of the OSI model, IP is the network layer protocol,
or layer 3 protocol, in the Internet protocol suite.
Devices form a network based on an IP address.
Which is a 32-bit number that is used to identify a device on a network,
at least when it comes to IPv4.
In the future IPv6 will be used, which is a 128-bit number.
NAT or Network Address Translation is used to translate the IP address of an
internal network to an external IP address, which expands the number of
available IP addresses on the Internet.

## Application Layer Protocols

### HTTP

[HTTP][-http] is by far the most used application layer protocol on the Internet.

### Publish-Subscribe Pattern

>**Note:** See the [Publish Subscribe Pattern][-pub-sub] for more details.

In software architecture, publish–subscribe is a messaging pattern where
senders of messages, called publishers, do not program the messages to
be sent directly to specific receivers, called subscribers,
but instead categorize published messages into classes without
knowledge of which subscribers, if any, there may be.
Similarly, subscribers express interest in one or more classes and only
receive messages that are of interest, without knowledge of which publishers,
if any, there are.

One of the benefits of the *publish/subscribe* model vs.
the *request/response* model of HTTP and REST,
is that it doesn't rely on a reliable connection.
Clients can connect and disconnect randomly and
the queue of the broker will manage flushing of the queue by
delivering the message when it can.

### Message Queue

>**Note:** See the [Message Queue Pattern Notes][-mq] for more details.

In computer science, **message queues** and
mailboxes are software-engineering components typically used for
inter-process communication (IPC),
or for inter-thread communication within the same process.
They use a queue for messaging – the passing of control or of content.
Group communication systems provide similar kinds of functionality.

### Message Queue Implementations

Here are some of the dominant Message Queue implementations:

* [MQTT][-mqtt]

### Message Queues and Internet of Things

The [Internet of Things][-iot] takes these kinds of message queuing networks and
applies it to create vast networks of low power and simpler devices to
communicate with each other and traditional servers.

## References

### Web Links

* [Computer network (from Wikipedia, the free encyclopedia)][computer-nets-wiki]

<!-- Hidden References -->
[computer-nets-wiki]: https://en.wikipedia.org/wiki/Computer_network "Computer network (from Wikipedia, the free encyclopedia)"

### Note Links

* [HyperText Transfer Protocol][-http]
* [Internet Protocol Suite (TCP/IP)][-tcp-ip]
* [Publish Subscribe Pattern][-pub-sub]
* [Message Queue][-mq]
* [Message Queue Telemetry Transport][-mqtt]
* [Internet of Things (IoT)][-iot]

<!-- Hidden References -->
[-http]: http.md "HyperText Transfer Protocol"
[-tcp-ip]: internet-protocol-suite.md "Internet Protocol Suite (TCP/IP)"
[-pub-sub]: publish-subscribe.md "Publish Subscribe Pattern"
[-mq]: message-queue.md "Message Queue"
[-mqtt]: mqtt.md "Message Queue Telemetry Transport"
[-iot]: iot.md "Internet of Things (IoT)"
