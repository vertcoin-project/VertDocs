# Electrum Wallet for Vertcoin

The [Vertcoin Electrum Wallet (Electrum-VTC)](https://github.com/vertcoin/electrum-vtc) is a lightweight wallet which does not require you to download the blockchain data onto your computer (unlike the [Core Wallet](https://github.com/vertcoin/vertcoin)). Instead, it relies on a server-client protocol which means that there is a server that provides the blockchain information to you on demand. Electrum is first released on 2011 for Bitcoin ([wiki](https://en.bitcoin.it/wiki/Electrum)), but has proven itself sufficiently to be adapted for use by many other cryptocurrencies. 

## Table of Content/Overview

**PSA: Do not mine to Electrum Wallet!**

**Getting Started**

* Installation for Windows

**Using Electrum-VTC**

* Receiving Vertcoins
* Sending Vertcoins
* Making Backups

**Recovering using backups**

* Importing Wallet File
* Importing Seed/Private Keys

**Electrum-VTC Security Explained**

* Difference between Seed key and Password
* Various Scenarios and What to do

**Conclusion**



##[PSA: Do not mine to Electrum Wallet! (heres why)](https://www.reddit.com/r/vertcoin/comments/7ix2jn/do_not_mine_to_a_ledger_or_electrum_wallet_use/)

If you are mining, **DO NOT** mine to Electrum-VTC. Use the [Core Wallet (download link)](https://github.com/vertcoin/vertcoin/releases) instead - the reason being, mining generates a lot of small payments (dust payments) and Electrum-VTC is written with Python, which does not handle all these transactions that well compared to the Core Wallet. Also, since it relies on external servers (which anyone can host), if there is too much volume from mining transactions and the servers get overloaded your transactions will be very very slow to process.

That said, lets get started with Electrum-VTC !

## Getting Started

In short, this guide will include the essential steps which most users would need to comfortably use this wallet.

1. Installing Electrum-VTC
2. Using Electrum-VTC to send/receive funds
3. Backing up - How to do a backup, what to keep, and how to restore your wallet
4. Security things you need to know to keep your funds safe

### Installation for Windows 

To start, navigate to the [Vertcoin-Electrum's Github releases page](https://github.com/vertcoin/electrum-vtc/releases) and download the appropriate version for your computer's Operating System. You may notice that there are two different files that look the same:

![Electrum VTC downloading](../images/electrum-vtc-select.PNG)

Either version will work; the difference being:

* **Installer Version:** Creates files/folders in your PC's windows directories.
* **Portable Version:** Creates file/folders in the directory the .exe file is located - benefits of this is that you can carry it on a USB Drive/Portable HDD.

**Usage & security wise, both versions are equal**. The difference is, if you choose to use the Portable Version one on a USB stick you'd have to be wary of computers which are not secure and/or infected with malware.

Once you double click on your downloaded Electrum-VTC.exe file it should open up to this screen:

![Electrum VTC 1](../images/electrum-vtc-install-1.png)

Put whatever name you fancy there, and press `Next` to see the next screen:

![Electrum VTC 2](../images/electrum-vtc-install-2.png)

In this guide, we will focus on **Standard wallet**. Select standard wallet and click `Next`. You will see this screen:

![Electrum VTC 3](../images/electrum-vtc-install-3.png)

> *Note: A multi-signature wallet is a wallet that requires 2 or more signatures before funds can be released. Useful when you have a joint account with someone else, or when you want to make your funds even more difficult for any potential attackers to steal. You can read more about this in the [Electrum.org Documentation](http://docs.electrum.org/en/latest/multisig.html).*

Select `Create a new seed` and click `Next` and you will see 12 words - these are your **seed keys (also known as private keys)**. **WRITE THESE DOWN AND KEEP THEM SOMEWHERE SAFE!** If someone gets them, they get all your funds.

![Electrum VTC 4](../images/electrum-vtc-install-4.png)

Click `Next`, and you will be prompted to re-enter your seed keys. Look back at your paper and type it in!

![Electrum VTC 5](../images/electrum-vtc-install-5.png)

Once that is done, you will be asked to key in your password. This password will be used whenever you wish to send your funds out from the wallet. 

![Electrum VTC 6](../images/electrum-vtc-install-6.png)

Once you see this screen below - you're ready to go! As long as the bottom right of the UI shows a green color indicating that it is connected to the servers, you can basically start sending/receiving coins. 

> Note: It is probably a good idea to try and send a small amount to test before sending the rest!

![Electrum VTC UI 1](../images/electrum-vtc-ui-1.png)



## Using Electrum-VTC

###Receiving Vertcoins

To receive payment in VTC, you'll need to have an address. Navigate to the `Receive` tab for your receive address (*Note: It should start with V. If it is anything else, check and make sure you are using Electrum-VTC!*). Copy the address or scan the QR code. 

![Receiving Address](../images/electrum-vtc-receiving-1.png)

In this example, 0.1 VTC will be sent to this wallet as a demonstration - this will be largely similar to when you receive payments from your buddy for that pizza/beer money and so on. Receiving payment is fairly straightforward - once the other party says that they have sent their Vertcoin, they should provide you with a Transaction ID (see below) which you would be able to look up on block explorer websites such as [Bitinfocharts](https://bitinfocharts.com/vertcoin/explorer/) or [CryptoID](https://bitinfocharts.com/vertcoin/explorer/).

Under normal network load, you should see your transaction almost immediately on the wallet (see below) and you'll should see it as **"Unconfirmed"** - that means that your transaction has been broadcasted to the blockchain, but it has not been added to any blocks yet (also known as "to receive confirmations"). 

If you need more information, you can double click the item for the transaction ID cross-check it with the one your sender has provided you with.

![Unconfirmed Transaction](../images/electrum-vtc-receiving-2.png)

At this point, your payment should be secure - give it more time and you will see that a timestamp appears:

![Confirming transaction](../images/electrum-vtc-receiving-3.png)

Description can be added as necessary for your to remember the payment details. The little red pie on the left side will slowly turn green as your transaction gets more and more confirmations on the blockchain. You will get a tick when it has  >= 6 confirmations.

![Confirmed transaction](../images/electrum-vtc-receiving-4.png)

> Note: You can spend the VTC even if there is only one confirmation.

That's it - that's all there is to receiving payments! Lets move on to sending now.



### Sending Vertcoins

We will try sending the 0.1 VTC above - it will be similar when you try to send funds to someone else as well. The receiving party should give you their Vertcoin receiving address (much like the one we have earlier up there, in the `Receive` tab). Copy that down, and navigate to the `Send` tab on the left side. 

You'll see a couple of fields where you can fill in:

* Pay to - Paste the receiver's address here! Double check the make sure the address is correct.
* Description - Add something for your own reference, so you know what you paid for.
* Amount - How much did the pizza cost you? 
* Fee - Default is 0.002 VTC. More on fees below.

![Sending](../images/electrum-vtc-sending-1.png)

A little snip below will shed more light on how the fee affects your payment. Miners automatically process transactions with higher fees first.

![Sending fees](../images/electrum-vtc-sending-2.png)

Once again, make sure all details are correct! Click the green `Send` and you'll be prompted to enter your passphrase to authorize the transaction. 

![Authorizing transaction](../images/electrum-vtc-sending-3.png)

Once the transaction is authorized and broadcasted to the network, you'll see a window with the transaction ID. As with receiving payment, you can use the ID on blockchain explorers such as [Bitinfocharts](https://bitinfocharts.com/vertcoin/explorer/) or [CryptoID](https://bitinfocharts.com/vertcoin/explorer/) for more info.

![Payment sent](../images/electrum-vtc-sending-4.png)

You can then navigate to the `History` tab on the left side if you wish to track it. Initially the payment will be shown as "Unconfirmed". Double click on the transaction to see the status.

![Authorizing transaction](../images/electrum-vtc-sending-5.png)

Once the payment is through, you will see that it starts receiving confirmation.

![Transaction complete](../images/electrum-vtc-sending-6.png)

At this point the other party should see the payment reflect in their balance.

And that is all when it comes to Sending Vertcoins!



### Making Backups (VERY IMPORTANT!)

Backups are important since we store them digitally. Even more important - ways to recover them a.k.a your seed keys. No one but the seed key holder can recover your funds! 

Electrum-VTC is a [Deterministic Wallet (wiki link)](https://en.bitcoin.it/wiki/Electrum) where the seed keys (which you should have written down by now!) can be used to recover your wallet should anything go wrong. Remember to keep your seed keys safe - if someone gets them, they get to spend ALL your funds.

In addition to that, you can always make a backup of your wallet.dat file - note that this is different from the seed keys. 

* **Seed keys** - Used to prove to the network that you own these funds. Don't show it to anyone. Electrum can recover 	your wallet.dat file with the seed keys.
* **Wallet.dat file** - The wallet file.
* **Password** - Encrypts your wallet.dat file so people can't spend the funds even if they get their hands on it.

In short, you need to keep your **(1) Seed Keys**, **(2) Wallet.dat file** and **(3) Password** safe. At this point, you should have **(1) seed keys** written down in a secure place. 

To backup your **(2) wallet.dat file**, navigate to the toolbar on top, click "File" > "Save Copy". Put it in a secure location such as a thumb drive that is private and offline. And then you're done with backing up.

![Backing up wallet.dat](../images/electrum-vtc-backup-1.png)

> Note 1: It is **NOT RECOMMENDED** to store your wallet file on cloud storages like Dropbox/Google Drive. An attacker can try to brute force your wallet file if they get their hands on it. 

> Note 2: It is recommended that you do a backup every month or so. 

## Recovering your funds

### Importing Wallet file

Now that we have our wallet.dat backed up, we'll simulate the catastrophic event where a computer's storage has failed and the user is left with no wallet except the backup in the thumb drive.

On another computer, download Electrum-VTC and open it:

![Electrum VTC 1](../images/electrum-vtc-install-1.png)

Navigate to where your wallet.dat backup is, and open it with Electrum. If it is encrypted your password, you need to enter them to open up the wallet. You can now use your wallet as usual!



### Importing Seed/Private Keys

Another important function to take note of in Electrum-VTC is the function to **Sweep Private Keys.** Usually, this function is used to recover coins from a wallet which you have lost your access to, but still have the private keys. 

To do that, first make sure you have the private keys of the wallet you want to recover. Then, navigate to toolbar on top, go to "Wallet" > "Private keys" > "Sweep"

![Sweep keys option](../images/electrum-vtc-sweep-1.png)

Then, paste the private keys you have onto the box.

![Sweeping](../images/electrum-vtc-sweep-2.png)

When you are ready, hit `Sweep`. Electrum will do the rest and you should see the corresponding amount swept reflect onto your balance.

> IMPORTANT: The two methods listed above basically underlines the importance of keeping your (1) Seed keys, (2) Wallet file and (3) Password safe. This cannot be emphasized enough!



## Electrum-VTC Security Explained

### Difference between the Seed Keys and Password 

At this point you may wonder - what is the difference between the **Seed keys** you wrote down earlier, and this **password**?

* **Seed keys** - They form your private keys, which helps your to prove ownership of one particular set of coins.
* **Password** - They encrypt your wallet file, meaning if anyone logged onto your computer and/or got hold of your wallet.dat file, they cannot access your funds without your password.

That said, if someone gets your **SEED KEYS**, they basically get your private keys. They can use those to prove to the blockchain that they "own" those coins (*your coins!*). They can then use those seed keys to transfer your balance into their wallet and start spending it for themselves - hence the emphasis throughout this guide to remind you to keep your **Seed Keys** safe!

### Various Scenarios and What To Do

A table below summarizes the various scenarios and steps to take if they should happen.

* ✓ - indicates that you are confident it is safe and only you have it.
* X - indicates it has been compromised, or that you do not remember it. 

| Password | Seed Keys | Wallet.dat file | Risk Level | To Do                                    |
| :------- | --------- | --------------- | :--------: | :--------------------------------------- |
| X        | ✓         | ✓               |    Low     | As long as you have your seed keys, you will be able to restore your wallet. Use the sweep function. |
| ✓        | X         | ✓               |   Severe   | Quickly check to ensure your balance is still there. If yes, send it over to a new wallet with a new password. **DITCH the old wallet afterwards!** |
| ✓        | ✓         | X               |    Low     | Create a new wallet, encrypt with a different passphrase and sweep the private keys of the old wallet file into your new wallet. |
| X        | X         | ✓               |   Severe   | Try to remember your password or your seed keys, and then send the funds to a new wallet. Otherwise you will LOSE your funds. |
| X        | ✓         | X               |   Severe   | Create a new wallet, secure with a different password and sweep your private keys to retrieve your funds. If you lose both your wallet.dat file and passphrase, your funds are at risk since someone who has both can access your funds. |
| ✓        | X         | X               |   Severe   | You can't do anything if you have the password and not the seed or wallet.dat file. |

> **IMPORTANT**: If anyone tells you they can recover your funds for you, they are lying. **DO NOT GIVE THEM ANYTHING.**



## Conclusion

Electrum-VTC is a lightweight wallet that allows you to send/receive funds without needing to download the blockchain data and most importantly, without compromising and security features. As long as you follow the guide and take steps to secure your seed keys, wallet file and password - your funds will be safe.

Thank you for taking the time to read through this guide. I hope you enjoyed it as much as I have writing it! Stay safe!