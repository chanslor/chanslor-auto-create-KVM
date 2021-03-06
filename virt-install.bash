#!/bin/bash -x

VM_NAME=server25
MEM_SIZE=2048
VCPUS=2
OS_TYPE=rhel7.4
ISO_FILE=/var/lib/libvirt/images/ol7.4-boot.iso
DISK_SIZE=20
OS_VARIANT=rhel7.4

virt-install \
--name ${VM_NAME} \
--memory=${MEM_SIZE} \
--vcpus=${VCPUS} \
--os-type ${OS_TYPE} \
--location ${ISO_FILE} \
--disk size=${DISK_SIZE}  \
--network bridge=virbr2 \
--graphics=none \
--os-variant=${OS_VARIANT} \
--console pty,target_type=serial \
-x 'console=ttyS0,115200n8 serial' \
-x "ks=http://10.0.0.1/ol7/server25.cfg ip=10.0.0.126::10.0.0.1:24:server25::none nameserver=10.0.0.1 inst.sshd"

