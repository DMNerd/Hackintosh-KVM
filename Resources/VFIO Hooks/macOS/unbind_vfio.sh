#!/bin/bash
set -x

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

## Unbind gpu from vfio and bind to radeon
virsh nodedev-reattach $PASS_GPU_AMD
virsh nodedev-reattach $PASS_GPU_AMD_AUD

## Unload vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Load AMD kernel module
modprobe amdgpu

# Rebind framebuffer to host
#echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Bind VTconsoles: might not be needed
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

# Restart Display Manager
#systemctl start display-manager
#systemctl --user -M dmnerd@ start plasma*
