---
date: 2024-11-28 15:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# TCP (Transmission Control Protocol)
A [Transport Layer](Transport_Layer#Transport Protocols) protocol.

- Reliable byte stream protocol over IP 
	- Adds *reliability* 
	- Adds *congestion control* 
- Doesn’t provide framing
	- Delivers an ordered byte stream, the application must impose structure 
- Adds a 16 bit port number as a service identifier
	- Port numbers in the range [0, 65535]

## TCP Connection Setup
#### The 3-way Handshake using TCP sockets
happens during the `connect()`/`accept()` calls 
Call `send()` to transmit data
- Will block until the data can be written, and returns amount of data sent
- Might not be able to send all the data, if the connection is congested
- Returns actual number of bytes sent
- Also see `sendall()`
Call `recv(X)` to read up to X bytes of data from a connection
- Will block until some data is available or the connection is closed
- Returns a bytes object with the data that was received from the socket
- Received data is not null terminated - potential security risk?
All errors handled through *exceptions*

## Communication over TCP
- The `send()` call *enqueues* data for transmission
- This data is *split* into *segments* 
- Each segment is placed in a TCP *packet* 
- That packet is sent *when allowed* by the congestion control algorithm • If the data in a `send()` call is too large to fit into one segment, the TCP implementation will split it into several segments
	- Similarly, several `send()` requests might be *aggregated* into a single TCP segment
	- Both are done *transparently* by the TCP implementation and are invisible to the application
- Implication: the data returned by `recv()` doesn’t necessarily correspond to a single `send()` call
- The `recv()` call can return data in unpredictably sized chunks – applications *must be written to cope* with this

## Congestion Control
TCP uses a window-based congestion control algorithm
	Maintains a sliding window onto the available data that determines how much can be sent according to the AMID algorithm
TCP congestion control highly effective at keeping bottleneck link fully utilised
	Provided sufficient buffering in the network: buffer size = bandwidth × delay
	Packets queued in buffer → delay
	TCP trades some extra delay to ensure high throughput
TCP assumes loss is due to congestion
	Too much traffic queued at an intermediate link → some packets dropped