#!/sbin/sh

strings /dev/block/bootdevice/by-name/LTALabel | grep D6502
if [ $? -eq 0 ]; then
    for i in $(ls /mnt/system/system/vendor/firmware/d6502/); do
        mv /mnt/system/system/vendor/firmware/d6502/$i /mnt/system/system/vendor/firmware/
    done
fi
rm -rf /mnt/system/system/vendor/firmware/d6502/
