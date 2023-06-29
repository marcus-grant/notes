---
created: 2023-06-29T08:21:21.535Z
modified: 2023-06-29T09:21:25.000Z
tags: [publish,subscribe,pattern,network,thread,message,queue]
---
# Publish-Subscribe Pattern

## Introduction

>In software architecture, **publish–subscribe** is a messaging pattern where
>senders of messages, called publishers, do not program the messages to
>be sent directly to specific receivers, called subscribers,
>but instead categorize published messages into classes without
>knowledge of which subscribers, if any, there may be.
>Similarly, subscribers express interest in one or more classes and only
>receive messages that are of interest, without knowledge of which publishers,
>if any, there are.
>
>--[(Wikipedia 2023)][wiki-pub-sub]

It's important to note how *publish-subscribe* is a sibling paradigm to
the [Message Queue Pattern][-mq] and they're both usually a part of
a larger *message-oriented* middleware system.

## References

### Web Links

* [Wikipedia contributors. "Publish-Subscribe Pattern". Wikipedia, the free encyclopedia. Jun 29, 2023][wiki-pub-sub]

<!-- Hidden References -->
[wiki-pub-sub]: https://en.wikipedia.org/wiki/Publish–subscribe_pattern "Wikipedia.org Publish-Subscribe Pattern"

### Note Links

* [Message Queue Pattern][-mq]

<!-- Hidden References -->
[-mq]: message-queue.md "Message Queue Pattern"
