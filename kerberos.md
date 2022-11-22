---
tags: #kerberos,#infosec,#authentication,#web
---
# Kerberos

Kerberos is an authentication server. It simplifies the management of identities.

N^2 identities to servers are a problem when there's a lot of users and servers they all need to interconnect to.

## Kerberos Authentication & Authorization Services

### REquesting a Ticket-Granting-Ticket (TGT)

First a user requests a ticket-granting-ticket *TGT*. This is in plain text. Kerberos now looks up Alice's secret key, encrypted using users' previously defined encrypted key.

Then the user decrypts the TGT using their already present private key.

With the key decrypted by the response of the TGT, now a request is made using the TGT decrypted key. This key is then matched as a *VKey* within kerberos.

This is a problem because an attacker might observe the request using the Vkey as it's decrypted.
