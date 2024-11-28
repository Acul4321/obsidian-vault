---
date: 2024-11-28 12:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# Routing
Network layer responsible for routing data from source to destination across multiple hops. with the goal to find the best route to a given network
## Routing Types:
### Static Routing
involves manually configuring routing tables with fixed routes. These routes do not change unless manually updated by a network administrator.
- Predefined routes
- lacks flexibility
- requires maintenance
- lacks scalability.
### Dynamic Routing
uses protocols to automatically discover and maintain routing information. 
Routers exchange information to adjust routes based on network conditions.
- Adjusts routes based on network changes.
## Routing Methods
### Inter-domain Unicast Routing
Routing data between different autonomous systems.
- since an *AS* is *unlikely* to *trust* its neighbours, routing *must* consider policy:
	- Policy restrictions can determine your topology
	- Policy restrictions on which route data can follow
	- Prefer control over routing, even if that means data doesn’t necessarily follow the best (shortest) path
#### BGP (Border Gateway Protocol)
**External BGP** (eBGP) used to exchange routing information between ASes
- Used to derive “best” route to each destination; installed in routers to control forwarding
- exchanges knowledge of the AS graph topology, through a TCP connection between routers
- Neighbouring ASes configure an eBGP session to exchange routes
**Internal BGP** (iBGP) propagates routing information to routers within an AS
- The intra-domain routing protocol handles routing within the AS
- iBGP distributes information on how to reach external destinations

### intra-domain Unicast Routing
Routing data within a single autonomous system.
- operates a single routing protocol
- Running on IP routers within an autonomous system
## Routing Protocols
### Distance Vector Protocol
Each node maintains a distance vector(shortest known distance to every node in the network)
- vectors are periodically exchanged with neighbouring nodes, enabling each node to gradually learn the distance of all other nodes
- the routing tables across the network “converge” to a stable state, where the best paths are established
	- Links that are down or unknown are assigned a distance of ∞
	- Packets are forwarded along the route with the shortest distance to the destination
![[VectorProtocolDiagram.png]]
##### Limitations
tries to minimise state at nodes, As a consequence, is slow to converge.
**count to inf problem**
occurs when routers continuously increase the metric for a route to a destination due to a network failure. leading to a loop where the hop count incrementally rises until it reaches inf. This can result in routing loops and inefficient network routing.

**solutions** (no general solution exists)
- *Split Horizon* : Prevents a router from advertising a route back to the neighbour from which it learned the route. This helps to break the loop of incorrect information.
#### Example : RIP(Routing Information Protocol)
A type of distance vector protocol used to determine the best route for data packets in a network
- Uses hop count as a metric, with max limit of 15 hops to *prevent routing loops*.
- Periodically broadcast its entire routing table to neighbouring routers, helps all routers in the network to update and converge on the best path to each destination

### link state Routing
each router maintains a complete map of the network's topology called the *link state information*.
Each node then directly calculates shortest path to every other node *locally*, uses this as routing table.
Link state information updates are flooded on start-up, and when the topology changes, each update contains:
- The address of node that sent the update
- List of directly connected neighbours of that node
	- With cost of the link to every neighbour 
	- With the range of addresses assigned to each link
- a sequence number
packets are *forwarded* based on calculated shortest path
Recalculate shortest paths on every *routing update*
#### Example : OSPF(Open Shortest Path First)
a type of link state routing protocol used for routing IP packets within a single AS
- Calculates the shortest path to each network destination using [[Dijkstra’s_Algorithm|Dijkstra’s algorithm]]
- Quickly propagates topology changes throughout the network, ensuring efficient and reliable data routing

### Distance Vector vs Link State

| Distance Vector Routing                                                | Link State Routing                                              |
| ---------------------------------------------------------------------- | --------------------------------------------------------------- |
| Simple to implement                                                    | More complex                                                    |
| Routers only store the distance to each other node **O(n)**            | Requires each router to store complete network map **O($n^2$)** |
| Suffers from slow convergence, Therefore unsuitable for large networks | faster convergence, therefore suitable for larger networks      |

##### Terminology
Network topology^[*Network topology*: The arrangement or layout of different elements (nodes, links) in a computer network.]
Hop^[*Hop*: A step in the journey from source to destination, where data is passed from one network device (like a router) to another.]
Gateway device^[*Gateway devices*: Routers that connect different networks and direct data packets between them, determining the best path for data to reach its destination.]
DFZ (Default Free Zone)^[*DFZ (Default Free Zone)* The collection of all Internet routers that do not require a default route because they have a full view of the global Internet routing table | Routers in the DFZ can make independent routing decisions for every destination on the Internet]