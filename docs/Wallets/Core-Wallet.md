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
To ensure that you protect yourself against the loss of data on your computer, there is a single very important file that you will need to ensure survives above all else: wallet.dat. 

!!!caution "Note"

Restoring your Vertcoin Core Wallet requires the core wallet.dat file. There are no seed words.


### From the GUI
The simplest and likely preferred method to back up your wallet file, is using the Vertcoin Core GUI. 
	
Simply select File -> Backup Wallet
You will then be asked to the location you would like to save your wallet information. 

!!!caution "Note"
    Please ensure that you are not too liberal with the storage of your wallet. Like keys to your home, it's good to have a backup in the event of loss, but you don't want them in the wrong hands! 


### From the (linux) commandline
Your wallet is likely to have been stored in respect to your username when you first installed the vertcoin application. 

| Operating System  | Typical location                                            |
|-------------------|-------------------------------------------------------------|
| Linux             | ~/.vertcoin/wallet.dat                                      |

This can safely be copied to an alternate location of your choosing as a backup method. 

### I'm paraniod! What more can I do to secure my wallet?
Great news! You should be paranoid if storing in easily accessible places. If your laptop gets stolen, if your backup drive goes missing at work, or whatever the case may be. 

Storing your wallet within an encrypted disk is a great idea. There are many options out there. Google for gnome-disk-utility and crypt setup (sorry, it is outside the scope of this document) 

From there, you can create an encrypted drive to store a backup copy of your wallet if on a USB drive, and you can create an encrypted partition to store your wallet details on your computer for everyday use!


## Sending & Recieving Vertcoin
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra, sapien nec feugiat ultrices, tortor tellus euismod quam, vel luctus ipsum dolor eu quam. Duis lacinia consequat sapien, rutrum dignissim neque faucibus vitae.

### Addresses
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra, sapien nec feugiat ultrices, tortor tellus euismod quam, vel luctus ipsum dolor eu quam. Duis lacinia consequat sapien, rutrum dignissim neque faucibus vitae.

### Coin Controls



...


