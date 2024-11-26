#!/bin/bash

FILE='/etc/modprobe.d/nvidia.conf'
CONTENT='options nvidia_drm modeset=1 fbdev=1 NVreg_PreserveVideoMemoryAllocations=1'
NAME="NVidia modprobe"
set -e

if [ -f "$FILE" ]; then
  echo "File exits."
    # Check if the content exists, ignoring whitespace and case
    if grep -iqF -- "$CONTENT" "$FILE"; then
        echo "$NAME value is already in Modprobe."
    else
        echo "$CONTENT" | sudo tee -a "$FILE" > /dev/null
        echo "Appending $NAME value."
    fi
else
    echo "$CONTENT" | sudo tee "$FILE" > /dev/null
    echo "File is created and $NAME value is added."
fi
