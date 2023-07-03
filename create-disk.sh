#/bin/bash

# Be make sure to set your device name accordingly!
export DEVICE=/dev/sdf

export DEVPART=${DEVICE}1
export MOUNTPOINT=./mount

sudo sfdisk ${DEVICE} < bootstrap.layout
sudo mkfs.fat -F32 -n"BOOTSTRAP" $DEVPART
echo "Disk formatted."

mkdir -p ${MOUNTPOINT}
sudo mount -o umask=000 ${DEVPART} ${MOUNTPOINT}
echo "Disk ${DEVPART} mounted in ${MOUNTPOINT}."

sudo grub2-install --no-floppy --boot-directory=${MOUNTPOINT}/boot --target=i386-pc ${DEVICE}
sudo cp grub.cfg ${MOUNTPOINT}/boot/grub2/grub.cfg
echo "GRUB2 installed and configured."

sync
sudo umount mount
sudo rm -rf mount
echo "Done. You can nou unplug the device (${DEVICE}) from USB."