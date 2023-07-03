# Microserver Bootstrap

Microserver Bootstrap allows you to create a USB drive or microSD card that will allow your Microserver Gen8 to boot from the SATA ODD port.

This setup is to be used when you want to use the server in AHCI SATA Mode instead of using the B120i RAID Controller.

When using AHCI Sata Mode, the server will be able to boot either from USB/microSD of from SATA1 Port (first HDD Bay).

## Requirements

 * `grub2-tools`
 * USB Flash drive or microSD card of at least 256MB capacity.

## Usage

Before firing the `create-disk.sh` script, **PLEASE** make sure that you edit the `DEVICE` variable inside the script accordingly.

```
./create-disk.sh
```
