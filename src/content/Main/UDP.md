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

## UDP connection setup
UDP provides an *unreliable datagram service*, identifying applications via a 16 bit port number
- UDP ports are separate from TCP ports
- Often used peer-to-peer, so both peers must `bind()` to a known port.
- Create via `socket()` as usual, but specify **SOCK_DGRAM** as the socket type
- No need to `connect()` or `accept()`, since no connections in UDP
The `sendto()` call sends a *single datagram*
- Each call to `sendto()` can send to a different address, even though they use the same socket
- Alternatively, `connect()` to an address, then use `send()` to send the data
	- `connect()` on a UDP socket merely sets a *default destination* address for future `send()` calls
- The `recvfrom()` call may be used to read a single datagram (also returns the sender’s address)
- Unlike TCP, each UDP datagram is sent as exactly one IP packet (which may however be fragmented in [[Internet#versions|IPv4]])
	- Each `recvfrom()` corresponds to a single `sendto()`
## Communication over UDP
But, transmission is *unreliable*, packets may be: 
- lost
- delayed
- reordered
- duplicated in transit
The application is responsible for correcting the above, if necessary
Application must organise the data so it’s useful if some packets lost.

Need to provide sequencing, reliability, and timing in applications
- Sequence numbers and acknowledgements
- Retransmission and/or forward error correction
- Timing recovery
Need to implement congestion control in applications
- To avoid congestion collapse of the network
- Should be approximately fair to TCP
- Difficult to do well – TCP congestion control covers many corner cases that are easy to miss