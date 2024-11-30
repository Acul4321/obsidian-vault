---
date: 2024-11-28 16:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# Network address translation
Network Address Translation (NAT) is a technique used in networking to modify network address information in the IP header of packets while they are in transit across a traffic routing device.
## Purpose
### IP address conversion
NAT allows multiple devices on a local network to share a single public IP address for accessing external networks, such as the internet.
### Security
masking internal IP addresses, NAT provides a layer of security, making it more difficult for external entities to directly access devices within a private network. Most NATs also include a firewall to provide security, but NAT function gives no security or privacy benefits on its own

## Benefits
- Reduces the need for a large number of public IP addresses.
- Enhances network security by hiding internal IP addresses.
- Allows for flexible IP address management within a private network.
## Limitations
- **Complexity in Protocols:** Some protocols that require end-to-end connectivity may face issues with NAT.
- **Performance Overhead:** NAT introduces additional processing overhead, which can affect network performance.
- **Limited Address Transparency:** NAT can obscure the true source or destination of traffic, complicating network troubleshooting and logging

## NAT Traversal
![[NATTraversalDiagram.png]]
A *referral server* is used to help a device behind a NAT discover its external (mapped) address and port on the public network. This allows devices behind NATs to communicate with external peers.
**STUN** (Session Traversal Utilities for NAT) is a protocol that helps a device discover its public IP address and the type of NAT it’s behind.
**ICE** (Interactive Connectivity Establishment) is a framework used in real-time communication (like VoIP or WebRTC) to find the best path to connect peers across NATs and firewalls.

NAT traversal techniques such as STUN and ICE are crucial for enabling direct communication between devices that are behind NATs, which is common in most home and office networks.