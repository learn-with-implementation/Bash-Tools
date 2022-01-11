#!/bin/bash
REMOVABLE_DRIVES=""
for _device in /sys/block/*/device; do
    if echo $(readlink -f "$_device")|egrep -q "usb"; then
        _disk=$(echo "$_device" | cut -f4 -d/)
        REMOVABLE_DRIVES="$REMOVABLE_DRIVES $_disk"
    fi
done
FOLDER_LOCATION="/home/iamsyedjafer/Documents/automation_using_bash/data_folder"
if [[ -n $REMOVABLE_DRIVES ]]; then
	find $FOLDER_LOCATION -type f -print0 | xargs -0 shred -fuzv -n 48
fi

