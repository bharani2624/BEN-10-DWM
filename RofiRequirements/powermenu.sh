dir="$HOME/.config/rofi/"
theme='config'

uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

shutdown=' Shutdown'
reboot=' Reboot'
wifi=' WiFi'
bt=' BlueTooth'
yes=' Yes'
no=' No'

rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 150px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Just Be OverConfident Like Mr.BenTennyson?' \
		-theme ${dir}/${theme}.rasi
}

confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

run_rofi() {
	echo -e "$shutdown\n$reboot\n$wifi\n$bt" | rofi_cmd
}

run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			sudo systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		fi
	else
		exit 0
	fi
}
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		poweroff
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $wifi) 
        "$HOME/.config/rofi/wifi.sh"
        ;;
	$bt)
		"$HOME/.config/rofi/bt.sh"
		;;
esac
