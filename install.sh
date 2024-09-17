#!/bin/sh
echo "Started To Add Configuration Files Kindly Enter 'Y' If Asked"

echo "Started Installing Dependencies"
sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev
sudo apt install libxrandr-dev feh dunst sddm picom alacritty scrot curl rofi
curl -sS https://starship.rs/install.sh | sh
echo "Completed installing Dependencies"

echo "........................................................................................................................................."

sudo cp -r ~/BEN-10-DWM/ben10 /usr/share/sddm/themes/ben10
sudo cp ~/BEN-10-DWM/ben10/plasma.desktop /usr/share/xsessions/plasma.desktop

echo "SDD Configuration Successfully Completed"

cp -r ~/BEN-10-DWM/requirements/alacritty ~/.config/alacritty

echo "Alacritty Configuration Is Successfully Completed"

cp -r ~/BEN-10-DWM/requirements/dunst ~/.config/dunst

echo "Dunst Configuration Is Successfully Completed"

cp ~/BEN-10-DWM/.xinitrc ~/.xinitrc

sudo mkdir -p /usr/share/fonts/truetype/ben10
sudo cp ~/BEN-10-DWM/fonts/GROBOLD.ttf /usr/share/fonts/truetype/ben10/GROBOLD.ttf
sudo cp ~/BEN-10-DWM/fonts/JetBrains-Mono-Nerd-Font-Complete.ttf /usr/share/fonts/truetype/ben10/JetBrains-Mono-Nerd-Font-Complete
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

echo "Picom Configuration Is Successfully Completed"

mkdir -p ~/.config/rofi/shared

sudo cp ~/BEN-10-DWM/RofiRequirements/powermenu.sh ~/config/rofi/powermenu.sh
sudo cp ~/BEN-10-DWM/RofiRequirements/poweroff.sh ~/config/rofi/poweroff.sh
sudo cp ~/BEN-10-DWM/requirements/Scripts/wifi.sh ~/.config/rofi/wifi.sh
sudo cp ~/BEN-10-DWM/requirements/Scripts/bt.sh ~/.config/rofi/bt.sh
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

echo "Rofi Configuration Is Successfully Completed"


cd ~/BEN-10-DWM

sudo make && sudo make install
if [ $? -eq 0 ]; then
    echo "DWM Was Successfully Built"
else
    echo "There Was An Issue In Building DWM"
    exit 1
fi
cd ~/BEN-10-DWM/abdsl
sudo make && sudo make install
if [ $? -eq 0 ]; then
    echo "SL Status Bar Was Successfully Built"
else
    echo "There Was An Issue In Building SL Status Bar"
    exit 1
fi
cd
echo "Completed Setting Up BEN10 DWM"

