## What is Mining?
The Vertcoin system of trust is based on global computation. Transactions are bundled into blocks, which require an enormous amount of computation to prove, but only a small amount of computation to verify as proven. The mining process serves two purposes in Vertcoin: `[1]`

1. Mining nodes validate all transactions by reference to Vertcoin’s consensus rules. Mining provides security for vertcoin transactions by rejecting invalid or malformed transactions.

2. Mining creates new vertcoin in each block, almost like a central bank printing new money. The amount of vertcoin created per block is limited and diminishes with time, following a fixed issuance schedule.

## Why do we need Miners?
New transactions flow into the network from user wallets and other applications. As these are seen by the vertcoin network nodes, they are added to a temporary pool of unverified transactions maintained by each node known as the memory pool. As miners construct new blocks, they add unverified transactions from the memory pool to the new block and then attempt to prove the validity of that new block, with the mining algorithm (Proof-of-Work). `[2]`

Mining achieves a fine balance between cost and reward. Mining uses electricity to solve a mathematical problem. A successful miner will collect a reward in the form of new vertcoin and transaction fees. The reward can only be collected if the miner has correctly validated all the transactions, to the satisfaction of the rules of consensus. This delicate balance provides security for vertcoin without a central authority. `[1]`

## What hardware do I need?
If you are interested in mining for vertcoin to purpose the community, nearly any computer is strong enough and can join the network. If you are instead searching for profitable mining, a higher-end GPU is recommended, like a Pascal series or similar NVidia GPU. Currently, AMD cards struggle with stable high-speed hashing of the Lyra2REv2 algorithm, but can still contribute at lower speeds. CPU mining is too slow to be profitable. Large arrays of consumer-grade GPUs can also be used across multiple machines to achieve higher hashrates pooled into a single p2pool node and wallet. Note that ASIC miners will not work for vertcoin, as is the intention of the currency.  

## Prerequisite Information
Vertcoin currently uses the Lyra2REv2 hashing algorithm created to maintain ASIC resistance, along with this hashing algorithm the community enforces a mutually held social contract to fork when ASICs are introduced. Vertcoin is against the monopolization of special mining hardware allowing consumer-grade electronics to act as the securing force for the blockchain. Vertcoin has developed it's One Click Miner to reduce the technical barrier of entry for mining Vertcoin in Windows enviornments. For more information (Windows and Linux) on how to mine Vertcoin please refer to the [/docs/Nvidia-Mining.md](/docs/Mining/Nvidia-Mining.md) guide. 

#### If you are a smaller miner with 2 graphics cards or less or are using your CPU, it is recommended to use Network 2. If you are a larger miner with multiple cards and/or a hash rate larger than 100Mh, it is recommended to use Network 1.

## What software do I need?
In order to mine Vertcoin you will need a [Vertcoin Core Wallet](/Wallets/Core-Wallet/). You will also need a mining program of your choice that supports the Lyra2REv2 hashing algorithm. If you do not plan on hosting a local p2pool node, this is all you need. If you do plan on hosting a p2pool node, you can find out more about the installation from the [GitHub page](https://github.com/vertcoin/p2pool-vtc).  

## What program should I use?
While that is mostly up to preference, there are three primary programs that are used for mining. The recommended program for users new to mining and with NVidia GPUs is the official One Click Miner (OCM) developed by the Vertcoin team. The OCM is a wrapper for vertminer, and should yield similar results in hashrate. The OCM is still under development for users with AMD cards in order to optimize the hashing rates. One miner that can achieve higher hashrates is [sgminer-gm](https://github.com/genesismining/sgminer-gm), however it can also be more unstable and even lead to OS crashes in rare cases.


## References
`[1] Mastering Bitcoin 2nd Edition - Bitcoin Mining - https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch02.asciidoc#bitcoin-mining`  
`[2] Mastering Bitcoin 2nd Edition - Mining Transactions in Blocks - https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch02.asciidoc#mining-transactions-in-blocks`
