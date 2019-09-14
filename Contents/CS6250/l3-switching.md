# Computer Networking - Lesson 3 Switching

## 1 Lesson 3 Intro

- At its core, a network serves to route packets between machines on the network in complicated but quire fascinating way.

- Packets  likely traveled across at least four or five networks, if not more.

## 2 Switching and Bridging
- Problems
    - How hosts find each other on a subnet
    - How subnets are interconnected
- Also
    - switches vs hubs
    - swithces vs routers
- How to scale Ethernet

## 3 Bootstrapping: Network Two Hosts
Case:
- Host 1 and Host 2 are interconnected by two ethernet adapters or network interfaces.
- Each has LAN/MAC/Physical Address
- Host 1 wants to send datagram to host 2.
- This can be done by sending frame to a broadcast destination MAC address - which means that the datagram would be send to every host in LAN.
- Typically a host knows a DNS name or an IP address but may not know the hardware or MAC address of an another host.
- We need to provide a way for a host to learn the MAC address of another -> **ARP (Address Resolution Protocol)**

## 4 ARP: Address Resolution Protocol
- Host queries with an IP address: "who has IP address 130.207.23.48"?
- The host who has that IP address will respond its MAC address.

> ARP Query is a broadcast that goes to every host on the LAN, and response is a unicast response with the MAC address as the answer.

- The host receives a reply starts to build ARP table. ARP table includes map of IP address and MAC address.
- The host that sends the packet prepares a packet that contains destination ip address, and encapsulate that packet by Ethernet frame that contains destination MAC address. that MAC address comes from its local ARP table.

## 5 Quiz: ARP Quiz

- Query : Broadcast asking about IP
- Response : Unitcast with MAC address

## 6 Interconnecting LANs with Hubs

- The simplest way that a LAN can be connected is with something called hub.
- These days, hubs don't exist because you can build a switch for essentially the same price

- Hub: Broadcast medium
    - a host sends a frame that's destined for some other host on the LAN, then a hub will simply boradcast the frame to every outgoing port.
    - All packets are seen everywhere.
    - A lot of flooding
    - collision of frames -> latency
    - failures / misconfiguration
        - one misconfigured host can cause a lot of unwanted traffic
        - may need some amount of isolation

## 7 Switchies: Traffic Isolation
- switch provides some amount of isolation.

- Imagine each of three hubs has three hosts and all of the hubs are connected to a switch.
- If one host wants to send a frame to another host in same hub, then the hub broadcasts the frame but **the switch knows that destination host is within the hub, so does not send the frame* to other hubs.
- To allow above, **switch requires switch table** -> maps destination MAC to output port

## 8 Learning Switches

- learning switches maintains a table of destination and port.
1. A sends to C.
2. If no entry in forwarding table => flood
3. Now switch knows that sender A has port 1, so records it to the table.
4. After flood, when C replies, the switch records C's port number.

### when there is cycle in topology
- causes loops
- causes Broadcast storms
> Therefore, switch needs some kinds of protocol to create a logical forwarding tree on top of the underlying physical topology

## 9 Quiz: Learning Switches Quiz

When switch table is empty and one host wants to send a frame, a switch records that requester and requester's port in the table for future forwarding.

## 10 Spanning Tree

- Allow loop-free forwarding on a topology that may contain cycles.
- Switches pickout spanning tree edges from topology that will assures loop-free forwarding. Switches wont' forward to edges that are not member of spanning tree.
### Construct Spanning Tree
1. Elect a root(e.g. switch with smallest ID)
2. At each switch: exclude link if not on shortest path to root.

> Initially: every node thinks it is the root. 
> 1. update view of root
> 2. compute distance to new root

## 11 Spanning Tree Example

Format : (Y, d, X)
- X : orogin
- d : distance
- Y : claimed root

Initially : every switch in the network broadcast a message "(X, 0, X)" to indicate  it thinks itself is the root.
- When other switches hear this message, they compare the ID of the sender to their own ID, and they update their opinion of who the root is based on the comparison of this ID.

## 12 Switches VS Routers
- switch (Layer 2 / "ethernet")
    - Auto-configuring
    - forwarding tends to be fast
- Router (Layer 3 / IP)
    - Not restricted to spanning tree

> Major limitation of Layer 2 is broadcast and ARP queries are pretty heavy load on the network.

> SDN(Software Defined Network) blurs the boundary between layer 2 and 3 which will be covered in the future.

## 13 Buffer Sizing

- Question : How much buffering do routers/switches need?

- Let's say round-trip propagation delay is 2T and the capacity to bottleneck link is C.
    - Rule of Thumb
    - Buffer = 2T * C

- However a router in a typical backbone network has more than 20,000 flows. 
- And it turns out that this rule of thumb only really holds if all of the those 20,000 flows are perfectly synchronized. 
- If the flows are desynchronized, then it turns out that this router can get away, with much less buffering.
- instead of the required buffering, needing to be `2T * C`, we can get away with much less buffering, in particular, `2T * C / (N)^(1/2)`, where N is the number of flows, passing through the router.


---

## 14 Buffer Sizing for a TCP Sender

- If TCP flows are synchronized, the dynamics of the aggregate window as shown in the upper part of the graph, would have the same dynamics as any individual flow.
- The quantities on the Y axis here would simply be different. 
- Specifically, the number of pockets occupying the buffer would be the sum of all of the TCP flows windows, rather than the window of any individual flow.
- Now if there are only a small number of flows in the network then these flows may tend to stay synchronized, and the aggregate dynamics might mimic the dynamics of any single flow, as shown. 
- But as the network supports an increasingly large number of flows, these individual TCP flows become de-synchronized. 
- So instead of all of the flows lining up with the saw tooth as shown in the bottom part, individual flows might see peaks at different times. 
- As a result, instead of seeing a huge saw tooth that's the sum of a bunch of synchronized flows, the aggregate instead might look quite a bit more smooth, as a result of the individual flows being desynchronized. 
- And we can represent this sum, which is the buffer occupancy, as a random variable. 
- At any given time, it's going to take a particular range of values. 
- The range of values that this buffer occupancy takes can actually be analyzed in terms of the central limit theorem.

## 15 If TCP Flows are Synchronized

- The central limit theorem tells us that the more variables that we have, and, in this case the number of variables are the number of unique congestion windows of flows that we have, the narrower the Gaussian will be. 
- In this case, the Gaussian is the fluctuation of the sum of all of the congestion windows. 
- In fact, the width decreases as 1 over root N, where N is the number of unique, congestion windows of flows that we have. 
- And therefore, instead of the required buffering, needing to be 2T times C, we can get away with much less buffering, in particular, 2T times C divided by the square root of N, where N, is the number of flows, passing through the router.