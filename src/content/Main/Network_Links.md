---
date: 2024-11-26 13:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# Network Links
- The combination of signal and channel^[signals are transmitted via channels] form a *Link*.
- A link directly connects to one or more hosts 
Networks consists of multiple interconnected links(devices connecting links are *[[routers]]* or *switches*)
### Network Switching
#### Circuit Switched Network

| <br><br>a dedicated circuit setup for A and B to communicate<br><br>A and B exchange arbitrary length messages<br><br>guaranteed capacity once circuit is created.<br><br>created circuits will **Block** other circuits<br>(e.g. the C to D path) | ![[circuitSwitchedNetwork.png\|250]] |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
#### Packet Switched Network

| <br><br>messages are divided into small packets before being sent.<br><br>Allows multiple pairs paths to share the same link simultaneously.<br>connectivity is guaranteed<br>capacity varies on network usage<br>packets are small and has size limits <br>a message can be made up of many packets          | ![[packetSwitchedNetwork.png\|250]] |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
