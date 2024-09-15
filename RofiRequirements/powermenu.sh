dir="$HOME/.config/rofi/"
theme='config'

uptime="`uptime -p | sed -e 's/up //g'`"
shutdown=' Shutdown'
reboot=' Reboot'
wifi=' WiFi'
bt=' BlueTooth'


rofi_cmd() {
	rofi -dmenu \
		-p "Control Center" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}
run_rofi() {
	echo "$shutdown\n$reboot\n$wifi\n$bt" | rofi_cmd
}
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
	"$HOME/.config/rofi/poweroff.sh"
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
