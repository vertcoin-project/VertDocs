# Vertcoin Core Wallet
![CoreWallet](https://i.imgur.com/gl5am5j.png)
## Installation

### Github Download

To install the Vertcoin Core wallet, navigate to the Vertcoin Core repository [Releases Page](https://github.com/vertcoin/vertcoin/releases) on GitHub and download the binary file for the latest release. Windows, Linux and OSX versions are availiable.

Inside the zipped download you will find four applications; vertcoin-qt, 
vertcoind, vertcoin-cli and vertcoin-tx.

| Application  | Description                                                      |
|--------------|------------------------------------------------------------------|
| vertcoin-qt  | Core wallet with a GUI interface.                                |
| vertcoind    | Headless daemon core wallet.                                     |
| vertcoin-cli | Command line interface for interacting with vertcoind.           |
| vertcoin-tx  | Command line interface to  create, parse, or modify transactions |

To start the Vertcoin Core Wallet, launch the vertcoin-qt file. This will start the wallet with GUI interface. You could optionally launch the wallet as a deamon to run in the backgeound with vertcoind.

### Linux Ubuntu PPA Download
You can install vertcoind (headless daemon) or the GUI wallet vertcoin-qt via
the Vertcoin ppa.

``` shell
$ sudo add-apt-repository ppa:vertcoin/ppa
$ sudo apt-get update
```

##### vertcoind
Then to install vertcoind run:
``` shell
$ sudo apt-get install vertcoind
```

Launch vertcoind from the command line with:
``` shell
$ vertcoind -daemon
```

And interact with vertcoind via:
``` shell
$ vertcoin-cli help
```

##### vertcoin-qt
To install the GUI wallet:
``` shell
$ sudo apt-get install vertcoin-qt
```

You then can launch Vertcoin via the app icon installed  in the launcher.

##  Running Vertcoin Core
The first time you run Vertcoin Core, it wil ask where you would like to store its data. You may chose to store data in the default directory or you may chose your own. After selecting a directory and clicking next, Vertcoin Core will attempt to connect to other Vertcoin Core nodes and download a complete copy of the blockchain.

![FirstRun](https://i.imgur.com/C0HQXyI.png)

!!!caution "Note"
    The Vertcoin Core Wallet requires at least 4 GB of space on your computer to store the blockchain. Downloading the entire chain for the for time may take a while.

As the blockchain downloads, you'll see progress displayed as well as the latest block synced. Every time Vertcoin Core is launced, your local copy of the blockchain will need to be synced to the current block.

## Backing Up Your Wallet
It is important to understand that vertcoin wallets contain only keys. The "coins" are recorded in the blockchain on the vertcoin network. Users control the coins on the network by signing transactions with the keys in their wallets. In a sense, a vertcoin wallet is a keychain.`[1]`

Vertcoin Core creates a nondeterministic wallet,where each key is independently generated from a random number. The keys are not related to each other. This type of wallet is also known as a JBOK wallet from the phrase "Just a Bunch Of Keys."`[1]`

It is crucial that you back up your `wallet.dat` file found in your Vertcoin data directory. 

## Sending & Recieving Vertcoin
Once your Vertcoin Core client has finished syncing to the blockchain you are ready to send and recieve Vertcoin. 

![RequestPay](https://i.imgur.com/jRdy3eQ.png)  
**To recieve Vertcoin press the `Receive` button**  
* Fill out `optional` fields 
* Click `Request payment`  

------------------------------------------------

![SendVTC](https://i.imgur.com/lRAIxl2.png)  
**To send Vertcoin press the `Send` button**
* Enter `recieve` address you want you want to pay Vertcoin
* Enter the amount of VTC to send
* Attach an `optional` label  

![Confirm](https://i.imgur.com/0WF7QFs.png)

### Addresses
In the payment portion of a vertcoin transaction, the recipient’s public key is represented by its digital fingerprint, called a vertcoin address, which is used in the same way as the beneficiary name on a check (i.e., "Pay to the order of"). In most cases, a vertcoin address is generated from and corresponds to a public key.`[1]` 

In vertcoin, we use public key cryptography to create a key pair that controls access to vertcoin. The key pair consists of a private key and—​derived from it—​a unique public key. The public key is used to receive funds, and the private key is used to sign transactions to spend the funds.`[2]`

### Coin Controls
When you send vertcoin to someone else, the vertcoin client chooses automatically picks which addresses you own that hold VTC balance will send coins. Coin control allows control over what coins you send, and which of your addresses sends VTC. More specifically, which of your unspent outputs will be the sending inputs.`[3]`

## References
`[1] Mastering Bitcoin 2nd Edition - Keys, Addresses - https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch04.asciidoc#keys-addresses`  
`[2] Mastering Bitcoin 2nd Edition - Public Key Cryptography and Cryptocurrency - https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch04.asciidoc#public-key-cryptography-and-cryptocurrency`  
`[3] Yet another Coin Control Release - https://bitcointalk.org/index.php?topic=144331.0` 

