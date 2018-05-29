## What is P2Pool?

P2Pool is a decentralized Bitcoin mining pool that works by creating a peer-to-peer network of miner nodes.

P2Pool creates a new block chain in which the difficulty is adjusted so a new block is found every 30 seconds. The blocks that get into the P2Pool block chain (called the "share chain") are the same blocks that would get into the Bitcoin block chain, only they have a lower difficulty target. Whenever a peer announces a new share found (new block in the P2Pool block chain), it is received by the other peers, and the other peers verify that this block contains payouts for all the previous miners who found a share (and announced it) that made it into the P2Pool share chain. This continues until some peer finds a block that has a difficulty that meets the Bitcoin network's difficulty target. This peer announces this block to the Bitcoin network and miners who have submitted shares for this block are paid in the generation transaction, proportionally to how many shares they have found in the last while. `[3]`

Decentralized payout pooling solves the problem of centralized mining pools degrading the decentralization of Bitcoin and avoids the risk of hard to detect theft by pool operators. Miners are configured to connect to a P2Pool node that can be run locally, alongside the miner. P2Pool users must run a full Bitcoin node which serves the purpose of independently validating transactions and the Bitcoin blockchain.

P2Pool nodes work on a chain of shares similar to Bitcoin's blockchain. Each node works on a block that includes payouts to the previous shares' owners and the node itself, which can also result in a share if it meets P2Pool's difficulty. `[3]`

#### If you are a smaller miner with 2 graphics cards or less or are using your CPU, it is recommended to use Network 2. If you are a larger miner with multiple cards and/or a hash rate larger than 100Mh, it is recommended to use Network 1.

--------------------------------------------

## Why use P2Pool?

A special feature of p2pool is that your found shares are stored on every P2Pool node, if one node goes down you can switch to another and continue mining uninterrupted. Because of its decentralization P2Pool is highly resistant to malicious attacks that often will take other pools offline. It is recommended to configure your miner with three separate P2Pool nodes for maximum reliability.

When operating your own node P2Pool is completely trust less, when you mine on someone else’s node you are trusting them to configure it properly and not be a bad actor. Verifying the node fee is typically a good place to start, fees can be set by the node operator between 0 and 100%. You can view the fee of any public node by visiting “/fee” (example). Other factors you may want to consider include uptime, node hash rate, and latency. `[1]` 

--------------------------------------------

## How does P2Pool work?  

When using P2Pool, each miner runs a P2Pool node and these nodes form a peer-to-peer network amongst themselves similar to how bitcoin does. Participants then connect their mining software to their local P2Pool node and is given low difficulty work just as with a traditional pool. As each share is found, it is communicated to other miners on the P2Pool peer-to-peer network so that all nodes are aware of who is contributing to the collective mining effort and in what capacity. `[4]`

Each share includes the reward transaction that will be used in the event that a share ends up being a valid block. That reward transaction includes directly payments to all of the recent contributors to the p2pool network. So as blocks are found, contributors directly receive their payment just as they would have with solo mining. `[4]`

To ensure that everyone plays fair, shares are assembled into a share chain in the same way that bitcoin blocks are assembled into a block chain. Each share that someone finds builds on all of the previous shares. All miners that are following the same set of established rules end up creating shares that other miners are willing to include in the share chain. Miners that don't follow the rules end up creating shares that get excluded from the main share chain and so they don't get paid when blocks are found by the other miners. In order to make it practical for nodes to be constantly passing shares around the p2p network, the share difficulty is tuned so that shares are only found 1 every 10 seconds across the entire p2pool network. The result is higher variance than at a traditional pool, but still much less variance than with solo mining. `[4]`

--------------------------------------------

## FAQ 

### What are the requirements to run P2Pool? 

    A PC with enough memory to run Vertcoin-Qt or vertcoind
    A good Internet connection with low latency greatly helps to increase efficiency
    A miner supporting getwork or Stratum interfaces (more than 40GH/s advised) [2]

### How good are P2Pool payouts? 

Payouts should be the same as other pools with a higher variance (payouts are inconsistently smaller or larger days after days). Payouts can even be slightly higher because blocks propagation time is sometime faster on P2Pool. `[2]`

### How do P2Pool payouts work?

**P2Pool miners are paid every time a block is found by the pool for any confirmed shares they currently have in the P2Pool sharechain.**

This is known as a Pay Per Last N Shares (PPLNS) payout system, and is the mechanism P2Pool uses to both determine payouts and discourage pool hopping. In P2Pool the N in PPLNS is 8,640, each of the last 8,640 shares are paid each time a Bitcoin block is found. A share in the P2Pool sharechain can be expected to last about 3 days (8,640 shares * 30 seconds = 3 days).

Confirmed shares are valid, and paid whenever a block is found, for as long as they remain in the sharechain (about 3 days). Payouts in P2Pool are made immediately, directly from the block generation transaction. Newly generated coins require 100 confirmations before they can be spent, so P2Pool payouts cannot be spent for about 16.5 hours. 

As a miner on P2Pool you are competing with other P2Pool miners for a portion of the 8,640 active shares. The more shares (and the higher the difficulty of those shares) you have in the sharechain, the greater your reward when a block is found. `[5]`

### Can anyone mine on P2Pool?
Yes. However, unlike some centralized pools, P2Pool has a minimum hash rate threshold to expect regular payouts when blocks are found. The minimum hash rate to expect regular payouts changes based on the total speed of all the miners in the pool at any given time. A good rule of thumb to expect a payout when a block is found: If your expected time to share is over 1.5 days you are unlikely to be able to maintain a valid share in the sharechain. `[5]`

**Patience is a virtue.**

**One last important tip:** When you start mining on P2Pool, exercise patience. Until you get a confirmed share in the sharechain, and the pool subsequently finds a Bitcoin block, you will not receive a payout. As you add more shares to the sharechain your payout will increase, when a share is older then 3 days (8,640 shares) it will fall off the end of the chain and no longer be paid. P2Pool will tell you your expected time to share, but keep in mind this is an estimate and is subject to the same luck/variance that Vertcoin blocks are. `[5]`

### What are the advantages of using P2Pool? 

    Small statistical advantages increasing income
    Control over your own pool node
    No need to trust a pool operator
    Immediate payments
    Helps to protect and keep the Bitcoin network decentralized [2]

### What are the disadvantages of using P2Pool?

    Initial setup is a little more complicated
    More CPU / RAM / Internet bandwidth required
    Higher payout variance
    Small transaction fees when spending if you receive many small payouts [2]

### Why does P2Pool have so many orphaned / dead / rejected shares?

Miners' payouts are not affected so long as they have a proportional number of rejected shares to other miners. A new share is found every 30 seconds on average with P2Pool's sharechain. This means reorganizations happen more often and miners must have a good network connection in order to receive last shares within a short time. `[2]`

--------------------------------------------

### References
`[1] Start Mining on P2Pool - http://p2pool.org/learn/start.php`  
`[2] P2Pool The official homepage of the p2pool software - http://p2pool.in/#faq`  
`[3] Bitcoin Wiki P2Pool - https://en.bitcoin.it/wiki/P2Pool`  
`[4] Stackexchange What is P2pool - https://bitcoin.stackexchange.com/questions/3626/what-is-the-p2pool`  
`[5] P2Pool The official homepage of the p2pool software - learn - http://p2pool.org/learn/`
