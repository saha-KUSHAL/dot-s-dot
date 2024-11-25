#!/bin/bash
#!/bin/bash

FILE='/etc/dracut.conf.d/nvidia.conf'
CONTENT='force_drivers+=" nvidia nvidia_modeset nvidia_uvm nvidia_drm "'

set -e

if [ -f "$FILE" ]; then
    # Check if the content exists, ignoring whitespace and case
    if grep -iqF -- "$CONTENT" "$FILE"; then
        echo "DRM Modules are already in dracut."
    else
        echo "$CONTENT" | sudo tee -a "$FILE" > /dev/null
        echo "Appending the modules."
    fi
else
    echo "$CONTENT" | sudo tee "$FILE" > /dev/null
    echo "File is created and modules are added."
fi
