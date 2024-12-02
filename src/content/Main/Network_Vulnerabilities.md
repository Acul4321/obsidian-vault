---
date: 2024-12-01 15:12
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# Network Vulnerabilities
![[OSIVulnerabilities.png]]
## MitM Attack - man-in-the-middle
A cyber attack where an attacker intercepts and potentially alters communications between two parties without their knowledge. Can lead to eavesdropping on sensitive information, data manipulation, and unauthorised access to confidential data.
### Types
#### ARP poisoning
Also known as ARP spoofing
A type of attack where an attacker *sends falsified [[Data_Link_Layer#Terminology|ARP]]* messages over a local network.
##### Attack Process
the attacker sends out ARP packets that associate their MAC address with their IP address of a legitimate device on the network. This misleads other devices into sending data intended for the legitimate device to the attacker’s machine instead.
##### Consequences
ARP poisoning can lead to various attacks, such as Man-in-the-Middle (MitM) attacks, where the attacker intercepts and potentially alters communications between devices. It can also enable denial of service attacks and unauthorised access to sensitive information.
#### SSL Stripping
SSL stripping is a type of man-in-the-middle (MITM) attack where an attacker downgrades a secure HTTPS connection to an unsecure HTTP connection. This allows the attacker to intercept and potentially modify the data being transmitted between a client and a server.
#### Port stealing
#### IP address spoofing
#### ICMP redirection
#### SSL hijacking
#### HTTPS Spoofing

## Buffer Overflow Attack
Memory-safe programming languages check array bounds
Unsafe languages, such as C and C++, don’t check
Buffer overflows in network code are one of the main sources of security problems
- If you write network code in C/C++, be very careful to check array bounds
- If your code can be crashed by received network traffic, it probably has an exploitable buffer overflow