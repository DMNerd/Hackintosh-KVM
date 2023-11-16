#!/bin/bash
set -x

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

## Unload vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

## Unbind gpu from vfio and bind to radeon
virsh nodedev-reattach $PASS_GPU_AMD
virsh nodedev-reattach $PASS_GPU_AMD_AUD

modprobe amdgpu
