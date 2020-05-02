#!/sbin/sh

rm /tmp/d6502_log
echo "d6502.sh started at $(date)" >> /tmp/d6502_log

strings /dev/block/bootdevice/by-name/LTALabel | grep D6502
if [ $? -eq 0 ]; then
    echo "d6502 detected" >> /tmp/d6502_log
    for i in $(ls /mnt/system/system/vendor/firmware/d6502/); do
        mv /mnt/system/system/vendor/firmware/d6502/$i /mnt/system/system/vendor/firmware/
    done
    rm -rf /mnt/system/system/vendor/firmware/d6502/
else
    echo "nope, we are not d6502. removing d6502 firmware" >> /tmp/d6502_log
    rm -rf /mnt/system/system/vendor/firmware/d6502/
fi
