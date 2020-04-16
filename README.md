# docker-nextepc

Extension of this [original repository](https://github.com/ravens/docker-nextepc).

## How to run (On Linux)

Make sure git and docker-compose are installed
```
sudo apt-get install -y git docker-compose
```
Start by cloning this Github repository and moving inside the repository folder
```
git clone https://github.com/Joanguitar/docker-nextepc
cd docker-compose
```
Build the docker
```
sudo docker-compose build
```
Launch the docker
```
sudo docker-compose up -d
```
At this point everything your be up and running.


Once you're done, stop the docker or the logging files will plage your disk
```
sudo docker-compose down
```

## Considerations when running in a virtual machine

If you're running this in a virtual machine, you have to be aware that this is a memory hungry docker that needs to run without delays in the process.
So I recommend allocating more memory than the one by default and enabling the use of multiple cores, else you may see random disconnections of the UE.
I got it running with 4GB of allocated memory and 4CPU cores without any problem.

## What's different

Modified the project to depend on [NextEPC](https://github.com/nextepc/nextepc) instead of [Open5Gs](https://github.com/open5gs/open5gs) as it showed more stability with the docker environment.
Used an outdate srsLTE version that's compatible with creating simulated interfaces.
Added a second UE container
Added some useful scripts
Automated the interface mounting in the UE container
Solved the disconnection problem with the srsLTE module interfaces by creating a ping

## Configuration

The SIM card provisioned in the virtual UE (from srsUE) and the EPC is using the following parameters : 
 * IMSI=001010000000001
 * Ki=c8eba87c1074edd06885cb0486718341
 * OPc=17b6c0157895bcaa1efc1cef55033f5f
 
 Make sure to flash your SIM accordingly when using the physical eNB docker-compose example with your own eNB, using the sysmocom SIM for example.
