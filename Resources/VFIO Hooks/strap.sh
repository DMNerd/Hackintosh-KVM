#!/bin/bash

sudo mkdir /etc/libvirt/hooks/

#Strap hooks
sudo wget 'https://raw.githubusercontent.com/PassthroughPOST/VFIO-Tools/master/libvirt_hooks/qemu' \
    -O /etc/libvirt/hooks/qemu
sudo chmod +x /etc/libvirt/hooks/qemu

#Create Dirs
sudo mkdir /etc/libvirt/hooks/qemu.d
sudo mkdir /etc/libvirt/hooks/qemu.d/macOS
sudo mkdir /etc/libvirt/hooks/qemu.d/macOS/prepare
sudo mkdir /etc/libvirt/hooks/qemu.d/macOS/release
sudo mkdir /etc/libvirt/hooks/qemu.d/macOS/prepare/begin
sudo mkdir /etc/libvirt/hooks/qemu.d/macOS/release/end

#Copy files
sudo cp kvm.conf /etc/libvirt/hooks
sudo cp macOS/bind_vfio.sh /etc/libvirt/hooks/qemu.d/macOS/prepare/begin 
sudo cp macOS/unbind_vfio.sh /etc/libvirt/hooks/qemu.d/macOS/release/end

#Make Executable
sudo chmod +x /etc/libvirt/hooks/qemu.d/macOS/prepare/begin/bind_vfio.sh 
sudo chmod +x /etc/libvirt/hooks/qemu.d/macOS/release/end/unbind_vfio.sh 

#Tree to check the result
sudo tree /etc/libvirt/hooks/