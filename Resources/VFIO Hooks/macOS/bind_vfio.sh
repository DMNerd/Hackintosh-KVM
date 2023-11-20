#!/bin/bash
set -x

# Load the config file
source "/etc/libvirt/hooks/kvm.conf"

# Stop display manager
#systemctl stop display-manager
#systemctl --user -M dmnerd@ stop plasma*
    
# Unbind VTconsoles: might not be needed
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI Framebuffer
#echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Unload AMD kernel module
modprobe -r amdgpu

## Unbind gpu from amd and bind to vfio
virsh nodedev-detach $PASS_GPU_AMD
virsh nodedev-detach $PASS_GPU_AMD_AUD

## Load vfio
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1
