# Raspberry Pi 3 B/B+ Vertcoin full node installation done on Windows

![Raspberry Pi 3 Zebra Black Ice Case](https://i.imgur.com/zgx4uiu.jpg) 

#### Why a Vertcoin Full node?
>Vertcoin is a digital currency supported by a peer-to-peer network. In order to run efficiently and effectively, it needs peers run by different people... and the more the better. [1]

>This tutorial will describe how to create a Vertcoin “full node” (a Vertcoin server that contains the full blockchain and propagates transactions throughout the Vertcoin network via peers). This system will not mine for Vertcoins... it will play its part to keep the Vertcoin peer-to-peer network healthy and strong. For a detailed explanation for why it is important to have a healthy Vertcoin peer-to-peer network, read this [article](https://medium.com/@lopp/bitcoin-nodes-how-many-is-enough-9b8e8f6fd2cf) about Bitcoin full nodes. [2]

>Also please note this will be a “headless” server... meaning we will not be using a GUI to configure Vertcoin or check to see how things are running. In fact, once the server is set up, you will only interact with it using command line calls over SSH. The idea is to have this full node be simple, low-power, and something that “just runs” in your basement, closet, etc.

#### Why a Raspberry Pi?
>Raspberry Pi is an inexpensive computing hardware platform that generates little heat, draws little power, and can run silently 24 hours a day without having to think about it. [1]

#### Index
1. `Parts List`
2. `Download and sync Vertcoin Core QT *`
3. `Format USB Flash Drive`
4. `Install Raspbian Stretch Lite`
5. `Copy Blockchain to USB Flash Drive`
6. `Setup Raspberry Pi`
7. `Setup USB Flash Drive and Auto-Mount`
8. `Create vertcoin.conf and soft link to USB Flash Drive`
9. `Configure firewall to allow Vertcoin Core traffic`  
10. `Congratulations! Thanks for doing your part and running a Vertcoin full node <3`

`* EXPIRMENTAL: Setup p2pool-vtc`  
`* EXPIRMENTAL: Setup Unitus full node to merge mine on p2pool-vtc`   

##

### 1.) Parts List

| Parts                                                        | Price      | Link                                                                            |
|--------------------------------------------------------------|------------|---------------------------------------------------------------------------------|
| CanaKit Raspberry Pi 3 B+                                    | $49.99 USD | https://www.amazon.com/CanaKit-Raspberry-Power-Supply-Listed/dp/B07BC6WH7V/     |
| Samsung 32GB 95MB/s (U1) MicroSD EVO Select Memory Card      | $12.99 USD | https://www.amazon.com/Samsung-MicroSD-Adapter-MB-ME32GA-AM/dp/B06XWN9Q99/      |
| SanDisk Ultra Fit 128GB USB 3.0 Flash Drive                  | $27.49 USD | https://www.amazon.com/SanDisk-Ultra-128GB-Flash-Drive/dp/B01BGTG2A0/           |
| Transcend USB 3.0 SDHC / SDXC / microSDHC / SDXC Card Reader | $9.23 USD  | https://www.amazon.com/Transcend-microSDHC-Reader-TS-RDF5K-Black/dp/B009D79VH4/ |
| *OPTIONAL: Zebra Black Ice Case for Raspberry Pi by C4Labs   | $14.95 USD | https://www.amazon.com/Zebra-Black-Case-Raspberry-C4labs/dp/B00M6G9YBM/         |


You may change the USB Flash Drive to match your preference. I `highly recommend` that a USB Flash Drive (16GB - 128GB) or an External Hard Drive is paired with the Raspberry Pi. 

The case in the parts list is a personal preference, it is your choice how you wish to protect your Raspberry Pi. The Zebra Black Ice case was chosen for it's cut out on the bottom of the case, allowing for the placement of a heatsink on the `RAM` of the Raspberry Pi. 

### 2.) Download and sync Vertcoin Core  

This step is `optional` but recommended. [Download](https://github.com/vertcoin-project/vertcoin-core/releases) the latest stable release of Vertcoin Core and launch `vertcoin-qt.exe` to begin the syncing process. I use my desktop PC to sync the blockchain first because it has better specs than a $35 Raspberry Pi. The PC will sync headers, download blocks and verify blocks faster than the Raspberry Pi can.

We will use this copy of the blockchain that is syncing to side-load onto our Raspberry Pi later.

#### If you choose not to follow this step, create a new folder named `vertcoin` on your USB Flash Drive that you will format in the next step.

`Vertcoin Core Download Link: https://github.com/vertcoin-project/vertcoin-core/releases`  
`Default Windows Directory (Vertcoin): C:\Users\%USER%\AppData\Roaming\Vertcoin`  

### 3.) Format USB Flash Drive

>The Vertcoin blockchain is about 4GB today (4/23/2018) which means that a 16GB USB Flash Drive will have more than enough space to store everything we need, but you can easily future proof with a 128GB USB Flash Drive.  

Insert the USB Flash Drive into your Windows PC. Then access the drive with Windows Explorer `Win+E`, right click on the removable drive you wish to format and `Format...`

Format the USB Flash Drive to an `NTFS` File system. 

This USB Flash Drive will contain our Vertcoin data directory as well as our swap space file. We will give the Raspberry Pi some extra memory to work with we will ensure a swap file large enough to handle the memory demand to bootstrap the blockchain. 

It is worth mentioning that constantly writing data to the MicroSD card can be damaging, in this guide we will configure the swap file to reside off of the card.



### 4.) Install Raspbian Stretch Lite

>Raspbian is a free operating system based on Debian, optimised for the Raspberry Pi hardware. Raspbian comes with over 35,000 packages: precompiled software bundled in a nice format for easy installation on your Raspberry Pi.
> 
>`https://www.raspberrypi.org/documentation/raspbian/`

I recommend downloading the latest stable version of [Raspbian Stretch Lite](https://www.raspberrypi.org/downloads/raspbian/). 

We will utilize the software 'Win32 Disk Imager' to format and install Raspbian on the MicroSD card. Please follow the [guide](https://www.raspberrypi.org/documentation/installation/installing-images/windows.md) below for details on installing the Rasbian image to the MicroSD card.


`Raspberry Pi - Installing Operating System Images Using Windows: https://www.raspberrypi.org/documentation/installation/installing-images/windows.md`

Once Win32 Disk Imager is finished writing to the MicroSD card please access the 'boot' partition of the MicroSD card with Windows Explorer `Win+E`. Create a new empty text file named `ssh` like so...

![MicroSD card - ssh](https://i.imgur.com/m14rGdV.png)  
This enables SSH access on the Raspberry Pi's first boot sequence. Please safely remove the USB Card Reader / MicroSD card as to ensure the data is not corrupted.

`Raspian Download Link: https://www.raspberrypi.org/downloads/raspbian/`  

`Win32 Disk Imager Documentation: https://www.raspberrypi.org/documentation/installation/installing-images/windows.md`


### 5.) Copy Blockchain to USB Flash Drive
When `Vertcoin Core` is finished syncing the blockchain please navigate to the data directory for `Vertcoin`

`Default Windows Directory (Vertcoin): C:\Users\%USER%\AppData\Roaming\Vertcoin`  

Create a new folder named `vertcoin` on your USB Flash Drive that was formatted as an `NTFS` file system earlier and copy the folders `blocks` and `chainstate` to the `vertcoin` folder on your USB Flash Drive. This will allow us to side-load the Vertcoin blockchain and bootstrap faster than if we had the Raspberry Pi do all the work. 

### 6.) Setup Raspberry Pi

Please insert the MicroSD card that was safely removed into the slot located on the bottom of the Raspberry Pi. Connect an Ethernet cable to the Raspberry Pi that has internet access. When you are ready to power on the Pi, plug the power supply in and the Raspberry Pi will immediately begin to boot.

We will access our Raspberry Pi through an SSH session on our Windows PC. I like to use `Git Bash` which is included in the Windows [download](https://git-scm.com/downloads) of `Git`.

`Git download link: https://git-scm.com/downloads`  

Open a web browser page and navigate to your router page and identify the `IP` address of the freshly powered on Raspberry Pi. In my case the `IP` address is `192.168.1.2`, please make note of your Raspberry Pi's `IP` address as we will need to use it to login via `SSH`.  

\# Open `Git Bash` and ...  
`~ $ ssh 192.168.1.2 -l pi`  
`default password: raspberry`

\# Download and install latest system updates  
`pi@raspberrypi:~ $ sudo apt-get update ; sudo apt-get upgrade -y`


\# Remove orphaned packages and clean `apt`  
`pi@raspberrypi:~ $ sudo apt-get autoremove ; sudo apt-get autoclean`


\# Initiate `raspi-config` script  
`pi@raspberrypi:~ $ sudo raspi-config`

```
1.) [8] Update					# update raspi-config script first
2.) [1] Change User Password	# change password for current user
3.) [4] Localization Options	#
	> [I2] Change Timezone		# set your timezone
4.) [7] Advanced Options		#
	> [A1] Expand Filesystem	# expand filesystem 
```
`<Finish>` and choose to reboot.

\# Wait a minute, then log back in via `SSH`  
`ssh 192.168.1.2 -l pi`  

\# Download and install useful software packages  
`pi@raspberrypi:~ $ sudo apt-get install git ntfs-3g -y`  

\# Install `bitcoin` dependencies `https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md`  
`pi@raspberrypi:~ $ sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 -y`  

    # * OPTIONAL: DISABLE WIRELESS & BLUETOOTH
  
    # Create our blacklist file  
    `pi@raspberrypi:~ $ cd /etc/modprobe.d/`  
    `pi@raspberrypi:/etc/modprobe.d $ sudo nano raspi-blacklist.conf`  

    ```
    # disable wireless
    blacklist brcmfmac
    blacklist brcmutil

    # disable bluetooth
    blacklist btbcm
    blacklist hci_uart
    ```  
    `ctrl+x` to save

    # Reboot Raspberry Pi for changes to take effect  
    `pi@raspberrypi:/etc/modprobe.d $ sudo reboot`  

    # Wait a minute, then log back in via `SSH`   
    `ssh 192.168.1.2 -l pi`  

\# Download latest stable version of vertcoin-core for `ARM` architecture to Raspberry Pi  
`pi@raspberrypi:~ $ wget https://github.com/vertcoin-project/vertcoin-core/releases/download/0.13.0/vertcoind-v0.13.0-linux-armhf.zip`  

\# Unzip `vertcoind-v0.13.0-linux-armhf.zip`  
```
pi@raspberrypi:~ $ unzip vertcoind-v0.13.0-linux-armhf.zip
Archive:  vertcoind-v0.13.0-linux-armhf.zip
  inflating: vertcoin-cli
  inflating: vertcoind
  inflating: vertcoin-tx
```  
\# Remove `vertcoind-v0.13.0-linux-armhf.zip`  
`pi@raspberrypi:~ $ rm *.zip`  

\# Give privileges to `vertcoin` binaries  
`pi@raspberrypi:~ $ sudo chmod +x vertcoin*`

\# Move `vertcoin-cli`, `vertcoind`, `vertcoin-tx` to `/usr/bin/`  
`pi@raspberrypi:~ $ sudo mv vertcoin* /usr/bin/`  

### 7.) Setup USB Flash Drive and Auto-Mount

Please insert the USB Flash Drive that contains the folders `blocks` and `chainstate` into the Raspberry Pi. We will mount the USB Flash Drive to the Raspberry Pi and configure the device to auto-mount on reboot ensuring the blockchain stays accessible to the `Vertcoin` daemon after reboot.  

\# Find your USB Flash Drive  
```
pi@raspberrypi:~ $ sudo blkid
/dev/mmcblk0p1: LABEL="boot" UUID="5DB0-971B" TYPE="vfat" PARTUUID="efbdd15e-01"
/dev/mmcblk0p2: LABEL="rootfs" UUID="060b57a8-62bd-4d48-a471-0d28466d1fbb" TYPE="ext4" PARTUUID="efbdd15e-02"
/dev/mmcblk0: PTUUID="efbdd15e" PTTYPE="dos"
/dev/sda1: UUID="0DC965316518EB7C" TYPE="ntfs" PARTUUID="00e3d476-01"
```  
My USB device appears as `/dev/sda1` which shows a filesystem type of `NTFS`, your device may be listed differently. Please take note of the `/dev/*` information that identifies your USB Flash Drive.  

\# Make sure a mount point exists for the USB Flash Drive  
```
pi@raspberrypi:~ $ sudo mkdir /mnt
mkdir: cannot create directory ‘/mnt’: File exists
```  
\# Give `/mnt` privileges  
`pi@raspberrypi:~ $ sudo chmod 755 /mnt`  

\# Mount USB Flash Drive to mount point  
`pi@raspberrypi:~ $ sudo mount /dev/sda1 /mnt`  

\# Confirm USB Flash Drive was successfully mounted to `/mnt`
```
pi@raspberrypi:~ $ ls /mnt/vertcoin/
blocks  chainstate  
```  
\# Setup `fstab` file to auto-mount the USB Flash Drive on reboot  
`pi@raspberrypi:~ $ sudo nano /etc/fstab` 
```
proc            /proc           proc    defaults          0       0
PARTUUID=efbdd15e-01  /boot           vfat    defaults          0       2
PARTUUID=efbdd15e-02  /               ext4    defaults,noatime  0       1

# replace /dev/sda1 with your USB device, [tab] between each value
/dev/sda1       /mnt    ntfs    defaults        0       0

# a swapfile is not a swap partition, no line here
#   use  dphys-swapfile swap[on|off]  for that
```
`ctrl+x` to save

\# Reboot to confirm auto-mount is successful  
`pi@raspberrypi:~ $ sudo reboot	`  

\# Wait a minute, then log back in via `SSH`  
`ssh 192.168.1.2 -l pi`  

\# Confirm USB Flash Drive auto-mounted  
```
pi@raspberrypi:~ $ ls /mnt/vertcoin
blocks  chainstate 
```  

### 8.) Create `vertcoin.conf` and soft link to USB Flash Drive

\# Change directory to `/mnt/vertcoin`  
`pi@raspberrypi:~ $ cd /mnt/vertcoin`

\# Create `vertcoin.conf` for Vertcoin Core  
`pi@raspberrypi:/mnt/vertcoin $ sudo nano vertcoin.conf`
```
server=1
rpcuser=vertnode
rpcpassword=yoursecurepasswordgoeshere

# makes client run in background
daemon=1

# https://jlopp.github.io/bitcoin-core-config-generator/ lopp.net optimizations
dbcache=100
maxorphantx=10
maxmempool=50
maxconnections=40
maxuploadtarget=5000
```  
`ctrl+x` to save  

`* OPTIONAL: A quick and easy way to generate a random password is taking the md5sum of a file`
```
pi@raspberrypi:/mnt/vertcoin $ touch randomfilename
pi@raspberrypi:/mnt/vertcoin $ md5sum randomfilename
d41d8cd98f00b204e9800998ecf8427e  randomfilename

# Clean up 
pi@raspberrypi:~/.vertcoin $ rm randomfilename
```   

\# Change directory back home  
```
pi@raspberrypi:/mnt/vertcoin $ cd
pi@raspberrypi:~ $ pwd
/home/pi
```  
 \# Create soft link (symbolic link) connecting `/mnt/vertcoin/` <---> `/home/pi/.vertcoin`  
`pi@raspberrypi:~ $ sudo ln -s /mnt/vertcoin/ /home/pi/.vertcoin`  

\# List all files in home  
```
pi@raspberrypi:~ $ ls -a
.  ..  .bash_history  .bash_logout  .bashrc  .config  .profile  .vertcoin  .wget-hsts
```  
\# List files in `/home/pi/.vertcoin`, confirm blockchain and `vertcoin.conf` is there  
```
pi@raspberrypi:~ $ ls .vertcoin
blocks  chainstate  vertcoin.conf
```  

#### Create swap file space for Raspberry Pi  

Here we ensure that `dphys-swapfile` is installed and configured to save the swap file in `/mnt/swap`, allocate `1024 MB` of swap file space. You can choose a smaller amount of space for a swap file, I would not recommend going lower than `300 MB`. 

\# Install `dphys-swapfile` 
```
pi@raspberrypi:~ $ sudo apt-get install dphys-swapfile
Reading package lists... Done
Building dependency tree
Reading state information... Done
dphys-swapfile is already the newest version (20100506-3).
0 upgraded, 0 newly installed, 0 to remove and 15 not upgraded.
```  

\# Configure swap file  
`pi@raspberrypi:~ $ sudo nano /etc/dphys-swapfile`  
```
# /etc/dphys-swapfile - user settings for dphys-swapfile package
# author Neil Franklin, last modification 2010.05.05
# copyright ETH Zuerich Physics Departement
#   use under either modified/non-advertising BSD or GPL license
# this file is sourced with . so full normal sh syntax applies
# the default settings are added as commented out CONF_*=* lines

# reconfigure swapfile to reside on /mnt/swap
CONF_SWAPFILE=/mnt/swap

# set size to absolute value, leaving empty (default) then uses computed value
#   you most likely don't want this, unless you have an special disk situation
CONF_SWAPSIZE=1024

# set size to computed value, this times RAM size, dynamically adapts,
#   guarantees that there is enough swap without wasting disk space on excess
#CONF_SWAPFACTOR=2

# restrict size (computed and absolute!) to maximally this limit
#   can be set to empty for no limit, but beware of filled partitions!
#   this is/was a (outdated?) 32bit kernel limit (in MBytes), do not overrun it
#   but is also sensible on 64bit to prevent filling /var or even / partition
#CONF_MAXSWAP=2048
```  
`ctrl+x` to save  

\# Restart swap file service  
```
pi@raspberrypi:~ $ sudo /etc/init.d/dphys-swapfile stop
[ ok ] Stopping dphys-swapfile (via systemctl): dphys-swapfile.service.
```
```
pi@raspberrypi:~ $ sudo /etc/init.d/dphys-swapfile start
[ ok ] Starting dphys-swapfile (via systemctl): dphys-swapfile.service.
```  

#### Setup Vertcoin Core Crontab for auto-start on reboot  

We will configure the `crontab` file to start `vertcoind` on reboot and on each hour to ensure `vertcoind` always has a process thats alive. If `vertcoind` is already running when the hourly `crontab` executes it will simply fail to spawn a new process. 

\# Configure `crontab` file to start `vertcoind` hourly and on reboot  

`pi@raspberrypi:~ $ crontab -u pi -e`
```
no crontab for pi - using an empty one

Select an editor.  To change later, run 'select-editor'.
  1. /bin/ed
  2. /bin/nano        <---- easiest
  3. /usr/bin/vim.tiny

Choose 1-3 [2]: 2
----------------------------------------------------------------------
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command

@reboot vertcoind

# This is optional, this can cause for an annoying execution of a resource heavy 
# application on load while troubleshooting an issue. Just be mindful that crontab
# is setup this way if you choose to use it. Uncomment line to enable.
#@hourly vertcoind 
```  
`ctrl+x` to save  

\# Reboot and confirm `vertcoind` process spawns on reboot  
`pi@raspberrypi:~ $ sudo reboot	`  

\# Wait a minute, then log back in via SSH  
`ssh 192.168.1.2 -l pi`  
```
pi@raspberrypi:~ $ ps aux | grep vertcoin				
pi         406 99.9  9.5 169160 90256 ?        Rsl  22:43   1:46 vertcoind -daemon
pi         530  0.0  0.0   4372   560 pts/0    S+   22:45   0:00 grep --color=auto vertcoin
```

### Quick note about blockchain syncing
    Vertcoin Core is now synchronizing to the side-loaded blockchain located in `/mnt/` 
    (linked to `/home/pi/.vertcoin`). This process can take up to an hour to sync 
    headers and verify all of the downloaded blocks. Vertcoin 0.13.0 has shown major
    improvements to loading time of the blockchain and can take as little as 
    two minutes to fully load.
    
    You can monitor system resources by issuing the htop command and check up on 
    vertcoind by issuing the following commands: 
    
    # Display output of Vertcoin debug.log; ctrl+c to stop  
    pi@raspberrypi:~ $ tailf .vertcoin/debug.log
    
    # Show blockchain information  
    pi@raspberrypi:~ $ vertcoin-cli getblockchaininfo
    
    # Show current block  
    pi@raspberrypi:~ $ vertcoin-cli getblockcount  

You may continue on while `vertcoind` catches up to the blockchain ...  


### 9.) Configure firewall to allow Vertcoin Core traffic  

Please note that your `IP` range may be different than what I have listed below. If your router `IP` address is `192.168.1.1` then the instructions above require no alterations. If your `IP` address is something like `192.168.56.1` or `10.0.0.1` then you will need to modify the 'ufw allow from `192.168.1.0/24` to any port 22' to 'ufw allow from `192.168.56.0/24`(...)' or 'ufw allow from `10.0.0.0/24`(...)' respectively. 

\# Install `UFW`  
`pi@raspberrypi:~ $ sudo apt-get install ufw`  

\# Escalate to `root` and configure `UFW`

`pi@raspberrypi:~ $ sudo su`  
`root@raspberrypi:/home/pi# ufw default deny incoming`  
```
Default incoming policy changed to 'deny'
(be sure to update your rules accordingly)
```
`root@raspberrypi:/home/pi# ufw default allow outgoing`  
```
Default outgoing policy changed to 'allow'
(be sure to update your rules accordingly)
```
`root@raspberrypi:/home/pi# ufw allow from 192.168.1.0/24 to any port 22 comment 'allow SSH from local LAN'`  
`root@raspberrypi:/home/pi# ufw allow 5889 comment 'allow vertcoin core'`  
`root@raspberrypi:/home/pi# ufw enable`  
```
Command may disrupt existing ssh connections. Proceed with operation (y|n)? y
Firewall is active and enabled on system startup
```  
`root@raspberrypi:/home/pi# systemctl enable ufw`  
```
Synchronizing state of ufw.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable ufw
```
`root@raspberrypi:/home/pi# ufw status`  
```
Status: active

To                         Action      From
--                         ------      ----
22                         ALLOW       192.168.1.0/24             # allow SSH from local LAN
5889                       ALLOW       Anywhere                   # allow vertcoin core
5889 (v6)                  ALLOW       Anywhere (v6)              # allow vertcoin core
```
\# Give up `root`  
`root@raspberrypi:/home/pi# exit`  

Open a browser window and navigate to your router page, from there you can port forward your Raspberry Pi.  
`TCP/UDP Port: 5889`  

#### This will make your node public, supporting the health of the Vertcoin network by keeping it decentralized and populated with one more node.

### 10.) Congratulations! Thanks for doing your part and running a Vertcoin full node <3
You have successfully setup a full Vertcoin Core node on a Raspberry Pi. Thank you for following along and contributing to the Vertcoin network by helping keep it populated with nodes and distributed. You help give meaning to "the peoples" coin'!
```
pi@raspberrypi:~ $ vertcoin-cli getblockchaininfo
{
  "chain": "main",
  "blocks": 919881,
  "headers": 919881,
  "bestblockhash": "846ae520eebe3ecfc33c0bc427ab1414e9f45010623e00f9a7e24697d5a3fa12",
  "difficulty": 39708.0468186609,
  "mediantime": 1525044381,
  "verificationprogress": 0.9999867830498936,
  "initialblockdownload": false,
  "chainwork": "000000000000000000000000000000000000000000000001b087526cfafa4e4a",
  "size_on_disk": 3459943082,
  "pruned": false,
  "bip9_softforks": {
    "csv": {
      "status": "active",
      "startTime": 1488326400,
      "timeout": 1519862400,
      "since": 691488
    },
    "segwit": {
      "status": "active",
      "startTime": 1488326400,
      "timeout": 1519862400,
      "since": 713664
    },
    "nversionbips": {
      "status": "active",
      "startTime": 1488326400,
      "timeout": 1519862400,
      "since": 691488
    }
  },
  "warnings": ""
}
pi@raspberrypi:~ $ vertcoin-cli getconnectioncount
30
```

-----------------------------------------

## `* EXPIRMENTAL:` Setup p2pool-vtc  

If you are serious about mining `Vertcoin` please check out the `One Click Miner: https://github.com/vertcoin-project/One-Click-Miner`. `OCM` gives the best mining experience with the least technical setup. 

This section gives you the techncial know how of setting up an instance of a Vertcoin P2Pool on the Raspberry Pi to run alongside the `vertcoind` daemon. I `DO NOT RECOMMEND` anyone who is serious about mining `Vertcoin` to mine on a `p2pool` setup on the Raspberry Pi `Vertcoin` full node. I have experienced connectivity issues between `p2pool` and the `vertcoin daemon` losing connection to the full node for minutes at a time creating numerous `stratum` timeouts. This section exists only for those wishing to experiment. 

>P2Pool is a decentralized Bitcoin mining pool that works by creating a peer-to-peer network of miner nodes.

>P2Pool creates a new block chain in which the difficulty is adjusted so a new block is found every 30 seconds. The blocks that get into the P2Pool block chain (called the "share chain") are the same blocks that would get into the Bitcoin block chain, only they have a lower difficulty target. Whenever a peer announces a new share found (new block in the P2Pool block chain), it is received by the other peers, and the other peers verify that this block contains payouts for all the previous miners who found a share (and announced it) that made it into the P2Pool share chain. This continues until some peer finds a block that has a difficulty that meets the Bitcoin network's difficulty target. This peer announces this block to the Bitcoin network and miners who have submitted shares for this block are paid in the generation transaction, proportionally to how many shares they have found in the last while. - Unknown author [3]
>
> Decentralized payout pooling solves the problem of centralized mining pools degrading the decentralization of Bitcoin and avoids the risk of hard to detect theft by pool operators.
>
> Miners are configured to connect to a P2Pool node that can be run locally, alongside the miner. P2Pool users must run a full Bitcoin node which serves the purpose of independently validating transactions and the Bitcoin blockchain.
>
> P2Pool nodes work on a chain of shares similar to Bitcoin's blockchain. Each node works on a block that includes payouts to the previous shares' owners and the node itself, which can also result in a share if it meets P2Pool's difficulty. 

\# Install `p2pool-vtc` dependencies and `python-pip`   

`pi@raspberrypi:~ $ sudo apt-get install python-rrdtool python-pygame python-scipy python-twisted python-twisted-web python-imaging python-pip -y`  

\# Install `bitcoin` dependencies and `libffi-dev` 

`pi@raspberrypi:~/p2pool-vtc $ sudo apt-get install build-essential libtool autotools-dev automake pkg-config libffi-dev libssl-dev libevent-dev bsdmainutils python3 -y`

\# Clone `p2pool-vtc`  
```
pi@raspberrypi:~ $ git clone https://github.com/vertcoin-project/p2pool-vtc.git
Cloning into 'p2pool-vtc'...
remote: Counting objects: 8393, done.
remote: Total 8393 (delta 0), reused 0 (delta 0), pack-reused 8393
Receiving objects: 100% (8393/8393), 2.54 MiB | 0 bytes/s, done.
Resolving deltas: 100% (5611/5611), done.
```

\# Change directory to `p2pool-vtc`  
`pi@raspberrypi:~ $ cd p2pool-vtc/`  

\# Install `requirements.txt` dependencies  
`pi@raspberrypi:~/p2pool-vtc $ pip install -r requirements.txt`

\# Configure P2Pool  
`pi@raspberrypi:~/p2pool-vtc $ cd lyra2re-hash-python/`  
`pi@raspberrypi:~/p2pool-vtc/lyra2re-hash-python $ git submodule init`  
`pi@raspberrypi:~/p2pool-vtc/lyra2re-hash-python $ git submodule update`  
`pi@raspberrypi:~/p2pool-vtc/lyra2re-hash-python $ sudo python setup.py install`  

\# Download alternate  web frontend for P2Pool  
`pi@raspberrypi:~/p2pool-vtc/lyra2re-hash-python $ cd`  
`pi@raspberrypi:~ $ git clone https://github.com/hardcpp/P2PoolExtendedFrontEnd.git`  
`pi@raspberrypi:~ $ cd P2PoolExtendedFrontEnd`  

\# Move all files in `P2PoolExtendedFrontEnd` to the `web-static` folder in `p2pool-vtc`  
`pi@raspberrypi:~/P2PoolExtendedFrontEnd $ mv * /home/pi/p2pool-vtc/web-static/`  
`pi@raspberrypi:~/P2PoolExtendedFrontEnd $ cd`  

\# Clean up  
`pi@raspberrypi:~ $ sudo rm -r P2PoolExtendedFrontEnd/`


#### Network 1 - Firewall Configuration  
> If you are a smaller miner with 2 graphics cards or less or are using your CPU, it is recommended to use Network 2. If you are a larger miner with multiple cards and/or a hash rate larger than 100Mh, it is recommended to use Network 1.

\# Escalate to `root`  
`pi@raspberrypi:~ $ sudo su`  
`root@raspberrypi:/home/pi# ufw allow 9346 comment 'allow --network 1 p2p port'`  
`root@raspberrypi:/home/pi# ufw allow 9171 comment 'allow --network 1 mining port'`  

\# Give up `root`  
`root@raspberrypi:/home/pi# exit`

#### Network 2 - Firewall Configuration  
> If you are a smaller miner with 2 graphics cards or less or are using your CPU, it is recommended to use Network 2. If you are a larger miner with multiple cards and/or a hash rate larger than 100Mh, it is recommended to use Network 1.

\# Escalate to `root`  
`pi@raspberrypi:~ $ sudo su`  
`root@raspberrypi:/home/pi# ufw allow 9347 comment 'allow --network 2 p2p port'`  
`root@raspberrypi:/home/pi# ufw allow 9181 comment 'allow --network 2 mining port'`  

\# Give up `root`  
`root@raspberrypi:/home/pi# exit`  

#### Setup P2Pool bash script for execution on reboot  
`pi@raspberrypi:~ $ nano start-p2pool.sh`  
```
NOTE: If you want to allow for merged mining please replace python run_p2pool.py --net vertcoin with this:
python run_p2pool.py --net vertcoin --merged http://unitusnode:yourreallysecureRPCpasswordhere@127.0.0.1:6699
```
```
#!/bin/bash
#
# run p2pool with pre-configured settings
#
# network 1 = --net vertcoin
# network 2 = --net vertcoin2
#
cd p2pool-vtc
python run_p2pool.py --net vertcoin

# !!! NOTE: If you want to allow for merged mining please replace python run_p2pool.py --net vertcoin with this
# python run_p2pool.py --net vertcoin --merged http://unitusnode:yourreallysecureRPCpasswordhere@127.0.0.1:6699
```

\# Give execute privileges to `start-p2pool.sh`  
`pi@raspberrypi:~ $ chmod +x start-p2pool.sh`  

\# Configure `crontab` file to execute `start-p2pool.sh` on reboot  
`pi@raspberrypi:~ $ crontab -u pi -e`  
```
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
# m h  dom mon dow   command

@reboot vertcoind
# Uncomment the line to enable.
#@reboot unitusd 

# This is optional, this can cause for an annoying execution of a resource heavy 
# application on load while troubleshooting an issue. Just be mindful that crontab
# is setup this way if you choose to use it. Uncomment the line to enable.
@hourly vertcoind 
#@hourly unitusd

# sleep 15 minutes then start p2pool, allow for blockchain(s) to load first
@reboot sleep 120; /home/pi/start-p2pool.sh
```
`Note:` Running P2Pool 2 minutes after reboot allows the Raspberry Pi resources and time to verify, load the `vertcoin` blockchain and catch up if needed.

\# Display output of P2Pool's `debug` log; `ctrl+c` to stop  
`pi@raspberrypi:~ $ tailf p2pool-vtc/data/vertcoin/log`

#### Documentation
`https://github.com/vertcoin-project/p2pool-vtc`  
`https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md`  

## `* EXPIRMENTAL:` Setup Unitus Full Node for merged mining with p2pool-vtc

#### Stability issues have been experienced using locally compiled binaries when syncing to the blockchain. An `armhf` release is prefered over compiling from source. 

A `Unitus` full node may be setup to allow for merged mining rewards when mining with `p2pool-vtc`. Running two full nodes together on the same Raspberry Pi will mean that you will be storing two blockchains on your USB Flash Drive rather than one, and you will be using more resources on load and at idle. 

#### `NOTE:` This section will require compiling `unitus` from source, this is a memory intensive process and can take up to ~2 hours and 30 minutes to compile everything 

\# Install `bitcoin` dependencies `https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md`  
`pi@raspberrypi:~ $ sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 -y`

\# Install `boost` dependencies for `bitcoin`  
`pi@raspberrypi:~ $ sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y`
 
\# Install dependencies for `unitus`  
`pi@raspberrypi:~ $ sudo apt-get install libminiupnpc-dev libzmq3-dev -y`  

\# Clone `unitusdev` repository into `/home/pi/`  `https://github.com/unitusdev/unitus`  
`pi@raspberrypi:~ $ git clone https://github.com/unitusdev/unitus.git`  

\# Download Berkley database, build from source and install
```
# Download and configure BerkleyDB
pi@raspberrypi:~ $ wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
pi@raspberrypi:~ $ tar -xzvf db-4.8.30.NC.tar.gz
pi@raspberrypi:~ $ cd db-4.8.30.NC/build_unix/
pi@raspberrypi:~/db-4.8.30.NC/build_unix $ ../dist/configure --enable-cxx

# This will take ~10 minutes on the RPi3
pi@raspberrypi:~/db-4.8.30.NC/build_unix $ make -j4

# Compile and install BerkleyDB
pi@raspberrypi:~/db-4.8.30.NC/build_unix $ sudo make install

# Change directories to the cloned git repo in home
pi@raspberrypi:~/db-4.8.30.NC/build_unix $ cd
```
\# Download and build `arm-linux-gnueabihf` compiler from source so we can compile `ARM` compatible binaries
```
# Download and install arm-linux-gnueabihf ; This will take ~20 minutes on the RPi3
pi@raspberrypi:~ $ cd unitus/
pi@raspberrypi:~/unitus $ cd depends
pi@raspberrypi:~/unitus/depends $ make HOST=arm-linux-gnueabihf NO_QT=1
pi@raspberrypi:~/unitus/depends $ cd ..
```
\# Configure `unitus` source and build

```
# Run the autogen.sh to allow for ./configure
pi@raspberrypi:~/unitus $ ./autogen.sh

# Configure without GUI, use only static libraries, and minimize memory usage for building 
./configure --without-gui --with-incompatible-bdb --disable-shared --prefix=$PWD/depends/arm-linux-gnueabihf --enable-glibc-back-compat --enable-reduce-exports LDFLAGS=-static-libstdc++ CXXFLAGS="--param ggc-min-expand=1 --param ggc-min-heapsize=32768"

# Compile ; This will take ~1 hour 20 minutes to compile on the RPi3
pi@raspberrypi:~/unitus $ sudo make clean && make

# Copy unitus tools to /usr/bin/ 
pi@raspberrypi:~/unitus $ cd src
pi@raspberrypi:~/unitus/src $ sudo cp unitusd unitus-cli unitus-tx /usr/bin/

# Copy unitus tools to USB Flash Drive to avoid having to compile this again
pi@raspberrypi:~/unitus/src $ sudo cp unitusd unitus-cli unitus-tx /mnt/
```

\# Change directory to `/mnt/`  
`pi@raspberrypi:~ $ cd /mnt/`

\# Create a directory for Unitus Core  
`pi@raspberrypi:/mnt $ sudo mkdir unitus`  

\# Change to the `unitus` directory  
`pi@raspberrypi:/mnt $ cd unitus`  

\# Create `unitus.conf` for Unitus Core   
`pi@raspberrypi:/mnt/vertcoin $ sudo nano unitus.conf`
```
# merged mining values documentation
# https://cdn.discordapp.com/attachments/370500771168518155/415547042807676929/Merged-Mining_Guide.pdf
server=1
rpcuser=unitusnode
rpcpassword=yoursecurepasswordgoeshere
rpcport=6699
rpcallowip=127.0.0.1
algo=lyra2re2

# makes client run in background
daemon=1

# https://jlopp.github.io/bitcoin-core-config-generator/ lopp.net optimizations
dbcache=100
maxorphantx=10
maxmempool=50
maxconnections=40
maxuploadtarget=5000
```  
`ctrl+x` to save  

`* OPTIONAL: A quick and easy way to generate a random password is taking the md5sum of a file`  
```
pi@raspberrypi:/mnt/unitus $ touch randomfilename
pi@raspberrypi:/mnt/unitus $ md5sum randomfilename
d41d8cd98f00b204e9800998ecf8427e  randomfilename

# Clean up 
pi@raspberrypi:/mnt/unitus $ rm randomfilename
```   

\# Change directory back home  
```
pi@raspberrypi:/mnt/unitus $ cd
pi@raspberrypi:~ $ pwd
/home/pi
```  
 \# Create soft link (symbolic link) connecting `/mnt/unitus/` <---> `/home/pi/.unitus`  
`pi@raspberrypi:~ $ sudo ln -s /mnt/unitus/ /home/pi/.unitus`  

\# List all files in home  
```
pi@raspberrypi:~ $ ls -a
.   .bash_history  .bashrc  db-4.8.30.NC         .nano     .selected_editor  .vertcoin
..  .bash_logout   .config  db-4.8.30.NC.tar.gz  .profile  .unitus           .wget-hsts
```  
\# List files in `/home/pi/.unitus`, confirm our configuration file `unitus.conf` is there  
```
pi@raspberrypi:~ $ ls .unitus
unitus.conf
```  

\# `poweroff` the Raspberry Pi so we can copy the Unitus blockchain over to the USB Flash Drive
```
pi@raspberrypi:~ $ vertcoin-cli stop
pi@raspberrypi:~ $ sudo poweroff
```

##### Copy Unitus Blockchain to USB Flash Drive
Once the Raspberry Pi is powered off unplug the micro USB power cable from it, then remove the USB Flash Drive from the Pi and insert it into the computer that you synced Unitus Core on. When Unitus Core is finished syncing the blockchain please navigate to the data directory for Unitus.

`Default Windows Directory (Unitus): C:\Users\%USER%\AppData\Roaming\Unitus`

Copy the folders `blocks` and `chainstate` to the `unitus` folder on your USB Flash Drive. This will allow us to side-load the Unitus blockchain and bootstrap faster than if we had the Raspberry Pi do all the work. Once you have copied the `blocks` and `chainstate` folders for Unitus to the `unitus` folder on the USB Flash Drive please safely remove it as to make sure we do not corrupt the drive. 

Place the USB Flash Drive back into the Raspberry Pi and plug the micro USB cable back into the Raspberry Pi. It will begin to boot, return to your `ssh` command window

\# Wait a minute, then log back in via `SSH`   
`ssh 192.168.1.2 -l pi`

\# Confirm the Unitus blockchain is in `/home/pi/.unitus`  
```
pi@raspberrypi:~ $ ls .unitus
blocks  chainstate  unitus.conf
```  

#### Edit `crontab` file to start Unitus hourly and on reboot to ensure the process is alive
Here we will configure the crontab file to start vertcoind as a daemon on reboot and on each hour to ensure vertcoind always has a process thats alive. If vertcoind is already running when the hourly crontab executes it will simply fail to spawn a new process.

\# Configure crontab file to start `unitusd` hourly and on reboot
`pi@raspberrypi:~ $ crontab -u pi -e`  
```
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command

@reboot vertcoind
@reboot unitusd

# This is optional, this can cause for an annoying execution of a resource heavy 
# application on load while troubleshooting an issue. Just be mindful that crontab
# is setup this way if you choose to use it. Uncomment line to enable.
#@hourly vertcoind
#@hourly unitusd


```
`ctrl+x` to save

\# Clean up  
`pi@raspberrypi:~ $ sudo rm -r db-4.8.30.NC db-4.8.30.NC.tar.gz unitus` 

\# Reboot and allow `crontab` to execute `unitusd` and `vertcoind`  
`pi@raspberrypi:~ $ sudo reboot`

\# Wait a minute, then log back in via `SSH`  
`ssh 192.168.1.2 -l pi`  

\# You can monitor your processes in real time with `htop` to confirm the processes spawn as expected  
`pi@raspberrypi:~ $ htop`  

#### \# Monitor the `debug.log` of `unitusd` to troubleshoot the `unitusd` process if needed.  
`pi@raspberrypi:~ $ tailf .unitus/debug.log`  

`ctrl+c` to stop

```
# Troubleshooting example:
pi@raspberrypi:~ $ tailf .unitus/debug.log
2018-04-27 02:29:02 * Using 90.0MiB for in-memory UTXO set (plus up to 47.7MiB of unused mempool space)
2018-04-27 02:29:02 init message: Loading block index...
2018-04-27 02:29:02 Opening LevelDB in /home/pi/.unitus/blocks/index
2018-04-27 02:29:02 Corruption: 1 missing files; e.g.: /home/pi/.unitus/blocks/index/000005.ldb
2018-04-27 02:29:02 : Error opening block database.
Please restart with -reindex or -reindex-chainstate to recover.
2018-04-27 02:29:02 Aborted block database rebuild. Exiting.
2018-04-27 02:29:02 scheduler thread interrupt
2018-04-27 02:29:02 Shutdown: In progress...
2018-04-27 02:29:02 Shutdown: done
```

##### Configure firewall to allow `unitus` traffic  
\# Escalate to `root` and configure `UFW`  
`pi@raspberrypi:~ $ sudo su`  
`root@raspberrypi:/home/pi# ufw allow 50603 comment 'allow unitus core'`  
`root@raspberrypi:/home/pi# ufw enable`  
`root@raspberrypi:/home/pi# ufw status`  
```
Status: active

To                         Action      From
--                         ------      ----
22                         ALLOW       192.168.1.0/24             # allow SSH from local LAN
5889                       ALLOW       Anywhere                   # allow vertcoin core
50603                      ALLOW       Anywhere                   # allow unitus core
5889 (v6)                  ALLOW       Anywhere (v6)              # allow vertcoin core
50603 (v6)                 ALLOW       Anywhere (v6)              # allow unitus core
```
\# Give up `root`  
`root@raspberrypi:/home/pi# exit`  

Open a browser window and navigate to your router page, from there you can port forward your Raspberry Pi.  
`TCP/UDP Port: 50603`  

##### This will make your node public, supporting the health of the Unitus network by keeping it decentralized and populated with one more node.

## References
`[1] How to Create Your Own Bitcoin Full Node With a Raspberry Pi http://www.raspberrypifullnode.com/`  
`[2] Jameson Lopp - Bitcoin Nodes, how many is enough? https://medium.com/@lopp/bitcoin-nodes-how-many-is-enough-9b8e8f6fd2cf`  
`[3] Bitcoin Wiki - P2Pool https://en.bitcoin.it/wiki/P2Pool`
