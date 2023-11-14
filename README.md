# Ventura Hackintosh QEMU/KVM

My new Hackintosh repository for "Virtual Hackintosh" KVM Setup on my main PC. Based on [TheNickDudes KVM-Opencore](<https://github.com/thenickdude/KVM-Opencore>) repository

This Public repository uses generic SMBIOS. Change this before adding the mac to your apple ID

Host OS: Bedrock Linux (PopOS! base stratum, fedora and Arch linux enabled)

Ignore MSRs (Intel only)

```
sudo cp Resources/msrs/kvm.conf /etc/modprobe.d/kvm.conf
```

Defining the VM in Virtual Machine Manager

```
virsh --connect qemu:///system define macOS.xml
```

## [OpenCore](https://github.com/acidanthera/OpenCorePkg/releases)

Version: 0.9.6

OpenCanopy bootscreen is enabled and I am using the modern iconset.

### Working

TBD

## My budget VFIO Build

| Part             | Info/Link                                                                                                                                        |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **MoBo**         | [ASUS PRIME Z390-P](<https://www.asus.com/Motherboards-Components/Motherboards/All-series/PRIME-Z390-P/>)                                        |
| **CPU**          | [i5 9600K Coffee Lake](<https://ark.intel.com/content/www/us/en/ark/products/134896/intel-core-i5-9600k-processor-9m-cache-up-to-4-60-ghz.html>) |
| **dGPU 1**       | Nvidia RTX 2060  6GB                                                                                                                             |
| **dGPU 2**       | AMD Radeon RX 580 8GB                                                                                                                            |
| **RAM**          | Patriot VIPER RGB 16GB (2x8GB) DDR4 3200 CL16 white, Hyperx 16 GB (2x8GB) DDR4 3200 CL16 Kit                                                     |
| **Wifi/BT Card** | [Fenvi HB1200 PCI WiFi](<https://www.aliexpress.com/item/33034394024.html?spm=a2g0s.9042311.0.0.69f64c4dVPLsGp>), Intel 8950                     |
| **Case**         | [Fortron CMT240](<https://www.fsp-europe.com/cmt240/>)                                                                                           |
| **PSU**          | [Be quiet! System Power 9 - 600W](<https://www.bequiet.com/en/powersupply/1279>)                                                                 |

Resources used:

[TheNickDudes KVM-Opencore](<https://github.com/thenickdude/KVM-Opencore>)

[Kholias OSX-KVM](<https://github.com/kholia/OSX-KVM>)

[Bryan Steiners GPU Passtrough guide](<https://github.com/bryansteiner/gpu-passthrough-tutorial>)

[Complete single GPU Passtrough guide](<https://github.com/QaidVoid/Complete-Single-GPU-Passthrough>)