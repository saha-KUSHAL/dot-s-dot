#!/bin/bash
echo '--- SDDM : Copying Theme to USR Directory ---'
sudo cp -r ./configs/sddm/ /usr/share/sddm/themes/sddm-astronaut-theme

echo '--- SDDM : Copying fonts to USR Directory ---'
sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/

echo '--- SDDM : Setting up config ---'
CONTENT="[Theme]
Current=sddm-astronaut-theme"
FILE="/etc/sddm.conf"
if grep -iqF -- "$CONTENT" "$FILE"; then
  echo "SDDM Config is already setted up."
else
  echo "$CONTENT" | sudo tee -a "$FILE" > /dev/null
  echo "Appending $NAME in $FILE."
fi
