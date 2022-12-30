#!/bin/bash
arch="`uname -svo`"
pcpu="`awk '/physical id/' /proc/cpuinfo | wc -l`"
vcpu="`awk '/processor/' /proc/cpuinfo | wc -l`"
ram="`free --mega | awk '/Mem/{printf("%d/%dMB (%.2f%% usage)", $4, $2, $3/$2*100)}'`"
mem="`df -H --total | awk '/total/ {printf("%d/%dGB (%.2f%% usage)", $4, $2, $3/$2*100)}'`"
load="`top -bn1 | awk '/^top/ {printf("%.2f%%", $(NF-2))}'`"
bootdate="`who -b | awk '{print $3" "$4}'`"
lvm=(`if [ "$(lsblk | grep lvm | wc -l)" -gt 0 ]; then printf "Yes"; else printf "No"; fi`)
tcp="`ss | grep tcp | wc -l` Established"
user="`who | cut -d ' ' -f 1 | sort -u | wc -l`"
ip="`hostname -I`(`ip link show | awk '/ether/ {print $2}'`)"
cmds="`sudo awk '/COMMAND/' /var/log/sudo/sudo.log | wc -l`"
wall "	#Architecture: $arch
	#CPU(s): $pcpu
	#vCPU(s): $vcpu
	#RAM: $ram
	#Disk Memory: $mem
	#CPU load: $load
	#Last boot: $bootdate
	#LVM: $lvm
	#Connections TCP: $tcp
	#User log: $user
	#Network: IP $ip
	#Sudo: $cmds
"
