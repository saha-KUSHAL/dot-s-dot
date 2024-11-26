#!/bin/bash

FILE='/etc/dracut.conf.d/nvidia.conf'
CONTENT='force_drivers+=" nvidia nvidia_modeset nvidia_uvm nvidia_drm "'
NAME="NVidia DRM"
set -e

if [ -f "$FILE" ]; then
  echo "File exits."
    # Check if the content exists, ignoring whitespace and case
    if grep -iqF -- "$CONTENT" "$FILE"; then
        echo "$NAME Modules are already in dracut."
    else
        echo "$CONTENT" | sudo tee -a "$FILE" > /dev/null
        echo "Appending $NAME modules."
    fi
else
    echo "$CONTENT" | sudo tee "$FILE" > /dev/null
    echo "File is created and $NAME modules are added."
fi
