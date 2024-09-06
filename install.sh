#!/bin/sh
sudo apt install libx11-dev libxft-dev libxinerama-dev libxrandr-dev feh dunst picom alacritty scrot
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
# if grep -qxF "$code" ~/Downloads/.xinitrc;
# then echo "$code">.xinitrc
# fi

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

# echo "$picom">~/.config/picom/picom.conf

sudo apt install light
sudo apt install picom
sudo apt install rofi
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
# cat <<EOF> ~/.config/rofi/colors/ben10.rasi
# *{
#     background:#00000090;
#     background-alt:#222222;
#     foreground:#328336;
#     selected:#328336;
#     black:#222222;
#     active:#328336;
#     urgent:#fbfbfd;

# }
# EOF
# #echo "$ben10">~/.config/rofi/colors/ben10.rasi

# touch ~/.config/rofi/config.rasi

sudo cp ~/BEN-10-DWM/RofiRequirements/config.rasi ~/.config/rofi/config.rasi

# cat<<
# EOF >~/.config/rofi/config.rasi
# configuration {
#     modi:                   "drun,run,filebrowser";
#     show-icons:                 true;
#     display-drun:               " Apps";
#     display-run:                " Run";
#     display-filebrowser:        " Files";
#     display-window:             " Windows";
#     drun-display-format:        "{name} [<span weight='light' size='large'><i>({generic})</i></span>]";
#     window-format:              "{w} · {c} · {t}";
# }

# /*****----- Global Properties -----*****/
# @import                          "shared/colors.rasi"
# @import                          "shared/fonts.rasi"

# * {
#     border-colour:               var(selected);
#     handle-colour:               var(selected);
#     background-colour:           var(background);
#     foreground-colour:           var(foreground);
#     alternate-background:        var(background-alt);
#     normal-background:           var(background);
#     normal-foreground:           var(foreground);
#     urgent-background:           var(urgent);
#     urgent-foreground:           var(background);
#     active-background:           var(active);
#     active-foreground:           var(background);
#     selected-normal-background:  var(selected);
#     selected-normal-foreground:  var(background);
#     selected-urgent-background:  var(active);
#     selected-urgent-foreground:  var(background);
#     selected-active-background:  var(urgent);
#     selected-active-foreground:  var(background);
#     alternate-normal-background: var(background);
#     alternate-normal-foreground: var(foreground);
#     alternate-urgent-background: var(urgent);
#     alternate-urgent-foreground: var(background);
#     alternate-active-background: var(active);
#     alternate-active-foreground: var(background);
# }

# /*****----- Main Window -----*****/
# window {
#     /* properties for window widget */
#     transparency:                "real";
#     location:                    center;
#     anchor:                      center;
#     fullscreen:                  false;
#     width:                       800px;
#     x-offset:                    0px;
#     y-offset:                    0px;

#     /* properties for all widgets */
#     enabled:                     true;
#     margin:                      0px;
#     padding:                     0px;
#     border:                      0px solid;
#     border-radius:               20px;
#     border-color:                @border-colour;
#     cursor:                      "default";
#     /* Backgroud Colors */
#     background-color:            @background-colour;
#     /* Backgroud Image */
#     //background-image:          url("/path/to/image.png", none);
#     /* Simple Linear Gradient */
#     //background-image:          linear-gradient(red, orange, pink, purple);
#     /* Directional Linear Gradient */
#     //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
#     /* Angle Linear Gradient */
#     //background-image:          linear-gradient(45, cyan, purple, indigo);
# }

# /*****----- Main Box -----*****/
# mainbox {
#     enabled:                     true;
#     spacing:                     10px;
#     margin:                      0px;
#     padding:                     40px;
#     border:                      0px solid;
#     border-radius:               0px 0px 0px 0px;
#     border-color:                @border-colour;
#     background-color:            transparent;
#     children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
# }

# /*****----- Inputbar -----*****/
# inputbar {
#     enabled:                     true;
#     spacing:                     10px;
#     margin:                      0px;
#     padding:                     0px;
#     border:                      0px solid;
#     border-radius:               0px;
#     border-color:                @border-colour;
#     background-color:            transparent;
#     text-color:                  @black;
#     children:                    [ "prompt", "textbox-prompt-colon", "entry" ];
# }

# prompt {
#     enabled:                     true;
#     background-color:            inherit;
#     text-color:                  inherit;
# }
# textbox-prompt-colon {
#     enabled:                     true;
#     expand:                      false;
#     str:                         "::";
#     background-color:            inherit;
#     text-color:                  inherit;
# }
# entry {
#     enabled:                     true;
#     background-color:            inherit;
#     text-color:                  inherit;
#     cursor:                      pointer;
#     placeholder:                 "It's Hero Time";
#     placeholder-color:           inherit;
# }
# num-filtered-rows {
#     enabled:                     true;
#     expand:                      false;
#     background-color:            inherit;
#     text-color:                  inherit;
# }
# textbox-num-sep {
#     enabled:                     true;
#     expand:                      false;
#     str:                         "/";
#     background-color:            inherit;
#     text-color:                  inherit;
# }
# num-rows {
#     enabled:                     true;
#     expand:                      false;
#     background-color:            inherit;
#     text-color:                  inherit;
# }
# case-indicator {
#     enabled:                     true;
#     background-color:            inherit;
#     text-color:                  inherit;
# }

# /*****----- Listview -----*****/
# listview {
#     enabled:                     true;
#     columns:                     1;
#     lines:                       10;
#     cycle:                       true;
#     dynamic:                     true;
#     scrollbar:                   true;
#     layout:                      vertical;
#     reverse:                     false;
#     fixed-height:                true;
#     fixed-columns:               true;
    
#     spacing:                     5px;
#     margin:                      0px;
#     padding:                     0px;
#     border:                      0px solid;
#     border-radius:               0px;
#     border-color:                @border-colour;
#     background-color:            transparent;
#     text-color:                  @foreground-colour;
#     cursor:                      "default";
# }
# scrollbar {
#     handle-width:                10px ;
#     handle-color:                @handle-colour;
#     border-radius:               10px;
#     background-color:            @alternate-background;
# }

# /*****----- Elements -----*****/
# element {
#     enabled:                     true;
#     spacing:                     10px;
#     margin:                      0px;
#     padding:                     5px 10px;
#     border:                      0px solid;
#     border-radius:               20px;
#     border-color:                @border-colour;
#     background-color:            transparent;
#     text-color:                  @foreground-colour;
#     cursor:                      pointer;
# }
# element normal.normal {
#     background-color:            var(normal-background);
#     text-color:                  var(normal-foreground);
# }
# element normal.urgent {
#     background-color:            var(urgent-background);
#     text-color:                  var(urgent-foreground);
# }
# element normal.active {
#     background-color:            var(active-background);
#     text-color:                  var(active-foreground);
# }
# element selected.normal {
#     background-color:            var(selected-normal-background);
#     text-color:                  var(selected-normal-foreground);
# }
# element selected.urgent {
#     background-color:            var(selected-urgent-background);
#     text-color:                  var(selected-urgent-foreground);
# }
# element selected.active {
#     background-color:            var(selected-active-background);
#     text-color:                  var(selected-active-foreground);
# }
# element alternate.normal {
#     background-color:            var(alternate-normal-background);
#     text-color:                  var(alternate-normal-foreground);
# }
# element alternate.urgent {
#     background-color:            var(alternate-urgent-background);
#     text-color:                  var(alternate-urgent-foreground);
# }
# element alternate.active {
#     background-color:            var(alternate-active-background);
#     text-color:                  var(alternate-active-foreground);
# }
# element-icon {
#     background-color:            transparent;
#     text-color:                  inherit;
#     size:                        24px;
#     cursor:                      inherit;
# }
# element-text {
#     background-color:            transparent;
#     text-color:                  inherit;
#     highlight:                   inherit;
#     cursor:                      inherit;
#     vertical-align:              0.5;
#     horizontal-align:            0.0;
# }

# /*****----- Mode Switcher -----*****/
# mode-switcher{
#     enabled:                     true;
#     spacing:                     10px;
#     margin:                      0px;
#     padding:                     0px;
#     border:                      0px solid;
#     border-radius:               0px;
#     border-color:                @border-colour;
#     background-color:            transparent;
#     text-color:                  @foreground-colour;
# }
# button {
#     padding:                     5px 10px;
#     border:                      0px solid;
#     border-radius:               20px;
#     border-color:                @border-colour;
#     background-color:            @alternate-background;
#     text-color:                  inherit;
#     cursor:                      pointer;
# }
# button selected {
#     background-color:            var(selected-normal-background);
#     text-color:                  var(selected-normal-foreground);
# }

# /*****----- Message -----*****/
# message {
#     enabled:                     true;
#     margin:                      0px;
#     padding:                     0px;
#     border:                      0px solid;
#     border-radius:               0px 0px 0px 0px;
#     border-color:                @border-colour;
#     background-color:            transparent;
#     text-color:                  @foreground-colour;
# }
# textbox {
#     padding:                     5px 10px;
#     border:                      0px solid;
#     border-radius:               20px;
#     border-color:                @border-colour;
#     background-color:            @alternate-background;
#     text-color:                  @foreground-colour;
#     vertical-align:              0.5;
#     horizontal-align:            0.0;
#     highlight:                   none;
#     placeholder-color:           @foreground-colour;
#     blink:                       true;
#     markup:                      true;
# }
# error-message {
#     padding:                     10px;
#     border:                      2px solid;
#     border-radius:               20px;
#     border-color:                @border-colour;
#     background-color:            @background-colour;
#     text-color:                  @foreground-colour;
# }

# EOF)


