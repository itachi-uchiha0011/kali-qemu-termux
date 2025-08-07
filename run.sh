#!/bin/bash

# Start VNC server (you can set your own password securely later)
vncserver :1 -geometry 1280x720 -depth 24

# Start QEMU
qemu-system-x86_64 \
  -hda /root/kali/kali.qcow2 \
  -m 2048 \
  -smp 2 \
  -net user,hostfwd=tcp::2222-:22 \
  -net nic \
  -vnc :1 \
  -enable-kvm
