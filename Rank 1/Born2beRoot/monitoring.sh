#!/bin/bash
echo  $'\t# Architecture:' `hostnamectl | grep "Operating System" | cut -d ' ' -f5-` \
`arch` \
$'\n\t# CPU(s): '`awk '/physical id/' /proc/cpuinfo | wc -l`  \
$'\n\t# vCPU(s): '`awk '/processor/' /proc/cpuinfo | wc -l`
