---
date: 2024-11-30 23:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# Security Protocol
## TLS - [[Transport_Layer|Transport Layer]] Security
- standard protocol for internet security
- enables privacy and data integrity between two communicating applications.
- Based on Secure Socket Layer protocol (SSL v.3)
- complies with [[Cryptography#CIA Triad|CIA]] ![[TLSHandshake.png]]
## IPSec
A framework of open standards that incorporates [[Cryptography|cryptographic]] secure services in IP networks.
A suite of protocols used to secure IP communications by authenticating and encrypting each IP packet in a data stream.
Commonly used for creating secure VPN connections, ensuring confidentiality, integrity, and authentication of data sent over public or private networks.
### IPSec modes
- **Tunnel Mode** : between gateways, end-host to a gateway, or when gateway acts as a proxy for the hosts behind it.
- **Transport mode** : end-to-end security between hosts, e.g. between end-hosts, end-hosts and a gateway that acts as a host (vulnerable to eavesdroppers).
### Negotiation Phase
**Phase 1**
- Establishment of SAs between two entities
- Two modes: Main or Aggressive
- 4 techniques for authentication:
	- Public key signatures
	- [[Cryptography#Symmetric Cryptography|Symmetric key]]
	- [[Cryptography#Asymmetric Cryptography|Public key encryption]]
	- Revised public key encryption
- Uses ephemeral Diffie-Helman (EDH) to establish session key
- Provides perfect forward secrecy
**Phase 2**
- Establishment of SAs for ESP/AH protocols
- One mode : Quick Mode

## ISAKMP - Internet Security Association & Key Management Protocols
A protocol used for establishing, negotiating, modifying, and deleting Security Associations (SAs) in IPsec.
Provides a framework for key exchange and authentication, ensuring secure communication between devices in a network.
- enables the use of SA in IPSec
The ISAKMP protocol (RFC 2408) defines procedures for:
1. Authentication 
2. Creation/Management of SAs 
3. Key generation /key transport techniques 
4. Mitigation of threats (e.g. DoS attacks, replay attacks)
## SA - Security Association
- A set of security parameters established between two network entities to define how they will secure communications, typically used in IPSec.
- Specifies encryption, authentication algorithms, and key exchange methods to ensure secure data transmission.

## IKE - Internet Key Exchange
Protocol for establishing secure communication channels, often used in VPNs.
Uses two phases:
- Phase 1 - sets up a secure channel
- Phase 2 - negotiates encryption and authentication for data transfer.
## ESP - Encapsulating Security Payload
payload encryption ensuring *authenticity*, *integrity* and *confidentiality*.
- does *not provide* integrity and authentication for the *ENTIRE* packet.
## AH - Authentication Header
Protocol used in IPsec to provide data integrity and authentication for IP packets.
AH ensures that packets are from a legitimate source and have not been altered in transit by adding a cryptographic checksum to the packet header and payload.