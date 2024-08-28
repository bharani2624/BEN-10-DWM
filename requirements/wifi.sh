opt="ON/OFF\nConnect"
selected=$(echo -e "$opt"|rofi -dmenu -p "WIFI")
case $selected in
	"ON/OFF")
	wifi_status=$(nmcli radio wifi)
	if [ "$wifi_status" = "enabled" ]; then
	nmcli radio wifi off
	dunstify "Successfully Disabled Wifi"
	else
	nmcli connection down Test\ Hotspot
	nmcli radio wifi on
	dunstify "Succedssfully Enabled Wifi"
	fi
	;;
	"Connect")
	devices=$(nmcli device wifi list|awk 'NR>1 {print $2}')
	device=$(echo "$devices"|rofi -dmenu -p "Select Wifi To connect")
	if [ -n "$device" ]; then
		password=$(rofi -dmenu -password -p "Enter Password For $device")
		connection=$(nmcli device wifi connect "$device" password "$password"|awk '{print $3}')
		if [ "$connection" = "successfully" ]; then
		dunstify "Successfully Connected"
		else
		dunstify "Password is incorrect"
		fi
	else
	dunstify "No Network Selected"
	fi
	;;
esac
