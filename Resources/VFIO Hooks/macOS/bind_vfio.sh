#!/bin/bash
set -x

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

# Unload AMD kernel module
modprobe -r amdgpu

## Unbind gpu from amd and bind to vfio
virsh nodedev-detach $PASS_GPU_AMD
virsh nodedev-detach $PASS_GPU_AMD_AUD

## Load vfio
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1