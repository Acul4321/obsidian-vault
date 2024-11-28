---
date: 2024-11-27 13:11
tags:
  - Networks
  - computing
  - OSImodel
category: "[[Networks]]"
---
# Network Layer
First end-to-end^[End-to-end: the process of sending data from the originating source to the final destination] layer in the OSI reference model, responsible for *delivery of data*.

The [[Internet]] uses the Network layer

## Addressing
every network interface on every host is intended to have a unique address
 - hosts may change over time
 - addressable $\neq$ reachable : firewalls
## Fragmentation
MTU(Maximum transmission unit)
- Each link layer technology has a maximum packet size Example: Ethernet’s default MTU is 1500 bytes
**IPv4 Fragmentation**
- If a packet exceeds the MTU, IPv4 routers will fragment it (break it down into smaller packets that are suitable for transmission)
- MF Bit (More Fragments)
	- Set if more fragments follow
	- Use the fragment offset and fragment identifier to reconstruct the original packet
	![[MFBitDiagram.png|500]]
- DF Bit (Don’t Fragment)
	- Set if routers should not fragment the packet
	- If a packet exceeds the MTU and the DF bit is set, the router must discard it
**IPv6 Fragmentation**
- **does not support fragmentation**
- Fragmentation is hard to implement on high speed link
- Following the end-to-end principle, the responsibility is shifted to sending and receiving hosts
## Loop Protection
to limit to the number of routers a packet can pass through before it is discarded.
	*Why* - Stops packets circling forever if a network problem causes a loop
Packets include a forwarding limit:
- Set to a non-zero value when the packet is sent (typically 64 or 128)
- Each router that forwards the packet reduces this value by 1
- If zero is reached, packet is discarded
## Header
An IP header is a *segment of data* at the beginning of an IP packet.
- contains important information required for routing and delivery of the packet across the network
- includes several fields that describe the packet’s source, destination and other essential details.
### checksum
IPv4 header contains a *checksum* to **detect transmission errors**
- Protects the IP header only, not the payload data protected
### Transport layer protocol identifier
- Network layer packets include the data from the transport layer as payload
- Must identify what transport layer protocol is used, to pass the data to the correct upper-layer protocol: (managed by IANA^[IANA (Internet Assigned Numbers Authority)])
	- TCP = Protocol Number 6
	- UDP = 17
	- DCCP = 33
	- ICMP = 1

## IP Addresses
a unique identifier assigned to each device connected to a computer network that uses the Internet Protocol for communication.
Addresses can denote host identity
- Addresses can denote host identity
- address can indicate the location at which a host attaches to the network

#### characteristics:
- They specify location of a network interface
- They are allocated hierarchically
Domain names are a separate [[Application_Layer|Application Layer]] namespace.
#### Structure
Addresses are split into two parts:
- **Network**
	- *Netmask* - describes the number of bits in the *network* part
- **Host**
	- *network* - itself has the address with the *host part* equal to *Zero*
	- *broadcast* address - for a network has all bits of *host part* equal to *One* 
A host with several network interfaces will have one IP addresses per interface

**IP Address Management** is managed by IANA^[IANA (Internet Assigned Numbers Authority)] who administers the pool of unallocated addresses and has **all** available addresses to RIR's for IPv4. 
#### Classification
- Traditional Allocation(classful Addressing)
	- Class A
		- /8 network
		- ~16 million addresses
	- Class B
		- /16 network
		- 65,356 addresses
	- Class C
		- /24 network
		- 26 addresses
- Modern Allocation(classless Addressing)
	- Arbitrary Length Netmask: Allowed since 1993