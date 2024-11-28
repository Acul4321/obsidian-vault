---
date: 2024-11-28 15:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# UDP (User Datagram Protocol)
A [Transport Layer](Transport_Layer#Transport Protocols) protocol.

- Simplest transport protocol
- Exposes raw IP service to applications
	- Connectionless, best effort packet delivery: framed, but unreliable
	- No congestion control
- Adds a 16 bit port number as a service identifier
	- Port numbers in the range [0, 65535]