# Getting Started with Full Nodes

![NodeMap](https://i.imgur.com/rzj5SU2.png)
[Vertcoin Node Scanner](https://scanner.vertcoin.org/nodes) 

### What is a Full Node?

Vertcoin’s peer-to-peer network is composed of network "nodes," run mostly by volunteers. Those running vertcoin nodes have a direct and authoritative view of the vertcoin blockchain, with a local copy of all the transactions, independently validated by their own system and can initiate transactions directly on the vertcoin network. By running a node, you don’t have to rely on any third party to validate a transaction. Moreover, by running a vertcoin node you contribute to the vertcoin network by making it more robust. A full-node client consumes substantial computer resources (e.g., more than 4 GB of disk, ~1 GB of RAM) but offers complete autonomy and independent transaction verification. `[1]`

Running a node, however, requires a permanently connected system with enough resources to process all vertcoin transactions. Vertcoin nodes also transmit and receive vertcoin transactions and blocks, consuming internet bandwidth. If your internet connection is limited, has a low data cap, or is metered (charged by the gigabit), you should probably not run a vertcoin node on it, or run it in a way that limits its bandwidth usage. `[1]`

Despite these resource requirements, hundreds of volunteers run vertcoin nodes. Some are running on systems as simple as a [Raspberry Pi](/FullNodes/raspberry-pi/) (a $35 USD computer the size of a pack of cards). Many volunteers also run vertcoin nodes on rented servers, usually some variant of Linux. A Virtual Private Server (VPS) or Cloud Computing Server instance can be used to run a vertcoin node. Such servers can be rented for $25 to $50 USD per month from a variety of providers. `[1]`

### Why run a node?

Here are some of the most common reasons to run a node: `[1]`

1. You are developing vertcoin software and need to rely on a vertcoin node for programmable (API) access to the network and blockchain.
2. You are building or using applications such as mining that must validate transactions according to vertcoin’s consensus rules.
3. You want to support vertcoin. Running a node makes the network more robust and able to serve more wallets, more users, and more transactions.
4. If you do not want to rely on any third party to process or validate your transactions.

### References 
`[1] Mastering Bitcoin 2nd Edition - Running a Bitcoin Core Node - https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch03.asciidoc#running-a-bitcoin-core-node`
