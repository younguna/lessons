# Computer Networking - Lesson 2 Architecture and Principles

## 1 Lession 2 Intro
- Early internet architect set out with clear goals and allowed flexibility in ahcieving them.
## 2 A Breif History of the Internet
- ARPANET (1966-67) UCLA, SRI, UCSB, Utah (1969)
    - goal : network academic computer
- NPL net in UK became online around same time
- 1971 -> around 20 ARPANET Nodes.
    - Speed of around 50 Kbps
## 3 Problems and Growing Pains

1. Running out of addresses -> IPv4 has only 2^(32) addresses.
2. Congestion Control -> insufficient dynamic range (wireless, high-speed intercontinental paths)
3. Routing -> no security, easy to misconfigure, poor convergence, non-determinism
4. Secruity -> bad key management, secure software deployemnt
5. Denial of service -> too easy to send traffic to destination

## 4 Architectual Design Principles
- Design Philosopy of the DARPA Internet Protocols, Dave Clark 1988
- Conceptual Lessons -> principles designed for a certain type of network
- Technical Lessons -> 
    - 1 packet switching
    - 2 fate sharing or soft state

## 5 Goal
The fundamental design Goal of the Internet 
- "Multiplexed utilization of existing interconnected networks"

    - "Multiplexed" : sharing problem - Solution: statistical multiplexing / packet switching
    - "Interconnection" : Solution :narrow waist

## 6 Packet Switching
- Information for forwarding traffic contained in destination addess of packet.
    - shared resources (shared ndoes)
    - could cause delay or loss of packet
- In contrast to "circuit switching" 
    - out of band signaling sets up dedicated path
    
## 7 Quiz: Packet Switching VS Circuit Switching

- Variable Delay - Packet Switching
- Busy Signals - Circuit Switching
- Sharing of network resources - Packet Switching
- Dedicated resources between sender and receiver - Circuit Switching

## 8 Narrow Waist
### Interconnection : Narrow Waist
- Goal : Interconnect many existing networks. Hide underlying technology from applications.

|Layer numbering|Protocol| Layer|
|---|---|---|
||HTTP, SMTP,...|Application Layer| 
|Usually don't refer layers by number above this layer|TCP, UDP|Transport Layer|
|3|IP|Network Layer, **only protocol in this layer**|
|2|Ethernet|Link Layer|
|1|Sonet|Physical Layer|

- Every Internet device must speak IP.
- Link Layer provides p2p connectivity to Network Layer
- Network Layer provides end to end connectivity to Transport Layer
- Transport Layer provides reliable transport and congestion control to application layer
- Difficult to change in IP

## 9 Goal Survivability
- survivality : network works even if soem devices fail.
    - replication
    - fate sharing
        - easier to withstand complex failure
        - easier engineering

## 10 Goal Heterogeneity
- Heterogeneity
    - 1 TCP/IP
    - 2 "Best Effort"

## 11 Goals Distributed Management
- Distributed Management
    - Addressing(ARIN, RIPE, ...)
    - Naming(DNS)
    - Routing(BGP)
- Good
    - organic growth
    - stable management
- Bad
    - no owner

## 12 What's Missing (in Clark's paper)
- no discussion of security
- no discussion of availablity
- no discussion of mobility
- no discussion of scaling

## 13 Quiz: DARPA Paper Quiz
Clark's paper includes following
- No security
- YES Heterogeneity
- YES Interconnection
- YES Sharing
- NO Mobility

## 14 End to End Argument
"The function in question can completely and correctly be implemented only with the knowledge and help of the application standing **at the end points of the communication system**. Therefore, providing that questioned function as a feature of the communication system itself **is not possible**. (Sometimes an incomplete version of the function provided by the communication system may be useful as a performance enhancement.)"
### examples
1. Error handling in file transfer
2. End-to-end encryption
3. TCP/IP Split error handling
> "Dumb network, intelligent endpoints"

## 15 File Transfer (example from above)
1. read file from disk
2. communication system sends file
3. transmits pakcets
4. give file to file transfer program
5. write to disk

### What can go wrong?
1. read/write
2. breaking up / assembling
3. communication system

> we can handle error each problems above but it still needs application level checking.

> End to end checking and resending could have better performance

## 16 End to End Argument Violation

- Still an argument
- Violations:
    - NAT
    - VPN tunnels
    - TCP splitting
    - Spam
    - P2P systems
    - Caches
- Question?:
    - what's in/out?
        - Routing
        - Multicast
        - QoS
        - NAT

## 17-18 Violation NAT
- NAT(Network Address Translation) ususally that is used in home network blocks endpoints behind it from globally addressing or routing.
