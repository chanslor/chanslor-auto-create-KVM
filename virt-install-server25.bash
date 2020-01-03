#!/bin/bash -x

#ERROR    
#An install method must be specified
#(--location URL, --cdrom CD/ISO, --pxe, --import, --boot hd|cdrom|...)

#NEW ERROR WITH FC31
# ERROR    Kernel arguments are only supported with location or kernel installs.


#VIRT_INSTALL=/home/mdc/LIBVIRT/virt-manager/virt-install
VIRT_INSTALL=/usr/bin/virt-install
VM_NAME=server25
MEM_SIZE=2048
VCPUS=2
OS_TYPE=rhel7.4
ISO_FILE=/var/lib/libvirt/images/ol7.4-boot.iso
DISK_SIZE=20
OS_VARIANT=rhel7.4

#virt-install \

#$VIRT_INSTALL --debug \
$VIRT_INSTALL  \
--arch=x86_64 \
--name ${VM_NAME} \
--memory=${MEM_SIZE} \
--vcpus=${VCPUS} \
--os-type ${OS_TYPE} \
--disk path=/var/lib/libvirt/images/srv25.qcow2,size=${DISK_SIZE}  \
--network bridge=virbr2 \
--graphics=none \
--os-variant=${OS_VARIANT} \
--console pty,target_type=serial \
--location 'http://10.0.0.1/ol7/' \
-x 'console=ttyS0,115200n8 serial' \
-x "ks=http://10.0.0.1/ol7/server25.cfg ip=10.0.0.126::10.0.0.1:24:server25::none nameserver=10.0.0.1 inst.sshd"

