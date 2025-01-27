feh --bg-fill "/usr/share/ben10w/ABD.jpg"
picom &
slstatus &
dunst &
xinput set-prop "MSFT0002:00 04F3:31AD Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "MSFT0002:00 04F3:31AD Touchpad" "libinput Natural Scrolling Enabled" 1 & 
exec dwm
