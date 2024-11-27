#!/bin/bash
echo '--- SDDM : PULL from Remote ---'
git pull git@github.com:saha-KUSHAL/sddm-astronaut-theme.git ./configs/sddm/
rm -rf ./configs/sddm/.git
