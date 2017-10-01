# Vertcoin Core Wallet

## Installation 

!!!caution "Note"
    The Vertcoin Core Wallet requires at least 2 GB of space on your computer to 
    store the block chain. 
### Windows

To install the Vertcoin Code wallet in Windows, navigate to the Vertcoin Core 
repository [Releases Page](https://github.com/vertcoin/vertcoin/releases) on 
GitHub and download the Windows binary file for the latest release. Both 64bit 
and 32 bit version are available.



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

das

 
