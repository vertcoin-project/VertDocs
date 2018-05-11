# Getting Started With Vertcoin

## What is Vertcoin?

Vertcoin is a protocol that can be accessed using a client application that speaks the protocol. A "vertcoin wallet" is the most common user interface to the vertcoin system, just like a web browser is the most common user interface for the HTTP protocol. Vertcoin is also a decentralized digital currency that can be sent from peer-to-peer over the internet using the Vertcoin protocol to communicate value between users. 

Though similar to Litecoin and Bitcoin, Vertcoin has one major difference; pledged ASIC resistance and user governance. An enforced social contract that exists in the Vertcoin community promising to fork proof-of-work algorithms in order to resist ASIC miners from being used on the Vertcoin network allows for user governance of the Vertcoin network. Discouraging development of ASICs via this enforced social contract keeps the barrier to entry for mining accessible. While this may seem like a minor change, it has larger implications when it comes to the fair distribution, politics, and decentralization of the coin. Vertcoin stays true to the original vision of cryptocurrency: a financial system owned by its users, the people’s coin.

### Details
Vertcoin is a fork of Bitcoin that is designed to resist the monopolisation of mining power.

* 2.5 minute block targets, subsidy halves in 840k blocks (~4 years)

* ~84 million total coins

* 50 coins per block (25 after block 840,000)

* Difficulty retargeting every block to recover from large hashrate swings

* Lyra2REv2 proof of work algorithm for ASIC resistance

## Choosing a Vertcoin Wallet

To get started, the first thing you'll need to do is choose a Vertcoin Wallet. Wallets are used to store, receive and send coins to other addresses. Most importantly the wallet you choose plays the important role of storing your private key. You can think of a private key as the unique code that is cryptographically derived from your wallet and links your transaction history, granting the user in possession of the private key access to the funds that exist on chain.

Though there are many wallets to chose from, we recommend using the Vertcoin Core wallet. Vertcoin Core is the only wallet to currently support P2Pool mining. You can find a complete list of Vertcoin wallets on the [Vertcoin.org](https://vertcoin.org/download/) website.


!!!important
     Never share your private keys with anyone. Whoever owns the private key has the access to spend the funds in your wallet. Keep it safe and back it up to multiple locations.
     
## What is ASIC resistance?

ASIC resistance in a technical sense means that there will be no significant increase in hashing speed by implementing the proof-of-work algorithm in an ASIC, as compared to a CPU based proof-of-work implementation.

This is usually achieved by requiring a lot of memory, which when implementing this on an ASIC, translates to needing lots of physical area on the chip. The intensive use of memory enables for effective GPU mining while discouraging ASIC development and botnets.

ASIC miners derive their power and hashing speed from having many physically parallel and pipelined threads on one chip, each requiring a certain piece of chip real estate. If the proof-of-work algorithm requires lots of real estate to be used to account for memory requirements, there will not but much room to parallelize or pipeline the algorithm. You thereby lose the parallelizing advantage of an ASIC miner. Scrypt is a well known proof-of-work algorithm used by Litecoin that was created ASIC resistance, but in time ASIC miners were developed for the algorithm and the accessibility of mining the network by users with GPU's became out of reach. 

The decision not to fork an ASIC resistant algorithm when ASICs have been developed affects the distribution the cryptocurrency, creates a centralization in the hashing power belonging to fewer users, lowers the geographical distribution of hashrate, and concentrates block rewards to users who have permissioned access to ASIC mining hardware. Bumping GPU miners off of the network is a consequence of allowing ASIC mining, curtailing the permissionless nature of participating in the network for all users. 

Vertcoin adds user governance to the technical approach of ASIC resistence. No proof-of-work algorithm can stay ASIC resistant without a commitment to do so. A committment to ASIC resistance creates a social contract that promises to fork proof-of-work algorithms in order to resist ASIC miners from being used on the Vertcoin network, allowing for permissionless participation. Discouraging the development of ASICs is the effect of historically enforcing the social contract that exists between the users of Vertcoin, keeping the barrier to entry for mining accessible to its users. 

Vertcoin. Beat ASIC. 
