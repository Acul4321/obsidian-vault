---
date: 2024-11-28 15:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# DCCP (Datagram Congestion Control Protocol)
A [Transport Layer](Transport_Layer#Transport Protocols) protocol.
not widely used, but has potential

- Unreliable, connection orientated, congestion controlled datagram service“
	- TCP without reliability” or “UDP with connections and congestion control”
	- Potentially easier for NAT boxes and firewalls than UDP
	- Congestion control algorithm (CCID) negotiated at connection setup – range of algorithms supported
- Adds 32-bit service code in addition to port number
- Use case: streaming multimedia and IPTV