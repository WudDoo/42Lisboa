#!/bin/bash
arch=(`uname -svo`)
pcpu=(`awk '/physical id/' /proc/cpuinfo | wc -l`)
vcpu=(`awk '/processor/' /proc/cpuinfo | wc -l`)
ram=(`free --mega | awk '/Mem/ {printf("%d/%dMB", $4, $2)}'`)
ramp=(`free --mega | awk '/Mem/ {printf("%.2f%%", ($3/$2*100))}'`)
mem=(`df -H --total | awk '/total/ {printf("%d/%dGB", $4, $2)}'`)
memp=(`df -H --total | awk '/total/ {printf("%.2f%%", ($3/$2*100))}'`)
load=(`top -bn1 | awk '/^top/ {printf("%.2f%%", $12)}'`)
date=(`who -b | awk '{print $3}'`)
time=(`who -b | awk '{print $4}'`)
lvm=(`lsblk | awk '/lvm/ {if ($1) {print "yes"} else {print "no"} }'`)
echo "	#Architecture: $arch
	#CPU(s): $pcpu
	#vCPU(s): $vcpu
	#RAM: $ram ($ramp usage)
	#Disk Memory: $mem ($memp usage)
	#CPU load: $load
	#Last boot: $date $time
	#LVM: $lvm
"
