## What is mining?
Mining is the act of verifying transactions into blocks to add to the Vertcoin blockchain. This process is extremely resource intensive on a computer, and so the community works together in a peer-to-peer mining pool to validate these transactions. Additionally, the computers that do this hashing work for the network are eligible to claim brand new vertcoins as a reward when a new block is found on the network.

## Why do we need miners?
In other currencies, a central bank keeps record of online transactions in order to decide who owns that money. However, as a decentralized currency, Vertcoin does not have a central organization to keep record of these transactions. Mining is the act that validates these transactions, and without miners, Vertcoins would not be able to traded.

## What hardware do I need?
If you are interested in mining for Vertcoin to purpose the community, nearly any computer is strong enough and can join the network. If you are instead searching for profitable mining, a higher-end GPU is recommended, like a Pascal series or similar NVidia GPU. Currently, AMD cards struggle with stable high-speed hashing of the Lyra2REv2 algorithm, but can still contribute at lower speeds. CPU mining is too slow to be profitable. Large arrays of consumer-grade GPUs can also be used across multiple machines to achieve higher hashrates pooled into a single p2pool node and wallet. Note that ASIC miners will not work for Vertcoin, as is the intention of the currency.  

## Prerequisite Information
Vertcoin uses the Lyra2REv2 hashing algorithm for mining in order to maintain its ASIC-resistance. This opens the door to consumer-grade electronics as the primary mining force of the currency. Vertcoin uses p2pool mining pools, and runs two networks. The first network is recommend for miners generating over 100MH/s, and the second network for those under that line. Vertcoin also has its own One Click Miner to reduce the technical barrier of entry for those interested in mining.

## What software do I need?
In order to mine Vertcoin you will need a [Vertcoin Core Wallet](/Wallets/Core-Wallet/). You will also need a mining program of your choice that supports the Lyra2REv2 hashing algorithm. If you do not plan on hosting a local p2pool node, this is all you need. If you do plan on hosting a p2pool node, you can find out more about the installation from the [GitHub page](https://github.com/vertcoin/p2pool-vtc).  

## What program should I use?
While that is mostly up to preference, there are three primary programs that are used for mining. The recommended program for users new to mining and with NVidia GPUs is the official One Click Miner (OCM) developed by the Vertcoin team. The OCM is a wrapper for vertminer, and should yield similar results in hashrate. The OCM is still under development for users with AMD cards in order to optimize the hashing rates. One miner that can achieve higher hashrates is [sgminer-gm](https://github.com/genesismining/sgminer-gm), however it can also be more unstable and even lead to OS crashes in rare cases.