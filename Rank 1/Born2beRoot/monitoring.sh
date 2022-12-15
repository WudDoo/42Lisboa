#!/bin/bash
arch=(`uname -svo`)
pcpu=(`awk '/physical id/' /proc/cpuinfo | wc -l`)
vcpu=(`awk '/processor/' /proc/cpuinfo | wc -l`)
ram=(`free --mega | awk '/Mem/ {printf("%d/%dMB", $4, $2)}'`)
ramp=(`free --mega | awk '/Mem/ {printf("%d%%", ($3/$2*100))}'`)
wall "	@ Architecture: $arch
	@ CPU(s): $pcpu
	@ vCPU(s): $vcpu
	@ Available RAM: $ram ($ramp in use)
	@ Available Memory:
"
