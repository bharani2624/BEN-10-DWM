#!/bin/sh
echo "Started To Add Configuration Files Kindly Enter 'Y' If Asked"

echo "Started Installing Dependencies"
sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev
sudo apt install libxrandr-dev feh dunst sddm picom alacritty scrot
curl -sS https://starship.rs/install.sh | sh
echo "Completed installing Dependencies"

echo "....................................................................................."

cp ~/BEN-10-DWM/.xinitrc ~/.xinitrc
sudo mkdir -p /usr/share/fonts/truetype/ben10
sudo cp ~/BEN-10-DWM/GROBOLD.ttf /usr/share/fonts/truetype/ben10
mkdir -p ~/.config/picom
touch ~/.config/picom/picom.conf


cat<<EOF >~/.config/picom/picom.conf
opacity-rule=[
        "90:class_g='Rofi'"
];
/*inactive-opacity = 0.90;
active-opacity = 1.0;
frame-opacity = 0.90;*/
inactive-opacity=0.90;
active-opacity=0.90;
frame-opacity=1.0;
EOF


mkdir -p ~/.config/rofi/shared
sudo cp ~/BEN-10-DWM/requirements/Scripts/wifi.sh ~/.config/rofi/
sudo cp ~/BEN-10-DWM/requirements/Scripts/bt.sh ~/.config/rofi/
touch ~/.config/rofi/shared/colors.rasi
cat<<EOF >~/.config/rofi/shared/colors.rasi
@import "~/.config/rofi/colors/ben10"
EOF

touch ~/.config/rofi/shared/fonts.rasi

cat<<EOF >~/.config/rofi/shared/fonts.rasi
* {
    font: "JetBrains Mono Nerd Font 15";
}
EOF

mkdir -p ~/.config/rofi/colors

sudo cp ~/BEN-10-DWM/RofiRequirements/ben10.rasi ~/.config/rofi/colors/ben10.rasi
sudo cp ~/BEN-10-DWM/RofiRequirements/config.rasi ~/.config/rofi/config.rasi


