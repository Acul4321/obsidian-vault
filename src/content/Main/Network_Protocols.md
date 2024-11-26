---
date: 2024-11-26 14:11
tags:
  - Networks
  - computing
category: "[[]]"
---
# Network Protocols
a protocol will comprise different types of messages, known as **protocol data units(PDUs)**^[A unit of data specified in a protocol of a given layer in the OSI model.]
Each PDU will have a particular syntax
	formatted as *textual* information or as *binary* data:
	- *Textual* PDUs have a syntax and grammar that describes their format(Examples: HTTP/1.1, SMTP, SIP, Jabber)
	- *Binary* PDUs similarly have rules describing their format(Examples: TCP/IP, RTP)

*PDUs* define what messages are legal to send.
##### protocol Semantics
- who can send PDUs,  and when they can be sent
- roles for the host(e.g. client & server, peer-to-peer)
- What are the entities that communicate and how they are named
- error handling
##### States
shown using a **state-transition diagram**
	- states indicate stages of protocol operation
	- Transitions occur in response to PDUs, and may result in other PDUs being sent