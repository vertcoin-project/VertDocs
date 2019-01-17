# Orange Pi One Vertcoin full node installation done using Windows

<p align="center">
  <img src="https://i.imgur.com/eJyg30C.png" width="343" height="68" />
</p>
<p align="center">
  <img src="https://i.imgur.com/o2zfEE7.jpg">
</p>

#### Why a Vertcoin Full node?
>Vertcoin is a digital currency supported by a peer-to-peer network. In order to run efficiently and effectively, it needs peers run by different people... and the more the better. [1]

>This tutorial will describe how to create a Vertcoin “full node” (a Vertcoin server that contains the full blockchain and propagates transactions throughout the Vertcoin network via peers). This system will not mine for Vertcoins... it will play its part to keep the Vertcoin peer-to-peer network healthy and strong. For a detailed explanation for why it is important to have a healthy Vertcoin peer-to-peer network, read this [article](https://medium.com/@lopp/bitcoin-nodes-how-many-is-enough-9b8e8f6fd2cf) about Bitcoin full nodes. [2]

`NOTE:` This will be a “headless” server... meaning we will not be using a GUI to configure Vertcoin or check to see how things are running. In fact, once the server is set up, you will only interact with it using command line calls over `SSH`. The idea is to have this full node be simple, low-power, with optimized memory usage and something that “just runs” in your basement, closet, etc.

#### Why a Orange Pi One?
>Orange Pi One is an inexpensive computing hardware platform that generates little heat, draws little power, and can run silently 24 hours a day without having to think about it. [1]

#### Index
1. `Parts List`
2. `Download and Sync Vertcoin Core QT *`
3. `Install Armbian Stretch`
4. `Initial Setup of Orange Pi One`
5. `Transfer Blockchain to Orange Pi One via USB Flash Drive`
6. `Transfer Blockchain to Orange Pi One via SCP, Create `vertcoin.conf` `
7. `Configure firewall to allow Vertcoin Core traffic `
8. `Configure NTP for time synchronization`  
9. `Congratulations! Thanks for doing your part and running a Vertcoin full node <3`
  

-----------------------------------------

### 1.) Parts List

| Parts                                                            | Price      | Link                                                                                                                                                                |
|------------------------------------------------------------------|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Orange Pi One w/ ABS Case, USB to DC 4.0MM - 1.7MM Power Cable   | $14.26 USD | https://www.aliexpress.com/item/Orange-Pi-One-ubuntu-linux-and-android-mini-PC-Beyond-and-Compatible-with-Raspberry-Pi-2/32603308880.html                           |
| OR															   |            |                                      											   																					  |
| Orange Pi One w/ ABS Case, 5v3A AC Adapter Power Cable           | $23.48 USD | https://www.aliexpress.com/store/product/Orange-Pi-One-SET5-Orange-Pi-One-Transparent-ABS-Case-Power-Supply-Supported-Android-Ubuntu-Debian/1553371_32642615408.html|
| FSU HDMI Cable 1.5meters                                         | $1.86 USD  | https://www.aliexpress.com/item/Slim-HDMI-Cable-Gold-Plated-Connection-1080P-with-FREE-SHIPPING-0-5m-1m-1-5m-1/32467185952.html 									  |
| Sandisk Class 10 Micro sd card 16gb w/ adapter                   | $3.51 USD  | https://www.aliexpress.com/item/Sandisk-Class-10-Micro-sd-card-128gb-SDXC-TF-cards-32gb-memory-card-64gb-Microsd-16gb/32931274476.html 							  |
| Rovtop CAT6 Flat Ethernet Cable 10meters                         | $4.99 USD  | https://www.aliexpress.com/item/Rovtop-CAT6-Flat-Ethernet-Cable-RJ45-Lan-Cable-Networking-Ethernet-Patch-Cord-for-Computer-Router-Laptop/32888345978.html 		  |
| SanDisk USB 3.0 Flash Drive 16GB (OPTIONAL)                      | $4.99 USD  | https://www.aliexpress.com/item/SanDisk-100-Original-Genuine-Ultra-Flair-USB-3-0-Flash-Drive-16GB-32GB-64GB-128GB-Pen/32808665841.html 							  |	
| Wired Keyboard (only for first boot) 							   |            |                      															  																					  |
| HDMI Compatible TV/Monitor (only for first boot)		      	   |            |																				 																					  |


-----------------------------------------

### 2.) Download and sync Vertcoin Core QT 

This step is `optional` but recommended. [Download](https://github.com/vertcoin-project/vertcoin-core/releases) the latest stable release of Vertcoin Core and launch `vertcoin-qt.exe` to begin the syncing process. I use my desktop PC to sync the blockchain first because it has better specs than a $10 Orange Pi One. The PC will sync headers, download blocks and verify blocks faster than the Orange Pi One can.

We will use this copy of the blockchain that is syncing to side-load onto our Orange Pi One later.

`Vertcoin Core Download Link: https://github.com/vertcoin-project/vertcoin-core/releases`  
`Default Windows Directory (Vertcoin): C:\Users\%USER%\AppData\Roaming\Vertcoin`  

`NOTE:` Setting up merged mining with `Unitus` has proven to be an unstable experience so far, this section is experimental and is only for those who wish to experiment with their Orange Pi One and are comfortable with troubleshooting their node and possibly breaking their node. 

If you intend on merge mining with `Unitus`, consider syncing `Unitus Core` now as well.

`Unitus Core Download Link: https://github.com/unitusdev/unitus/releases`  
`Default Windows Directory (Unitus): C:\Users\%USERS%\AppData\Roaming\Unitus`  

-----------------------------------------

### 3.) Install Armbian Stretch

>Armbian is a free operating system based on Debian, optimised for the Orange Pi One hardware. It is made by a third party and deemed safe and secure enough for this type of application.
> 
>`https://www.armbian.com/orange-pi-one/`

I recommend downloading the latest stable version of [Armbian Stretch](https://dl.armbian.com/orangepione/Debian_stretch_next.7z). 

We will utilize the software 'Win32 Disk Imager' to format and install Armbian on the MicroSD card. Please follow the [guide](https://www.raspberrypi.org/documentation/installation/installing-images/windows.md) below for details on installing the Armbian image to the MicroSD card. You will notice the website is for Rasberry Pi, but the steps will work the same on an Orange Pi One.

![Write](https://i.imgur.com/fTyqpat.png)  
![Writing...](https://i.imgur.com/DrGi0mb.png)  
![Done](https://i.imgur.com/cfUjvKR.png)

`Raspberry Pi - Installing Operating System Images Using Windows: https://www.raspberrypi.org/documentation/installation/installing-images/windows.md`

Once Win32 Disk Imager is finished writing to the MicroSD card please have your HDMI compatible TV/Monitor, HDMI cord, wired keyboard, and Orange Pi One at the ready. Please safely remove the USB Card Reader / MicroSD card as to ensure the data is not corrupted.

Upon first boot, you will need HDMI and keyboard access in order to enable SSH server access, after enabling SSH, you will never again need HDMI or keyboard.

`Win32 Disk Imager Documentation: https://www.raspberrypi.org/documentation/installation/installing-images/windows.md`

-----------------------------------------

### 4.) Initial Setup of Orange Pi One

Insert the MicroSD card that was safely removed into the slot located on the side of the Orange Pi One. Connect an HDMI cable to the Orange Pi One to an HDMI tv/monitor and a keyboard to the Pi as well. When you are ready to power on the Orange Pi One, plug the power supply in and the Orange Pi One will immediately begin to boot.

Upon boot you will be presented with a login screen, enter `root` as the username and `1234` as the password.

Once successfully logged in, run the command `armbian-config` and you will be promtped with a CLI program. Use the arrow and enter keys to navigate the menus.

If you wish to enable DHCP (have a dynamic IP/assigned at random) follow these steps, although it is recommended to configure a static IP and follow the "Configure a Static IP" step.

To enable DHCP/dynamic IP, with the armbian-config program loaded, proceed to `Network` and select `IP` and then select `DHCP`.

To Configure a Static IP, with the armbian-config program loaded, proceed to `Network` and select `IP` and then select `Static`. You will need to know what subnet you are on (if you don't know it is most like 192.168.1.0) mask (255.255.255.0) and desired IP address. You can figure this out by logging into your router.

After making these changes, reboot the Orange Pi One by typing `reboot`.

After reboot, type `ifconfig` and look for the IP address that you entered in the 'eth0' interface. If it is correct, then you can continue, otherwise go back and re-do the steps to see what you did wrong.

Type `armbian-config` again but this time select `Personal` and configure all of the options except for `Mirror` and `Welcome`.

Afterwards, go back to the main menu and select `System` and then `SSH` and make sure `Permit root login` is unchecked, `PasswordAuthentication` and is checked, then hit `Save`.

You can exit out of the `armbian-config` program to be promtped with the terminal screen.

We are now going to change the root user password from the default `1234` as it is insecure. (we can disable the root account later on)

Run the command `passwd` and enter the current passowrd and the new password.

Now, we are going to make a user account so we no longer use the root account.

Run the command `useradd -m DESIREDUSERNAME`.

Set a password for the new user by running the command `passwd DESIREDUSERNAME`.

Then run this command to set up bash on the new user `chsh -s /bin/bash DESIREDUSERNAME`.

Now let's update the system by running `apt update && apt upgrade`. This may take a little while.

Afterwards, run the commnd `sudo apt install sudo`.

Now run the command `usermod -aG sudo DESIREDUSERNAME`.

Run this command to install a text file editor as we will need to edit a file, `apt install nano`

Then run this command `nano /etc/sudoers` and look for a line like so `%sudo ALL=(ALL:ALL) ALL` if it appears like that then all is good, if there is a comment or no % then remove the comment and/or add $.

Once it completes, reboot the machine.

We are now going to try to SSH into the Orange Pi from another machine using the new user we just created.

I like to use `Git Bash` which is included in the Windows [download](https://git-scm.com/downloads) of `Git`.

`Git download link: https://git-scm.com/downloads`  

Open a web browser page and navigate to your router page and identify the `IP` address of the freshly powered on Orange PI One. In my case the `IP` address is `192.168.1.2`, please make note of your Orange Pi One's `IP` address as we will need to use it to login via `SSH`.  

\# Open `Git Bash` and ...
`~ $ ssh 192.168.1.2@DESIREDUSERNAME`  

Test that you have sudo access with `sudo apt update`.

If you can SSH and have sudo access, you can finally unplug the HDMI and keyboard cables on your Orange Pi One and do any future configurations via SSH.


\# Install `bitcoin` dependencies 
```
Bitcoin Unix Build Notes: https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md
```  
`pi@armbian:~ $ sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 -y`  


\# Download latest stable version of vertcoin-core for `ARM` architecture to Orange Pi  
`pi@armbian:~ $ wget https://github.com/vertcoin-project/vertcoin-core/releases/download/0.13.2/vertcoind-v0.13.2-linux-armhf.zip`  

\# Unzip `vertcoind-v0.13.0-linux-armhf.zip`  
```
pi@armbian:~ $ unzip vertcoind-v0.13.0-linux-armhf.zip
Archive:  vertcoind-v0.13.0-linux-armhf.zip
  inflating: vertcoin-cli
  inflating: vertcoind
  inflating: vertcoin-tx
```  
\# Remove `vertcoind-v0.13.0-linux-armhf.zip`  
`pi@armbian:~ $ rm *.zip`  

\# Give privileges to `vertcoin` binaries  
`pi@armbian:~ $ chmod +x vertcoin*`


-----------------------------------------

### 5.) Transfer Blockchain to Orange Pi One via USB Flash Drive

>The Vertcoin blockchain is about 4.4GB today (1/8/2019) which means that a 16GB microSD/USB flash drive will have more than enough space to store everything we need, but you can easily future proof with a 128GB microSD/Flash Drive.

It is best practice to run Vertcoin QT on your Windows (or macOS/Linux) machine and sync the full blockchain and then copy that data over to a spare flash drive.

You can either transfer the fully synced blockchain to your Orange Pi using a USB flash drive, or via SCP (mentioned below).

Unfortunately, the Orange Pi One is not able to automount drives (at least not fesaible enough for this tutorial). So if you wish to run the blockchain off of a flash drive, you can do so, but you will need to manually unplug/plug in the flash drive every time the Orange Pi One reboots. I recommend to follow the Rasberry Pi guide to learn how to do this, the steps are the same for the Orange Pi One.

Vertcoin transaction and block sizes are not very large and so the blockchain can be run off the microSD without negative performance or life span to the microSD card. This is not the case for Bitcoin or Litecoin.

After fully syncing the blockchain on your PC, insert the flash drive into the host, type in `%AppData%` in the file explorer and copy the `Vertcoin` folder onto the flash drive. Afterwards, safely remove the drive.

Please insert the USB Flash Drive into the Orange Pi One. 

\# Find your USB Flash Drive  
```
pi@armbian:~ $ sudo blkid
/dev/mmcblk0p1: LABEL="boot" UUID="5DB0-971B" TYPE="vfat" PARTUUID="efbdd15e-01"
/dev/mmcblk0p2: LABEL="rootfs" UUID="060b57a8-62bd-4d48-a471-0d28466d1fbb" TYPE="ext4" PARTUUID="efbdd15e-02"
/dev/mmcblk0: PTUUID="efbdd15e" PTTYPE="dos"
/dev/sda1: UUID="0DC965316518EB7C" TYPE="fat32" PARTUUID="00e3d476-01"
```  
My USB device appears as `/dev/sda1` which shows a filesystem type of `fat32`, your device may be listed differently. Please take note of the `/dev/*` information that identifies your USB Flash Drive.  

\# Mount USB Flash Drive to mount point   
`pi@armbian:~ $ sudo mount /dev/sda1 /mnt`  

If /mnt does not exist on your system for some reason, run the command `sudo mkdir /mnt` and re-run the above command.

-----------------------------------------

### 6.) Transfer Blockchain to Orange Pi One via SCP, Create `vertcoin.conf` 

>WinSCP (Windows Secure Copy) is a free and open-source SFTP, FTP, WebDAV, Amazon S3 and SCP client for Microsoft Windows. Its main function is secure file transfer between a local and a remote computer. Beyond this, WinSCP offers basic file manager and file synchronization functionality. For secure transfers, it uses Secure Shell (SSH) and supports the SCP protocol in addition to SFTP.

Download and install `WinSCP:` `https://winscp.net/eng/download.php`

When `Vertcoin Core` is finished syncing to the blockchain, exit `Vertcoin Core` so that it safely shuts down ensuring no data is corrupted. 

Proceed by running `WinSCP`, you will be met with a `Login` prompt asking for a Host name, Port number, User name and Password. Login to your Orange Pi One like so, please note that your Orange Pi One's `IP` address may be different than what is listed below.
```
File protocol: SFTP
Host name: 192.168.1.2
Port number: 22
User name: pi
Password: yourpasswordhere 
```
![Login](https://i.imgur.com/vWmSoWd.png)  
![Connection](https://i.imgur.com/SlDMCmN.png)  

Ensure `Optimize connection buffer size` is unchecked for an easy tansfer.

`Default Windows Directory (Vertcoin): C:\Users\%USER%\AppData\Roaming\Vertcoin`  

While logged into your Orange Pi One, create a new folder named `.vertcoin` in your root home directory, copy the folders `blocks` and `chainstate` to this folder. This will allow us to side-load the Vertcoin blockchain and bootstrap faster than if we had the Orange Pi One do all the work. 

Consider transferring the `peers.dat` file found in Vertcoin's data directory, this can help prevent failing to connect to peers during initial bootstrapping process. 

Move back over to your `SSH` session with your Orange Pi One...

\# Change directory to your `.vertcoin` folder
`pi@armbian:~ $ cd ~/.vertcoin

`NOTE:` If you plan on making your Orange Pi One just a full node please consider leaving `maxconnections` set to 30, as the more peers you connect to, the greater amount of peers you can propagate blocks to. The network benefits greatly from peers with many connections. If you plan on setting up a P2Pool the documentation below says to set `maxconnections=15` in your `vertcoin.conf` This has been done to minimize the DOA % rate and maximize share efficency on less powerful hardware like the Orange Pi One. 

```
Orange Pi One Config: 
# Set database cache size in megabytes; machines sync faster with a larger cache. Recommend 
# setting as high as possible based upon machine's available RAM
dbcache=100
# Keep at most <n> unconnectable transactions in memory
maxorphantx=10
# Keep the transaction memory pool below <n> megabytes
maxmempool=50
# Maintain at most N connections to peers
maxconnections=30  
```
\# Create and populate `vertcoin.conf` for Vertcoin Core  
`pi@armbian:~/.vertcoin $ nano vertcoin.conf`

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
# leave maxconnections at 30 for full node; 15 for full node + p2pool
maxconnections=30
maxuploadtarget=5000
```  

`ctrl+x` to save   

You should still be inside the `.vertcoin` folder. As a final step, run the below command to remove any unwanted executable bits that may have been set by Windows.

`pi@armbian:~/.vertcoin $ find . -type f -print0 | xargs -0 chmod 640`

Afterwards, run this command

`pi@armbian:~/.vertcoin $ chmod 644 vertcoin.conf`

Finally, run this command to fix permissions on the `.vertcoin` folder

`pi@armbian:~/.vertcoin $ chmod 755 ~/.vertcoin`

-----------------------------------------

#### Tuning `vertcoind` and `P2Pool`  
>The more connections, the faster your node is notified of new blocks and avoids wasting work, and the faster it can include transactions with fees in the coinbase, the faster it will propagate a P2Pool block minimizing chances it would become orphan. The less connections, the less bandwidth used and the lower the latency. `[4]`

>More than 20 for maxconnections is probably overkill. From my experience (trying various values from 6 to 100) it seems there's not much gain to have past this value (and if you don't have enough WAN bandwidth it can hurt your latencies by queuing transfers between P2Pool nodes during peaks). `[4]`

>Note that this may change in the future if the behavior of bitcoind/P2Pool network changes: when in doubt, monitor your interface(s) bandwidth usage and raise this value when most peaks are below your link capacity. `[4]`

>If your orphan rate is fine, don't tempt the devil and try tuning maxconnections below 20: you may reduce your income more than you increase it... `[4]`

You can do the same by passing parameters to `P2Pool`:
```
--max-conns 8 --outgoing-conns 4
```
>`NOTE:` Orphans will quickly rise if you have very few connections (they are the means to be notified of other shares after all). I would prefer reducing bitcoind connections before P2Pool's. `[4]`

>In my experience you can get as low as 6 total connections (3 in, 3 out) without noticeable efficiency changes. The default values seem overkill (6 outgoing, 40 incoming). The large number of incoming connections (--max-conns) is designed to help the whole network (some nodes are behind firewalls that don't allow incoming connections). You probably should allow more incoming connections (and check that your network setup allows incoming connections) to do your part in helping the network. `[4]`

`PERFORMANCE INFO:` Using the above tunings for `vertcoind` and `p2pool-vtc` reflects a 1.5% DOA rate over 14 hours of hashing with a GTX 1070 with 114% shares efficiency.

-----------------------------------------

`*OPTIONAL: A quick and easy way to generate a random password is taking the md5sum of a file`
```
pi@armbian:~/.vertcoin $ touch randomfilename
pi@rarmbian:~/.vertcoin $ md5sum randomfilename
d41d8cd98f00b204e9800998ecf8427e  randomfilename

# Clean up 
pi@armbian:~/.vertcoin $ rm randomfilename
```   

#### Setup Vertcoin Core /etc/rc.local and Crontab for auto-start on reboot  

We will configure the `/etc/rc.local` and `crontab` file to start `vertcoind` on reboot and on each hour (respectively) to ensure `vertcoind` always has a process thats alive. If `vertcoind` is already running when the hourly `crontab` executes it will simply fail to spawn a new process. 

\# Configure `/etc/rc.local` file to start `vertcoind` on reboot

`pi@armbian:~ $ sudo nano /etc/rc.local`

Add the text below at the end of the file

`su USERHERE -c '/home/USERHERE/vertcoind'
exit 0`

Now enable the rc-local systemd service

`pi@armbian:~ $ sudo systemctl enable rc-local`

\# Configure `crontab` file to start `vertcoind` hourly and on reboot  

`pi@armbian:~ $ crontab -u pi -e`
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

# This is optional, this can cause for an annoying execution of a resource heavy 
# application on load while troubleshooting an issue. Just be mindful that crontab
# is setup this way if you choose to use it. Uncomment line to enable.
#@hourly DESIREDUSER /home/USERHERE/vertcoind 
```  
`ctrl+x` to save  

\# `NOTE:` Make sure the blockchain has fully transferred to your desired location before starting `vertcoind`

\# Start the `vertcoin` daemon and begin blockchain sync  
`pi@armbian:~ $ vertcoind &`  
```
pi@armbian:~ $ vertcoind &
[1] 837
pi@armbian:~ $ tailf .vertcoin/debug.log 
2018-05-04 23:00:29 Cache configuration:
2018-05-04 23:00:29 * Using 2.0MiB for block index database
2018-05-04 23:00:29 * Using 8.0MiB for chain state database
2018-05-04 23:00:29 * Using 90.0MiB for in-memory UTXO set (plus up to 47.7MiB of unused mempool space)
2018-05-04 23:00:29 init message: Loading block index...
2018-05-04 23:00:29 Opening LevelDB in /home/pi/.vertcoin/blocks/index
2018-05-04 23:00:29 Opened LevelDB successfully
2018-05-04 23:00:29 Using obfuscation key for /home/pi/.vertcoin/blocks/index: 0000000000000000
2018-05-04 23:00:33 Checking PoW for block 720000
2018-05-04 23:00:34 Checking PoW for block 890000
2018-05-04 23:00:44 Checking PoW for block 690000
2018-05-04 23:00:44 Verifying checkpoint at height 430000
2018-05-04 23:00:47 Checking PoW for block 860000
```

### Quick note about blockchain syncing
    Vertcoin Core is now synchronizing to the side-loaded blockchain located in `/home/pi/.vertcoin`. 
    This process can take up to an hour to sync 
    headers and verify all of the downloaded blocks. Vertcoin 0.13.0 has shown major
    improvements to loading time of the blockchain and can take as little as 
    two minutes to fully load.
    
    You can monitor system resources by issuing the htop command and check up on 
    vertcoind by issuing the following commands: 
    
    # Display output of Vertcoin debug.log; ctrl+c to stop  
    pi@armbian:~ $ tailf .vertcoin/debug.log
    
    # Show blockchain information  
    pi@armbian:~ $ vertcoin-cli getblockchaininfo
    
    # Show current block  
    pi@armbian:~ $ vertcoin-cli getblockcount  

You may continue on while `vertcoind` catches up to the blockchain ...  

-----------------------------------------

### 7.) Configure firewall to allow Vertcoin Core traffic  

Please note that your `IP` range may be different than what I have listed below. If your router `IP` address is `192.168.1.1` then the instructions above require no alterations. If your `IP` address is something like `192.168.56.1` or `10.0.0.1` then you will need to modify the 'ufw allow from `192.168.1.0/24` to any port 22' to 'ufw allow from `192.168.56.0/24`(...)' or 'ufw allow from `10.0.0.0/24`(...)' respectively. 

\# Install `UFW`  
`pi@armbian:~ $ sudo apt-get install ufw`  

\# Escalate to `root` and configure `UFW`

`pi@armbian:~ $ sudo su`  
`root@armbian:/home/pi# ufw default deny incoming`  
```
Default incoming policy changed to 'deny'
(be sure to update your rules accordingly)
```
`root@armbian:/home/pi# ufw default allow outgoing`  
```
Default outgoing policy changed to 'allow'
(be sure to update your rules accordingly)
```
`root@armbian:/home/pi# ufw allow from 192.168.1.0/24 to any port 22 comment 'allow SSH from local LAN'`  
`root@armbian:/home/pi# ufw allow 5889 comment 'allow vertcoin core'`  
`root@armbian:/home/pi# ufw enable`  
```
Command may disrupt existing ssh connections. Proceed with operation (y|n)? y
Firewall is active and enabled on system startup
```  
`root@armbian:/home/pi# systemctl enable ufw`  
```
Synchronizing state of ufw.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable ufw
```
`root@armbian:/home/pi# ufw status`  
```
Status: active

To                         Action      From
--                         ------      ----
22                         ALLOW       192.168.1.0/24             # allow SSH from local LAN
5889                       ALLOW       Anywhere                   # allow vertcoin core
5889 (v6)                  ALLOW       Anywhere (v6)              # allow vertcoin core
```
\# Give up `root`  
`root@armbian:/home/pi# exit`  

Open a browser window and navigate to your router page, from there you can port forward your Orange Pi One.  
`TCP/UDP Port: 5889`  

As we are already discussing network/traffic and firewalls, if you want to limit bandwidth on your Orange Pi One you can do so with an easy to use program

\# Install `wondershaper`  
`pi@armbian:~ $ sudo apt-get install wondershaper`  

\# Limit bandwidth of eth0 to 10Mbps 

`pi@armbian:~ $ sudo wondershaper eth0 10000 10000`  

This will limit your eth0 interface to operate only at 10Mbps or 10000Kbps which is more than enough for a Vertcoin node. A bitcoin full node does not even average 10Mbps rather requires/averages around 4-6Mbps, since there is a lot less activity on Vertcoin this should be safe. [5]


#### This will make your node public, supporting the health of the Vertcoin network by keeping it decentralized and populated with one more node.

If you are an advanced usesr and want to disable the root user run the command `sudo passwd -d root` and `sudo passwd -l root`.
If you are unsuare of this, there is no need to run those commands.

-----------------------------------------


### 8.) Configure NTP for time synchronization

It is important for your node to have it's time synchorized as it helps reduce the time difference bewteen blocks and difficulty adjustments.

\# Install `ntp`
`pi@armbian:~ # sudo apt install ntp`  

\# Run ntp command. which will start start ntp now and enable it on boot
`pi@armbian:~ # sudo ntpq -p`  

\# Check if date is correct
`pi@armbian:~ # date`


-----------------------------------------

### 9.) Congratulations! Thanks for doing your part and running a Vertcoin full node <3
You have successfully setup a full Vertcoin Core node on a Orange Pi One Thank you for following along and contributing to the Vertcoin network by helping keep it populated with nodes and distributed. You help give meaning to the people's coin!
```
pi@armbian:~ $ vertcoin-cli getblockchaininfo
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
pi@armbian:~ $ vertcoin-cli getconnectioncount
14
```
-----------------------------------------



## References
`[1] How to Create Your Own Bitcoin Full Node With a Raspberry Pi http://www.raspberrypifullnode.com/`  
`[2] Jameson Lopp - Bitcoin Nodes, how many is enough? https://medium.com/@lopp/bitcoin-nodes-how-many-is-enough-9b8e8f6fd2cf`  
`[3] Bitcoin Wiki - P2Pool https://en.bitcoin.it/wiki/P2Pool`  
`[4] A guide for mining efficiently on P2Pool, includes FUD repellent and FAQ - https://bitcointalk.org/index.php?topic=153232.0`
`[5] 7 days of bandwidth usage on a full node with ~100 connections - https://www.reddit.com/r/Bitcoin/comments/5s6zak/info_7_days_of_bandwidth_usage_on_a_full_node/`
