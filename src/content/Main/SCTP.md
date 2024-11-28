---
date: 2024-11-28 15:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# SCTP (Stream Control Transmission Protocol)
A [Transport Layer](Transport_Layer#Transport Protocols) protocol.
not widely used, but has potential

- Reliable datagram service; ordered per stream
- Multiple streams within a single association
- Multiple connection management
	- Fail-over from one IP address to another, for reliable multihoming
- TCP-like congestion control • Use case: telephony signalling; “a better TCP”