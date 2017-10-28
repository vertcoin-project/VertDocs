# Vertcoin Core Wallet

## Installation 



### Windows

To install the Vertcoin Core wallet in Windows, navigate to the Vertcoin Core repository [Releases Page](https://github.com/vertcoin/vertcoin/releases) on GitHub and download the Windows binary file for the latest release. Both 64bit and 32 bit version are available.




Inside the zipped download you will find four applications; vertcoin-qt, 
vertcoind, vertcoin-cli and vertcoin-tx.


| Application  | Description                                                      |
|--------------|------------------------------------------------------------------|
| vertcoin-qt  | Core wallet with a GUI interface.                                |
| vertcoind    | Headless daemon core wallet.                                     |
| vertcoin-cli | Command line interface for interacting with vertcoind.           |
| vertcoin-tx  | Command line interface to  create, parse, or modify transactions |



### Linux

#### Ubuntu

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

Then launch Vertcoin via the app icon installed the launcher.

#### Other Linux

Navigate to the Vertcoin Core repository 
[Releases Page](https://github.com/vertcoin/vertcoin/releases) on GitHub and 
download the Linux binary file for the latest release. Both 64bit and 32 bit 
version are available.

###MacOSX

To install the Vertcoin Core wallet for MacOSX, navigate to the Vertcoin Core repository [Releases Page](https://github.com/vertcoin/vertcoin/releases) on GitHub and download the MacOSX binary file for the latest release. Both 64bit and 32 bit version are available.

##  Running Vertcoin Core
 
The first time you run Vertcoin Core, it wil ask where you would like to store its data. You may chose to store data in the default directory or you may chose your own. After selecting a directory and clicking next, Vertcoin Core will attempt to connect to other Vertcoin Core nodes and download a complete copy of the blockchain.


!!!caution "Note"
    The Vertcoin Core Wallet requires at least 2 GB of space on your computer to store the blockchain. Downloading the entire chain for the for time may take a while.
    
As the blockchain downloads, you'll see progress displayed as well as the latest block synced. Every time Vertcoin Core is launced, your local copy of the blockchain will need to be synced to the current block. 

Alternitavely you can run Vertoin Core as a daemon, (vertcoind). This will allow you to run a vertcoin node without the GUI interface.

## Backing Up Your Wallet

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra, sapien nec feugiat ultrices, tortor tellus euismod quam, vel luctus ipsum dolor eu quam. Duis lacinia consequat sapien, rutrum dignissim neque faucibus vitae. 

## Sending & Recieving Vertcoin
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra, sapien nec feugiat ultrices, tortor tellus euismod quam, vel luctus ipsum dolor eu quam. Duis lacinia consequat sapien, rutrum dignissim neque faucibus vitae. 

### Addresses
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra, sapien nec feugiat ultrices, tortor tellus euismod quam, vel luctus ipsum dolor eu quam. Duis lacinia consequat sapien, rutrum dignissim neque faucibus vitae. 

### Coin Controls


...

