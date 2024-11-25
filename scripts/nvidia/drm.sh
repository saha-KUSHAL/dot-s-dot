#!/bin/bash

FILE='/etc/dracut.conf.d/nvidia.conf'
CONTENT='force_drivers+=" nvidia nvidia_modeset nvidia_uvm nvidia_drm "'

set -e

if [ -f "$FILE" ]; then
  echo "File exits."
    # Check if the content exists, ignoring whitespace and case
    if grep -iqF -- "$CONTENT" "$FILE"; then
        echo "NVIDIA DRM Modules are already in dracut."
    else
        echo "$CONTENT" | sudo tee -a "$FILE" > /dev/null
        echo "Appending NVIDIA DRM modules."
    fi
else
    echo "$CONTENT" | sudo tee "$FILE" > /dev/null
    echo "File is created and NVIDIA DRM modules are added."
fi
