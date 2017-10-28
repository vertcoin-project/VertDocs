# Open Bounties

Bounties are only paid upon completion to standards at the discretion of the 
development team. Please contact the development team on 
[Discord](https://discord.gg/SUy9Hsr) prior to starting work. If there are 
multiple bidders, it is possible to collaborate and split the bounty.

VertDocs bounties can be claimed by opening a new pull request on the 
[VertDocs Github page](https://github.com/Bryangoodson/VertDocs) with at least
one change in it, declaring the section you are working on. From that point you
will have seven days to provide a final draft for the section before the pull
request will be closed, and the section will be opened for other submissions.

### Bitcore/Insight Port

#### Value: 500 VTC
#### Description

A working port of [Bitcore](https://github.com/bitpay/bitcore) with the primary
aim of a functioning Insight API and Insight explorer, which are required for
Trezor wallet integration. We would like the entire stack ported though to give
us the option of using Copay as a web wallet in the future. We already have
working JavaScript modules for Vertcoin's proof of work algorithms and Vertcoin
is a drop-in replacement for Bitcoin in most ways, so porting to Vertcoin should
not be incredibly difficult. 

### P2Pool/Vertcoin Core Node Scanner

#### Value: 150 VTC
#### Description

The existing [P2Pool node scanner](https://github.com/vertcoin/p2pool-scanner) 
is old and buggy. It has not been actively developed for several years, uses 
most deprecated packages and is thus in need of a total overhaul. We would like
to create a new P2Pool node scanner that incorporates a Vertcoin Core node 
scanner with an all new implentation and UI design. 

#### Requirements

* Should continuously scan the Vertcoin Core and P2Pool peer-to-peer network to
provide a list of all public peers on the network. 
* Should display the geolocation of the node, its uptime over the tracking time
of the server, the node fee and the node donation. Each of these should be
sortable. There should also be a weigted metric that ranks each P2Pool node 
based on these metrics while balancing for node load.
* Should display various charts showing statistics over time such as a node 
distribution map, average uptime, average pool profitability, blocks per day,
hashrate etc
* Using the load balancing metric described previously, the scanner should
provide a load balancing proxy endpoint that users can connect to to mine to
some backend public P2Pool node.
* Instructions for using P2Pool as a miner or node host should be
provided prominently. This will essentially become a landing page for P2Pool.
* The scanner should check the github for the latest valid P2Pool versions and
only list valid versions.

### VertDocs

#### Value: Varies - detailed in each section
#### Description

In order to populate [VertDocs](https://docs.vertcoin.org) with informational 
content for users, we will be assigning various unwritten sections with bounties
for completion. The bounty available and description of the desired content will
be written under each heading with unwritten content. 
