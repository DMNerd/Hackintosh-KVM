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
## Unbind ssd from vfio and bind to nvme
virsh nodedev-reattach $PASS_SSD1
## Unbind WIFI and attach back
virsh nodedev-reattach $PASS_WIFI

modprobe amdgpu
