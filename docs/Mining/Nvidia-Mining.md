# Nvidia Mining Guide


## Table of Contents
1. Introduction
2. Ways to mine VTC
3. Getting started (things you’ll need)
4. Steps
	* Installing and setting programs up
	* Getting Miner’s address (to receive mining payment)
	* Setting up One Click Miner to mine with regular mining pools
	* Setting up One Click Miner to mine with p2pools
	* Optimizing
5. Final Checklist
6. Troubleshooting/FAQ

	 
### Introduction
Vertcoin is GPU – mineable and uses the Lyra2REv2 Algorithm. 

Show Nvidia GPU and rough estimate for mining speeds

At present, only the 10 series cards are profitable for mining. Lower generation cards does not necessarily mean that you are mining at a loss. Sometimes you may be able to make a smaller profit or breakeven. Get estimates from: [link coinwarz calculator].

Use the following parameters for estimation:

Standard Desktop with 1 GPU (120W + GPU draw). Leave the other fields as default.

### Mining VTC Directly
Manually (using ccminer and editing .bat file)
Easier way (using One Click Miner)

### Getting Started 
To get started with Nvidia mining, you will require the following:
* (a) Vertcoin Core Wallet [Link] (Note: Do NOT mine to electrum wallet – here’s why)
* (b) Vertcoin’s One Click Miner (Link)
* (c) Address of the mining pool you wish to mine on (eg. stratum+tcp://vertpoolname:1234)
* (d) To monitor/optimize – MSI Afterburner

### Steps:
#### Installing and setting programs up
1.	Download and unzip `(a) Core Wallet`. Vertcoin-qt.exe will be the one you use most of the time as it is the one with the Graphical User Interface. During first start up you will be prompted to select your Blockchain Data location – put it on a storage with plenty of space.
 
2.	Open up (a) Core Wallet and let it sync – the rate at which the sync occurs should increase as you get more connections to other peers (it is p2p, which means other users share their data for you to download). You can increase the speed at which it syncs by downloading the bootstrap file.
 
3.	Install (b) Vertcoin One Click Miner (OCM). When you run it for the first time it will prompt you to select your Vertcoin Blockchain Data (in this example it is D:\VTC Blockchain Data as indicated in the picture above)

#### Getting your Miner’s Address (You will receive payment with this)
4.	While the Core Wallet syncs, Click “Hide” to hide the sync progress window and reveal the User Interface.
 

5.	Navigate to Receive and enter Label as appropriate (eg. Mining from Pool XYZ) > Click Request Payment and an address will be generated for you. Double click on your generated address to reveal more information.
 
6.	You may now minimize the Vertcoin Core Wallet to let it continue syncing – the generated receiving address will be used later.

#### Setting up One Click Miner to mine on regular mining Pools (For P2Pools please skip to the next section.)
7.	Open up OCM (Vertcoin One Click Miner.exe).

8.	Navigate to "Add Pool" and enter the following:

	* Your Miner Address generated in Step (6) into Miners Address Field. Beware of any ninja “space” behind the address when pasting!
	
	* Your (c) Pool Address into the Pool Address Field.
	
	* Leave password as x. It does not affect your mining.
	
	* (Optional) Add description as necessary.
 
9.	On the left side of the interface, select Nvidia (ccminer OR Vertminer) and click Start. OCM will prompt you to install whichever miner you have selected. 

	(Note: Vertminer is a repackaged ccminer which includes 2% donation (you donate 2% of your hash time), but users typically report 2 to 8% increase in hashrate as it is optimized for VTC’s algorithm, so it may be well worth it. Feel free to experiment between both miners.)
 
10.	Click settings on top, tick “Show CLI” – this will help you determine if you are mining correctly by showing the command line window. Once you have gotten the hang of it and you know your miner runs fine, you may untick it as it will not affect your mining in any way. 

11.	If you would like to add more pool to the list, feel free to do so. Those pools will act as failovers – the miner switches over to those if the pool you are currently mining on goes down. OCM will pick the first pool in the list to begin mining. Move to Step (12) if you do not want to add more pools.

12.	Once you have completed all the steps above, you may click “Start” to begin mining, and you should see something similar to below:
 
	If you see something similar to the above, congratulations! You are now mining!

13.	Continue to mine until you get your first payment. Once you get it, you can be sure that are mining Vertcoin!

#### Optimizing:
If you are able to run everything, you may try to optimize your mining rate by limiting certain parameters on your card – do this on your own risk! The optimizing mentioned here are just suggestions – please feel free to tweak as necessary.

1.	MSI Afterburner
	* Option 1: 65% Power, +100 Core Clock, -400 Memory Clock
	* Option 2: 90% Power, +100 Core Clock, -400 Memory Clock
	* Change your fan settings! In general, it is recommended to keep your card temperature below 70°C so adjust the fan curve as necessary. 

2.	Intensity Settings in OCM 
It is generally recommended to leave intensity as default “0” (max) so that the software can automatically optimize the miner to provide the best results. However, your mileage may vary and it is still recommended that you try it out to see the results for yourself.

3.	Hardware: Casing airflow
If you haven’t done so, it may be a good time now to investigate your casing’s airflow (fans etc.)
Checklist:
Installed Vertcoin Core Wallet and One Click Miner.
Added both items to Exclusion list of Anti-virus and Firewall
Generated an address with Core Wallet
Installed dependencies on One Click Miner 
Miner hashrate on OCM is not 0 when start is clicked
 
### Troubleshooting:
1.	Stratum Connection failed!
* Check your Firewall/Antivirus settings. Miner programs occasionally get blocked or flagged as malicious.
* Try a different pool instead, the pool could be down at the moment.
2.	No hashrate shown in OCM despite successful connection in CLI
* Check your graphic drivers
3.	Why don’t I see my payouts in the Core Wallet even after the pool says that it has paid?
* Your core wallet may not be fully synced (not up to date with the latest blockchain data). Give it some more time and it should show up as soon as it syncs up to the point where you are paid.
