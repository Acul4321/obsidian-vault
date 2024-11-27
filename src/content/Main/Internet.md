---
date: 2024-11-27 13:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# Internet
comprised of a set of Interconnected [[Networks]] using [[Network_Layer|Network Layer]] from the OSI reference model.
### Components:
- end-to-end network protocol
	- ensuring a seamless service to the [[Transport_Layer|Transport Layer]]
		- Manages the delivery of data packets/provisioning of circuits
		- Provides addressing of end systems 
- Gateway Devices([[routers]])
	- implements the common protocol
	- hide complexity from the lower layers
		- handles framing, addressing, flow control, error detection and correction
		- Minimise the need for translation between different technologies

## The internet Protocol
IP provides an abstraction layer
- Transport protocols and applications above
- Assorted data link technologies and physical links below
- A simple, best effort, connectionless, packet delivery service
- Addressing, routing, fragmentation and reassembly
### Hourglass Protocol Stack
![[hourglassProtocolStack.png|500]]

### Service Model
- best effort, connectionless packet delivery 
	- no need to establish a connection, just send data
	- The network makes it best effort to deliver packets, but provides no guarantees
- characteristics of packet delivery
	- variable transit time
	- packets may run into issues
	- packets are discarded if they can't be delivered
- advantages
	- *Flexibility*: easy to run over any type of link layer
	- *Fundamental service*: core functionality is to deliver packets from a source to a destination.


### versions
there are **IPv4**(current version) and **IPv6**(next generation internet)