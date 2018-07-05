# Raspberry Pi Zero W (Wireless) Vertcoin full node installation done using Windows

<p align="center">
  <img src="https://i.imgur.com/eJyg30C.png" width="343" height="68" />
</p>
<p align="center">
  <img src="https://i.imgur.com/9T0gKr7.png">
</p>

-----------------------------------

#### Why a Vertcoin Full node?
>Vertcoin is a digital currency supported by a peer-to-peer network. In order to run efficiently and effectively, it needs peers run by different people... and the more the better. [1]

>This tutorial will describe how to create a Vertcoin “full node” (a Vertcoin server that contains the full blockchain and propagates transactions throughout the Vertcoin network via peers). This system will not mine for Vertcoins... it will play its part to keep the Vertcoin peer-to-peer network healthy and strong. For a detailed explanation for why it is important to have a healthy Vertcoin peer-to-peer network, read this [article](https://medium.com/@lopp/bitcoin-nodes-how-many-is-enough-9b8e8f6fd2cf) about Bitcoin full nodes. [2]

`NOTE:` This will be a “headless” server... meaning we will not be using a GUI to configure Vertcoin or check to see how things are running. In fact, once the server is set up, you will only interact with it using command line calls over `SSH`. The idea is to have this full node be simple, low-power, with optimized memory usage and something that “just runs” in your basement, closet, etc.

#### Why a Raspberry Pi Zero?
>Raspberry Pi Zero is an inexpensive computing hardware platform that generates little heat, and draws less power than a regular Raspberry Pi, and can run silently 24 hours a day without having to think about it. [1]

#### Raspberry Pi Zero W Specifications
* 1GHz, single-core CPU
* 512MB RAM
* 802.11 b/g/n wireless LAN
* Bluetooth 4.1

#### Power Consumption
|  Pi Model |                       Pi State                       | Power Consumption |
|:---------:|:----------------------------------------------------:|:-----------------:|
|     A+    | Idle, HDMI disabled, LED disabled, USB WiFi adapter  |    160 mA (0.8W   |
|     B+    |  Idle, HDMI disabled, LED disabled, USB WiFi adapter |   220 mA (1.1W)   |
| model 2 B |  Idle, HDMI disabled, LED disabled, USB WiFi adapter |   240 mA (1.2W)   |
|    Zero   |  Idle, HDMI disabled, LED disabled, USB WiFi adapter |   120 mA (0.7W)   |

-----------------------------------

#### Parts list  
|                          Parts                         |    Price   |                                       Link                                       |
|:------------------------------------------------------:|:----------:|:--------------------------------------------------------------------------------:|
|            CanaKit Pi Zero W 8GB Starter Kit           | $29.99 USD |                   https://www.amazon.com/gp/product/B06XJQV162/                  |
|           Kingston Digital DataTraveler 16GB           |  $7.99 USD | https://www.amazon.com/Kingston-Digital-DataTraveler-DTSE9H-16GBZ/dp/B006W8U2WU/ |
| OPTIONAL: Zebra Zero Black Ice Heatsink Case by C4Labs |  $6.95 USD |                   https://www.amazon.com/gp/product/B01HP636I4/                  |

You may change the USB Flash Drive to match your preference. I **highly recommend** that a USB Flash Drive (16GB - 128GB) is paired with the Raspberry Pi Zero. 

The case in the parts list is a personal preference, it is your choice how you wish to protect your Raspberry Pi Zero. The Zebra Black Ice case was chosen for it's solid design and cut out allowing for the placement of a heatsink on the `CPU` of the Raspberry Pi Zero. 

-----------------------------------

### Table of Contents
1. Introduction
2. Initial Setup of Raspberry Pi Zero W
3. Create swap file space for Raspberry Pi 
4. Configure storage for Vertcoin
5. Transfer Blockchain to Raspberry Pi Zero W
6. Build Vertcoin Binaries 
7. Configure firewall to allow Vertcoin Core traffic 
8. Congratulations! Thanks for doing your part and running a Vertcoin full node

-----------------------------------

### 1.) Introduction

This section of the **Raspberry Pi Zero W Vertcoin full node installation guide** will walk through the steps of setting up your own Vertcoin full node on a Raspberry Pi Zero, allowing for minimal power consumption using a headless **Raspbian Stretch Lite** Linux image.

>Raspbian is a free operating system based on Debian optimized for the Raspberry Pi hardware. An operating system is the set of basic programs and utilities that make your Raspberry Pi run. However, Raspbian provides more than a pure OS: it comes with over 35,000 packages, pre-compiled software bundled in a nice format for easy installation on your Raspberry Pi.

Before you get started consider downloading and installing the latest stable release of [Vertcoin Core](https://github.com/vertcoin-project/vertcoin-core/releases) wallet onto a computer you use that is not your Raspberry Pi Zero W. This step is `*OPTIONAL` but recommended. **Doing so will speed up the process of syncing `vertcoind` later.** The Raspberry Pi Zero W has limited resources, syncing headers and downloading blocks for the Vertcoin network will take a very long time on a Raspberry Pi Zero, this is why it is **recommended** that you side-load the Vertcoin blockchain to your Raspberry Pi Zero W. 

This copy of the blockchain that is syncing to side-load onto our Raspberry Pi Zero W later.

`Vertcoin Core Download Link: https://github.com/vertcoin-project/vertcoin-core/releases`  
`Default Windows Directory (Vertcoin): C:\Users\%USER%\AppData\Roaming\Vertcoin`  

**Alternatively you may download the `bootstrap.dat` file provided by the Vertcoin developers; instructions included below. `NOTE` This option is not recommended, this will take a very long time on the Raspberry Pi Zero W**

#### Assumptions  
This guide is assumes the user is installing Raspbian Stretch Lite on an Raspberry Pi Zero W, using only `SSH` to remotely connect to their Pi on the Local Area Network after Raspbian has been installed. 

This guide also assumes the user has access to a Windows computer. If you do not have access / do not use Windows, not all steps listed below may apply to you. 

#### Download Raspbian Stretch Lite
`https://www.raspberrypi.org/downloads/raspbian/`  

We will utilize the software 'Win32 Disk Imager' to format and install Raspbian on the MicroSD card. Please follow the [guide](https://www.raspberrypi.org/documentation/installation/installing-images/windows.md) below for details on installing the Rasbian image to the MicroSD card.

![Write](https://i.imgur.com/fTyqpat.png)  
![Writing...](https://i.imgur.com/DrGi0mb.png)  
![Done](https://i.imgur.com/cfUjvKR.png)

`Raspberry Pi - Installing Operating System Images Using Windows: https://www.raspberrypi.org/documentation/installation/installing-images/windows.md`

Once Win32 Disk Imager is finished writing to the MicroSD card please access the 'boot' partition of the MicroSD card with Windows Explorer `Win+E`. Create a new empty text file named `ssh` like so...

![MicroSD card - ssh](https://i.imgur.com/m14rGdV.png)  
This enables `SSH` access on the Raspberry Pi Zero W's first boot sequence. 

### How to enable wireless connection on boot if hard wiring is not available

Create another new text file named `wpa_supplicant.conf` that will hold the network info...

Edit the file that you just created adjusting for the name of your country code, network name and network password.

```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="NETWORK-NAME"
    psk="NETWORK-PASSWORD"
}
```

Please safely remove the USB Card Reader / MicroSD card as to ensure the data is not corrupted.

Insert the MicroSD card that was safely removed into the microSD slot the Raspberry Pi Zero W. Connect the OTG microUSB to USB cable included with the CanaKit to the Raspberry Pi Zero W. Connect your USB Flash Drive to the OTG cable. When you are ready to power on the Pi, plug the power supply in and the Raspberry Pi Zero W will immediately begin to boot, once the Pi has booted it will attempt to join the wireless network using the information provided in the `wpa_supplicant.conf` file.

-----------------------------------

### 2.) Initial Setup of Raspberry Pi Zero

We will access our Raspberry Pi Zero through an `SSH` session on our Windows PC. I like to use `Git Bash` which is included in the Windows [download](https://git-scm.com/downloads) of `Git`.

`Git download link: https://git-scm.com/downloads`  

Open a web browser page and navigate to your router page and identify the `IP` address of the freshly powered on Raspberry Pi. In my case the `IP` address is `192.168.1.11`, please make note of your Raspberry Pi Zero's `IP` address as we will need to use it to login via `SSH`.  

\# Open `Git Bash` and ...  
`~ $ ssh 192.168.1.11 -l pi`  

`default password: raspberry`  

\# Download and install latest system updates   
`pi@raspberrypi:~ $ sudo apt-get update ; sudo apt-get upgrade -y`  

\# Remove orphaned packages and clean `apt`    
`pi@raspberrypi:~ $ sudo apt-get autoremove ; sudo apt-get autoclean`  

\# Download and install dependencies for building bitcoin & useful software packages  
`sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libdb++-dev git fail2ban ufw`  

```
Bitcoin Unix Build Notes: https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md
```  

>`Fail2ban` is a daemon that can be run on your server to dynamically block clients that fail to authenticate correctly with your services repeatedly. This can help mitigate the affect of brute force attacks and illegitimate users of your services like `SSH`.  
```
Fail2ban Documentation: https://www.digitalocean.com/community/tutorials/how-fail2ban-works-to-protect-services-on-a-linux-server`
```

\# Initiate `raspi-config` script  
`pi@raspberrypi:~ $ sudo raspi-config`

```
1.) [8] Update					# update raspi-config script first
2.) [1] Change User Password			# change password for current user
3.) [4] Localization Options			#
	> [I2] Change Timezone			# set your timezone
4.) [7] Advanced Options			#
	> [A1] Expand Filesystem		# expand filesystem 
```
`<Finish>` and choose to reboot.

\# Wait a minute, then log back in via `SSH`  
`ssh 192.168.1.11 -l pi`  

>The Vertcoin blockchain is about `4GB`, which means that a `16GB` USB Flash Drive will have more than enough space to store everything we need, but you can easily future proof with a `128GB` USB Flash Drive.  

Insert the USB Flash Drive into your Raspberry Pi Zero W with the supplied OTG cable in the CanaKit. You may need to provide your own solution.

**MicroUSB to USB solutions**  

Micro USB OTG Cable
* `https://www.amazon.com/OTG-Cable-Micro-Power-Charge/dp/B071R8YXDP/`

Micro USB to RJ45 Ethernet LAN & USB Hub
* `https://www.amazon.com/Smays-Ethernet-compatible-Raspbian-Raspberry/dp/B00L32UUJK/`

This USB Flash Drive will contain our Vertcoin data directory as well as our `swap` space file. We will give the Raspberry Pi Zero W some extra memory to work with we will ensure a `swap` file large enough to handle the memory demand to bootstrap the blockchain and build the Vertcoin binaries from source. 

**It is worth mentioning that constantly writing data to the MicroSD card can be damaging, in this guide we will configure the swap file to reside off of the card.**

We will format the USB Flash Drive as an `ext4` filesystem, mount the USB Flash Drive to the Raspberry Pi and configure the device to auto-mount on reboot ensuring the blockchain stays accessible to the `Vertcoin` daemon after reboots.

\# Find your USB Flash Drive  
```
pi@raspberrypi:~ $ sudo blkid
/dev/mmcblk0p1: LABEL="boot" UUID="5DB0-971B" TYPE="vfat" PARTUUID="efbdd15e-01"
/dev/mmcblk0p2: LABEL="rootfs" UUID="060b57a8-62bd-4d48-a471-0d28466d1fbb" TYPE="ext4" PARTUUID="efbdd15e-02"
/dev/mmcblk0: PTUUID="efbdd15e" PTTYPE="dos"
/dev/sda1: UUID="0DC965316518EB7C" TYPE="fat32" PARTUUID="00e3d476-01"
```  
My USB device appears as `/dev/sda1` which shows a filesystem type of `fat32`, your device may be listed differently. Please take note of the `/dev/*` information that identifies your USB Flash Drive.  

\# Format the USB Flash Drive as `ext4` filesystem   
`pi@raspberrypi:~ $ sudo mkfs.ext4 /dev/sda1 -L untitled`  
```
mke2fs 1.43.4 (31-Jan-2017)
/dev/sda1 contains a fat32 file system
	last mounted on /mnt on Thu Apr 19 22:06:19 2018
Proceed anyway? (y,N) y
Creating filesystem with 732566272 4k blocks and 183148544 inodes
Filesystem UUID: 9f4ea777-a963-49ce-a9f9-37860021d621
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
	4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, 
	102400000, 214990848, 512000000, 550731776, 644972544

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (262144 blocks): done
Writing superblocks and filesystem accounting information: done       
```  

\# Mount USB Flash Drive to mount point   
`pi@raspberrypi:~ $ sudo mount /dev/sda1 /mnt`  

\# Setup `fstab` file to auto-mount the USB Flash Drive on reboot  
`pi@raspberrypi:~ $ sudo nano /etc/fstab` 
```
proc            /proc           proc    defaults          0       0
PARTUUID=efbdd15e-01  /boot           vfat    defaults          0       2
PARTUUID=efbdd15e-02  /               ext4    defaults,noatime  0       1

# replace /dev/sda1 with your USB device, [tab] between each value
/dev/sda1       /mnt    ext4    defaults        0       0

# a swapfile is not a swap partition, no line here
#   use  dphys-swapfile swap[on|off]  for that
```
`ctrl+x` to save

-----------------------------------

### 3.) Create swap file space for Raspberry Pi

>Swap space in Linux is used when the amount of physical memory (RAM) is full. If the system needs more memory resources and the RAM is full, inactive pages in memory are moved to the swap space. While swap space can help machines with a small amount of RAM, it should not be considered a replacement for more RAM. Swap space is located on hard drives, which have a slower access time than physical memory.  
`https://www.centos.org/docs/5/html/5.2/Deployment_Guide/s1-swap-what-is.html`

Ensure that `dphys-swapfile` is installed and configured to save the swap file in `/mnt/swap`, allocate `2048 MB` of swap file space. You can choose a smaller amount of space for a swap file, I would not recommend going lower than `1024 MB`.  

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
CONF_SWAPSIZE=2048

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

We will configure the `crontab` file to start `vertcoind` on reboot to ensure `vertcoind` stays alive through power cycles.

\# Configure `crontab` file to start `vertcoind` on reboot  

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

```  
`ctrl+x` to save  

-----------------------------------

### 4.) Configure storage for Vertcoin 

\# Edit permissions to allow for user write access on /mnt/, create vertcoin folder to house the blockchain  
`pi@raspberrypi:~ $ sudo chmod -R 777 /mnt/`  
`pi@raspberrypi:~ $ cd /mnt/ ; mkdir vertcoin`  
```
pi@raspberrypi:/mnt $ ls
lost+found  swap  vertcoin
```

\# Change directories back home and symlink /mnt/vertcoin/ and ~/.vertcoin together  
`pi@raspberrypi:/mnt $ cd`  
`pi@raspberrypi:~ $ sudo ln -s /mnt/vertcoin/ /home/pi/.vertcoin`  


-----------------------------------

### 5.) Transfer Blockchain to Raspberry Pi Zero W

**`*OPTIONAL` If you wish to instead sync `vertcoind` with the `bootstrap.dat` file provided by the Vertcoin developers, follow the instructions below and skip the process involving WinSCP.** 
```
nuc@nuc:~$ cd .vertcoin/
nuc@nuc:~/.vertcoin$ wget "http://alwayshashing.com/downloads/bootstrap.dat"
--2018-06-08 00:46:00--  http://alwayshashing.com/downloads/bootstrap.dat
Resolving alwayshashing.com (alwayshashing.com)... 198.20.67.78
Connecting to alwayshashing.com (alwayshashing.com)|198.20.67.78|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1778068656 (1.7G)
Saving to: ‘bootstrap.dat’

bootstrap.dat                 2%[>                                            ]  35.25M  2.18MB/s    
eta 15m 53s
```

Once the `bootstrap.dat` file has finished please move on to step 5

-----------------------------------
>WinSCP (Windows Secure Copy) is a free and open-source SFTP, FTP, WebDAV, Amazon S3 and SCP client for Microsoft Windows. Its main function is secure file transfer between a local and a remote computer. Beyond this, WinSCP offers basic file manager and file synchronization functionality. For secure transfers, it uses Secure Shell (SSH) and supports the SCP protocol in addition to SFTP.

Download and install `WinSCP:` `https://winscp.net/eng/download.php`

When `Vertcoin Core` is finished syncing to the blockchain, exit `Vertcoin Core` so that it safely shuts down ensuring no data is corrupted. 

Proceed by running `WinSCP`, you will be met with a `Login` prompt asking for a Host name, Port number, User name and Password. Login to your mining rig like so, please note that your miner's `IP` address may be different than what is listed below.
```
File protocol: SFTP
Host name: 192.168.1.11
Port number: 22
User name: pi 
Password: yourpasswordhere
```
![Login](https://i.imgur.com/vWmSoWd.png)  
![Connection](https://i.imgur.com/SlDMCmN.png)  

Ensure `Optimize connection buffer size` is unchecked for an easy tansfer.

`Default Windows Directory (Vertcoin): C:\Users\%USER%\AppData\Roaming\Vertcoin`  

While logged into your Raspberry Pi, create a new folder named `vertcoin` on your USB Flash Drive, copy the folders `blocks` and `chainstate` to the `/mnt/vertcoin` folder on your USB Flash Drive. This will allow us to side-load the Vertcoin blockchain and bootstrap faster than if we had the Raspberry Pi Zero W do all the work. 

![Transfer](https://i.imgur.com/VC7DpDa.png)

Move back over to your `SSH` session with your Raspberry Pi Zero W...

\# Change directory to `/mnt/vertcoin`  
`pi@raspberrypi:~ $ cd /mnt/vertcoin`

`NOTE:` If you plan on making your Raspberry Pi Zero W a full node please consider leaving `maxconnections` set to 40, as the more peers you connect to, the greater amount of peers you can propagate blocks to. The network benefits greatly from peers with many connections. 
```
Raspberry Pi Configuration: 
# Set database cache size in megabytes; machines sync faster with a larger cache. Recommend 
# setting as high as possible based upon machine's available RAM
dbcache=100

# Keep at most <n> unconnectable transactions in memory
maxorphantx=10

# Keep the transaction memory pool below <n> megabytes
maxmempool=50

Low Bandwidth Usage Configuration: 
# Maintain at most N connections to peers
maxconnections=20  

# Tries to keep outbound traffic under the given target (in MiB per 24h), 0 = no limit  
maxuploadtarget=500  
```

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

-----------------------------------
### 6.) Build Vertcoin Binaries 

\# Clone the Vertcoin-Core github repository   
`pi@raspberrypi:~ $ git clone https://github.com/vertcoin-project/vertcoin-core.git`  
```
Cloning into 'vertcoin-core'...
remote: Counting objects: 107517, done.
remote: Compressing objects: 100% (33/33), done.
Receiving objects:   2% (2151/107517), 712.01 KiB | 702.00 KiB/s
```

\# Change directories to vertcoin-core and configure for building  
`pi@raspberrypi:~ $ cd vertcoin-core/`  
`pi@raspberrypi:~/vertcoin-core $ ./autogen.sh`  

\# Configure with disabled wallet and conserve memory usage   
`pi@raspberrypi:~/vertcoin-core $ ./configure --disable-wallet CXXFLAGS="--param ggc-min-expand=1 --param ggc-min-heapsize=32768"`  
```
Options used to compile and link:
  with wallet   = no
  with gui / qt = no
  with sse2     = no
  with zmq      = no
  with test     = yes
  with bench    = yes
  with upnp     = auto
  use asm       = yes
  debug enabled = no
  werror        = no

  target os     = linux
  build os      =

  CC            = gcc
  CFLAGS        = -g -O2 -fPIC
  CPPFLAGS      =  -DHAVE_BUILD_INFO -D__STDC_FORMAT_MACROS -D_FILE_OFFSET_BITS=64
  CXX           = g++ -std=c++11
  CXXFLAGS      = --param ggc-min-expand=1 --param ggc-min-heapsize=32768
  LDFLAGS       =
  ARFLAGS       = cr
```

Compiling the Vertcoin binaries will take a few hours. Please be patient, this is currently the best way to run Vertcoin on a Raspberry Pi Zero. Pre-compiled binaries give `segmentation fault` errors. 

This will be a very CPU intensive task for your Raspberry Pi Zero, it is **HIGHLY RECOMMENDED** that you supply your Pi Zero with a heatsink. The CPU will be utilized at 100% for a number of hours, a heatsink dissipating heat is very beneficial to the long term health of the hardware. 

\# Compile vertcoin-core binaries  
`pi@raspberrypi:~/vertcoin-core $ make`  
```
Making all in src
make[1]: Entering directory '/home/pi/vertcoin-core/src'
make[2]: Entering directory '/home/pi/vertcoin-core/src'
(...)
make[2]: Leaving directory '/home/pi/vertcoin-core/src'
make[1]: Leaving directory '/home/pi/vertcoin-core/src'
Making all in doc/man
make[1]: Entering directory '/home/pi/vertcoin-core/doc/man'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/home/pi/vertcoin-core/doc/man'
make[1]: Entering directory '/home/pi/vertcoin-core'
make[1]: Nothing to be done for 'all-am'.
make[1]: Leaving directory '/home/pi/vertcoin-core'
pi@raspberrypi:~/vertcoin-core$
```

\# Copy the successfully compiled binaries to `/usr/bin`  
`pi@raspberrypi:~/vertcoin-core $ cd src/`  
`pi@raspberrypi:~/vertcoin-core/src $ sudo cp vertcoin-cli vertcoind vertcoin-tx /usr/bin/`  
`pi@raspberrypi:~/vertcoin-core/src $ cd`

\# `NOTE:` Make sure the blockchain has fully transferred to `/mnt/vertcoin` before starting `vertcoind`

\# Start the `vertcoin` daemon and begin blockchain sync  
`pi@raspberrypi:~ $ vertcoind &`  
```
pi@raspberrypi:~ $ vertcoind &
[1] 837
pi@raspberrypi:~ $ tailf .vertcoin/debug.log 
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

-----------------------------------

### 7.) Configure firewall to allow Vertcoin Core traffic  

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

--------------------------------------------------------------------------

### 8.) Congratulations! Thanks for doing your part and running a Vertcoin full node
You have successfully setup a full Vertcoin Core node on a Raspberry Pi Zero! Thank you for following along and contributing to the Vertcoin network by helping keep it populated with nodes and distributed. You help give meaning to the people's coin!
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
14
```

## References
`[1] How to Create Your Own Bitcoin Full Node With a Raspberry Pi http://www.raspberrypifullnode.com/`  
`[2] Jameson Lopp - Bitcoin Nodes, how many is enough? https://medium.com/@lopp/bitcoin-nodes-how-many-is-enough-9b8e8f6fd2cf`
