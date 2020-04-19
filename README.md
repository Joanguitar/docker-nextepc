# docker-nextepc

Extension of this [original repository](https://github.com/ravens/docker-nextepc).

## How to run (On Linux)

Make sure git and docker-compose are installed
```
sudo apt-get install -y git docker-compose
```
Start by cloning this Github repository and moving inside the repository folder
```
sudo git clone https://github.com/Joanguitar/docker-nextepc
cd docker-nextepc
```
Build the docker
```
sudo docker-compose build
```
Launch the docker
```
sudo docker-compose up -d
```
At this point everything should be up and running.


Once you're done, stop the docker or the logging files will plage your disk
```
sudo docker-compose down
```

## Things you can do

I compiled a list of usefull scripts inside the commands folder that you can access as `cd commands` from the main git folder.

To access the bash terminal of a container you can run
```
sudo bash access.sh <container>
```
The simulation container names are ue1, ue2, enb, hss, pgw, sgw, mme, pcrf.
This will allow you to run useful commands for networking experimentation like ifconfig, ping, iperf3 or tshark for example.

You can simultaneouly capture all interesting traffic using
```
sudo bash capture_traffic.sh <time>
```
The variable <time> stands for the amount of time that's going to be captured.
The captures are saved in the "capture" folder and can be openned with [Wireshark](https://www.wireshark.org/).

The NextEPC GUI is running under localhost:3000 with credentials
- User: admin
- Pass: 1423

Here you can modify the subscriptions for the UEs, but be aware that most of the features shown there like traffic shaping are still not implemented.

Note: By default, ue1 is registered but not ue2.

## Considerations when running in a virtual machine

If you're running this in a virtual machine, you have to be aware that this is a memory hungry docker that needs to run without delays in the process.
So I recommend allocating more memory than the one by default and enabling the use of multiple cores, else you may see random disconnections of the UE.
I got it running with 4GB of allocated memory and 4CPU cores without any problem.

## What's different

- Modified the project to depend on [NextEPC](https://github.com/nextepc/nextepc) instead of [Open5Gs](https://github.com/open5gs/open5gs) as it showed more stability with the docker environment.
- Used an outdate srsLTE version that's compatible with creating simulated interfaces.
- Added a second UE container
- Added some useful scripts
- Automated the interface mounting in the UE container
- Solved the disconnection problem with the srsLTE module interfaces by creating a backgroun ping between the UEs and the eNB

## Configuration

The SIM card provisioned in the virtual UE1 (from srsUE) and the EPC is using the following parameters : 
 * IMSI=001010000000001
 * Ki=c8eba87c1074edd06885cb0486718341
 * OPc=17b6c0157895bcaa1efc1cef55033f5f

The SIM card provisioned in the virtual UE2 (from srsUE) and the EPC is using the following parameters : 
 * IMSI=001010000000002
 * Ki=c8eba87c1074edd06885cb0486718342
 * OPc=17b6c0157895bcaa1efc1cef55033f6f

These parameters can be changed in run_ue1.sh and run_ue2.sh of the Virtual-UE-eNB folder.
