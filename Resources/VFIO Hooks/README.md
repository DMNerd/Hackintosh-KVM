# VFIO Hooks

You can use the strap.sh script to automatically install the hooks, but make sure you edit kvm.conf and the hooks to reflect your setup and PCIe paths

The tree in the end should look like this:

```#!/bin/bash
/etc/libvirt/hooks/
├── kvm.conf
├── qemu
└── qemu.d
    └── macOS
        ├── prepare
        │   └── begin
        │       └── bind_vfio.sh
        └── release
            └── end
                └── unbind_vfio.sh
```
