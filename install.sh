#!/bin/sh
sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev
sudo apt install libxrandr-dev feh dunst sddm picom alacritty scrot
curl -sS https://starship.rs/install.sh | sh
touch ~/.xinitrc
cat<<EOF > ~/.xinitrc
feh --bg-fill ~/Downloads/BEN-10-DWM/10.jpg
picom &
slstatus &
dunst &
xinput set-prop "MSFT0002:00 04F3:31AD Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "MSFT0002:00 04F3:31AD Touchpad" "libinput Natural Scrolling Enabled" 1>
exec dwm
EOF
sudo mkdir /usr/share/fonts/truetype/ben10
sudo cp ~/BEN-10-DWM/GROBOLD.ttf /usr/share/fonts/truetype/ben10
mkdir ~/.config/picom
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

sudo apt install sddm
sudo apt install picom
mkdir ~/.config/rofi/shared
sudo cp ~/BEN-10-DWM/requirements/wifi.sh ~/.config/rofi/
sudo cp ~/BEN-10-DWM/requirements/bt.sh ~/.config/rofi/
touch ~/.config/rofi/shared/colors.rasi
cat
<<EOF >~/.config/rofi/shared/colors.rasi
@import "~/.config/rofi/colors/ben10"
EOF

echo "$color">~/.config/rofi/shared/colors.rasi

touch ~/.config/rofi/shared/fonts.rasi

cat<<
EOF >~/.config/rofi/shared/fonts.rasi
* {
    font: "JetBrains Mono Nerd Font 15";
}
EOF
# echo "$fonts">~/.config/rofi/shared/fonts.rasi
mkdir ~/.config/rofi/colors

# touch ~/.config/rofi/colors/ben10.rasi

sudo cp ~/BEN-10-DWM/RofiRequirements/ben10.rasi ~/.config/rofi/colors/ben10.rasi
sudo cp ~/BEN-10-DWM/RofiRequirements/config.rasi ~/.config/rofi/config.rasi


