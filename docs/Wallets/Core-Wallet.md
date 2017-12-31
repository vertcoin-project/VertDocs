# Vertcoin Core Wallet

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


!!!caution "Note"
    The Vertcoin Core Wallet requires at least 2 GB of space on your computer to store the blockchain. Downloading the entire chain for the for time may take a while.

As the blockchain downloads, you'll see progress displayed as well as the latest block synced. Every time Vertcoin Core is launced, your local copy of the blockchain will need to be synced to the current block.



## Backing Up Your Wallet

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra, sapien nec feugiat ultrices, tortor tellus euismod quam, vel luctus ipsum dolor eu quam. Duis lacinia consequat sapien, rutrum dignissim neque faucibus vitae.

## Sending & Recieving Vertcoin
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra, sapien nec feugiat ultrices, tortor tellus euismod quam, vel luctus ipsum dolor eu quam. Duis lacinia consequat sapien, rutrum dignissim neque faucibus vitae.

### Addresses
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra, sapien nec feugiat ultrices, tortor tellus euismod quam, vel luctus ipsum dolor eu quam. Duis lacinia consequat sapien, rutrum dignissim neque faucibus vitae.

### Coin Controls



...


