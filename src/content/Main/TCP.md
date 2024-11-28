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
#### The 3-way Handshake
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

