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

## End-to-end Principle
 application-specific functions should be carried out at the endpoints of a communication path. This means that the network itself should be kept simple and only provide basic data transmission capabilities, while more complex tasks such as error checking, data integrity, and security should be handled by the end systems.
- **Efficiency:** Only essential functions should be placed within the network. All other functionalities should be handled by the end systems. Also ensures the application has full visibility and control over these functions.
- **Flexibility:** Endpoints can implement specific functions tailored to their needs without requiring changes to the network infrastructure.
- **Reliability:** End-to-end error checking and correction ensure that data integrity is maintained regardless of the network's state, as endpoints can detect and correct errors. Reliability should be implemented in the transport layer, not the network layer. This way, even if the network cannot guarantee 100% reliability, the application can perform its own checks and ensure data integrity.
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

| IPv4                                                  | IPv6                                                                                     |
| ----------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| address are 32 bits<br>Example: 130.209.241.197       | address are 128 bits<br>Example: 2001:4860:4860::8844                                    |
| contains header checksum                              | does not contain header checksum(Assumes the data is protected by a link layer checksum) |
| reaching the end of its life - insufficient addresses | will be a long term replacement of IPv4                                                  |
| $2^{32} = 4,294,967,296$ addresses                    | $2^{128} = 340,282,366,920,938,463,463,374$ addresses                                    |
