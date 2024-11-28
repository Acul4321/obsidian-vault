---
date: 2024-11-28 14:11
tags:
  - Networks
  - computing
  - OSImodel
category: "[[Networks]]"
---
# Transport Layer
Serves as an intermediary between the upper layers and the [[Network_Layer|Network Layer]], abstracting and simplify the underlying network complexity.
- Enhance the Quality of Service (QoS) provided by the network layer
- Present a clear and comprehensive service model
Operates *process-to-process*, not host-to-host
## Functions
### Addressing & Multiplexing
- [[Network_Layer|Network Layer]] Address (**IP Address**)
	- Uniquely identifies a host within a network
- [[Transport_Layer|Transport Layer]] Address (**Port Number**)
	- Identifies a specific user process or service running on a host
	- Ensures that data reaching a device is directed to the correct application or service
- Multiplexing
	- Enables multiple services to run simultaneously on a single host without confusion
	- Combines data from multiple applications, each with its own port number into a single data stream
- Demultiplexing:
	- Separates incoming data based on port numbers allows for efficient and organised network communication
Separation of addressing and multiplexing allows for efficient and organised network communication, enables multiple services to operate simultaneously on a single device
### Reliability
- Network Layer Limitations
	- Even networks with nominally reliable connections can experience failure or disruptions
- Transport Layer Role
	- Adds necessary reliability measures to ensure data is delivered as required
- End-to-end reliability
	- The transport layer provides tailored reliability based on the applications needs
### Framing
- Structured Data Handling
	- Applications often need to send data that is structured or organised in specific formats
- Maintaining Data Boundaries
	- The transport layer is responsible for preserving the integrity of these data structures during transmission
	- structured form → so the receiving application can correctly interpret it
- part of the Service Model
	- If the service model requires it, the transport layer will frame the original data
### Congestion Control
Adapting speed of transmission to match available end-to-end network capacity, Prevents congestion collapse of a network
- Application Sending Rate Management
	- transport layer manages the rate at which applications send data to ensure smooth transmission
- Congestion Control
	- adjusts the sending rate to align with the network layer’s ability to deliver data efficiently, preventing network congestion
- Flow Control
	- matches the sending rate with the receiver’s ability to process incoming data, avoid overwhelming the receiver
- End-to-end management
	- controls must be performed end-to-end because only the communicating endpoints have full visibility of the entire transmission path

The transport layer uses one of the defining principles of the internet called the [[Internet#End-to-end Principle|End-to-end Principle]].
## Transport Protocols
The Internet Protocol provides a common base for various transports
### [[UDP|UDP (User Datagram Protocol)]]
### [[TCP|TCP (Transmission Control Protocol)]]

### UDP vs TCP
![[UDPvsTCPTable.png]]

| **UDP Applications**                                          | **TCP Applications**                                                                                |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Useful for applications that prefer timeliness to reliability | Useful for applications that require reliable data delivery, and can tolerate some timing variation |
| Must be able to tolerate some loss of data(Streaming video)   | Default choice for most applications(Email)                                                         |
| Must be able to adapt to congestion in the application layer  |                                                                                                     |

### [[DCCP|DCCP (Datagram Congestion Control Protocol)]]
### [[SCTP|SCTP (Stream Control Transmission Protocol)]]
### [[QUIC]]

## Deployment Considerations
firewalls perform “deep packet inspection” and look beyond the IP header to make policy decisions
- The only secure policy is to disallow anything not understood
- Implication: very difficult to deploy new transport protocols (eg. DCCP and SCTP)
- Implication: limits future evolution of the network
If protocols can be cannot be deployed natively, they can be tunneled
- WebRTC data channel → SCTP over DLTS over UDP
	- Peer-to-peer data for web applications
- QUIC → multiplexed stream transport protocol running over UDP
- UDP passes through NATs and firewalls, that native transport protocols do not
	- So tunnel new transport inside UDP packets
##### Terminology
QoS (Quality of Service)^[*QoS (Quality of Service)* | Ensures network performance meets application needs, like low latency or high bandwidth | Tailors service quality to application demands, balancing speed, reliability and order]
API (Application Programming Interface)^[*API (Application Programming Interface)* Defines how software components interact, allowing applications to use network services easily | Provides a standardised interface, like the Berkeley sockets API, for accessing transport and network layers]
AIMD (Additive Increase Multiplicative Decrease)^[AIMD (Additive Increase Multiplicative Decrease) A congestion control algorithm used in TCP | Increases the transmission rate gradually (additive increase) until congestion is detected | Reduces the transmission rate sharply (multiplicative decrease) upon detecting packet loss or congestion]