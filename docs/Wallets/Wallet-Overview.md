# Wallet Overview

A Wallet is an address or a collections of addresses and corresponding private keys that allow you to recieve, store, and send Vertcoin. There are many types of wallets, each with different purposes and limitations.

| Wallet | Description |
|---|---|
| [Core Wallet](./Core-Wallet/) | A reference implementation of the vertcoin protocol that includes a wallet. Downloads the entire blockchain, recommended for miners. Known as a full client, or full node. `[1]`
| [Electrum Wallet](./Electrum/) | A lightweight client, also known as a simple-payment-verification (SPV) client, connects to vertcoin full nodes for access to the vertcoin transaction information, but stores the user wallet locally and independently creates, validates, and transmits transactions. Does not require downloading the blockchain. `[1]`
| [Vertwallet](./Vertwallet/) | A mobile wallet is one of the most common types of wallet. Running on smart-phone operating systems such as [Apple iOS](https://itunes.apple.com/us/app/coinomi-wallet/id1333588809?mt=8) and [Android](https://play.google.com/store/apps/details?id=com.coinomi.wallet), these wallets are often a great choice for new users.
| [Paper Wallets](./Paper-Wallets/) | The keys controlling vertcoin can also be printed for long-term storage. These are known as paper wallets even though other materials (wood, metal, etc.) can be used. Paper wallets offer a low-tech but highly secure means of storing vertcoin long term. Offline storage is also often referred to as cold storage. `[1]`
| [Hardware Wallets](./Hardware-Wallets/) | Hardware wallets are devices that operate a secure self-contained bitcoin wallet on special-purpose hardware. They are operated via USB with a desktop web browser or via near-field-communication (NFC) on a mobile device. By handling all vertcoin-related operations on the specialized hardware, these wallets are considered very secure and suitable for storing large amounts of vertcoin, bitcoin, litecoin, etc. `[1]`

---------------------------------------------

### What is a wallet?
 
Similar to a traditional wallet you may carry in your pocket, a vertcoin wallet is used to store money. The difference is that instead of storing a collection of bills and cards, a vertcoin wallet stores a collection of vertcoin private keys. Typically a wallet is encrypted with a password or otherwise protected from unauthorized access.

Unlike the Vertcoin network, a Vertcoin wallet is controlled only by its owner. It's important to keep your vertcoin wallet safe by either setting a strong password or otherwise keeping it out of reach of malicious individuals.
 
### Types of Wallets

There are different wallets to choose from, each providing different features. All vertcoin wallets must conform to the established Vertcoin protocol so they can all be used to send and receive funds regardless of their specific implementation. This is similar to email where you have many choices of email providers but they all "speak the same language" and are able to send messages to each other.

There are several categories of Vertcoin wallets:
 
#### Desktop Wallets 

You can install the wallet software directly on your computer. This allows an individual to have full control (and responsibility) over their wallet.

[Vertcoin Core](https://vertcoin.org/download/) was the first type of vertcoin wallet created as a reference implementation and many users run desktop wallets for the features, autonomy, and control they offer. Running on general-use operating systems such as Windows and Mac OS has certain security disadvantages however, as these platforms are often insecure and poorly configured. `[1]`

The private keys are stored on the hard drive. If the wallet file were to become corrupted with no backup available, the vertcoins stored in that wallet would be lost forever. For this reason it's extremely important that strong passwords are used and reliable backups are made of any desktop wallet. It's equally important that the wallet and backups are kept safely out of reach of malicious individuals.

Desktop wallets fall into two main categories known as "full nodes" or "light" clients. Full nodes host a full copy of the blockchain (about 4 GB as of May 2018) while light clients only provide the ability to transact with vertcoin while depending on an external source to read the blockchain. More examples of wallets can be found [here](https://vertcoin.org/download/).
 
#### Mobile Wallets 

Mobile wallets are simply vertcoin wallets designed for a mobile device. This means they can easily scan QR codes, are easy to navigate with a touch screen, and are accessible while on the move. The Coinomi mobile wallet for [iOS](https://itunes.apple.com/us/app/coinomi-wallet/id1333588809) and [Android](https://play.google.com/store/apps/details?id=com.coinomi.wallet) allows you access to send and receive Vertcoin.

Mobile wallets are almost always "light" clients in that they do not store a full copy of the blockchain.
 
#### Hardware Wallet 

A hardware wallet is a specialized type of device designed specifically to store cryptocurrency. The advantage is that hardware wallets are much more difficult for a malicious user to compromise when compared to a desktop or mobile wallet since they use the bare minimum amount of software required to safely store vertcoins. 
 
#### Paper Wallets 

Paper wallets are a way to embody vertcoins in a physical medium such as paper or metal. If a paper wallet is lost or destroyed, the vertcoin stored on it are gone forever.

### References 
`[1] Mastering Bitcoin 2nd Edition - Choosing a Bitcoin Wallet - https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch01.asciidoc#choosing-a-bitcoin-wallet`
