#!/bin/bash

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

## Load vfio
modprobe vfio
modprobe vfio_iommu_type1
modprobe vfio_pci

## Unbind gpu from amd and bind to vfio
virsh nodedev-detach $PASS_GPU_AMD
virsh nodedev-detach $PASS_GPU_AMD_AUD
## Unbind ssd from nvme and bind to vfio
virsh nodedev-detach $PASS_SSD1
## Unbind wifi from pcie and attach to VM
virsh nodedev-detach $PASS_WIFI
