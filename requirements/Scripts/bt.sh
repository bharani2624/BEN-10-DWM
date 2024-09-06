#!/bin/bash
opt="BT\nScan\nConnect\nDisconnect"

selected=$(echo -e "$opt"|rofi -dmenu -p "Bluetooth")

case $selected in
    "BT")
    bluetooth_status=$(bluetoothctl show| grep -i "Powered:"|awk '{print $2}')
    if [ "$bluetooth_status" = "yes" ]; then
    bluetoothctl power off
    echo "Power off"
    dunstify "BT turned off"

    else
    bluetoothctl power on
    dunstify "BT turned on"

    fi
    ;;
    "Scan")
    bluetoothctl power on
    bluetoothctl scan on &
    sleep 5
    bluetoothctl scan off
    dunstify "Scan Completed"
    ;;
    "Connect")
    devices=$(bluetoothctl devices|awk '{print $2 " " substr($0, index($0,$3))}')
    device=$(echo "$devices"|rofi -dmenu -p "Select Device To Connect" | awk '{print $1}')
    if [ -n "$devices" ]; then
    bluetoothctl connect "$device"
    dunstify "Connect to $device"
    fi
    #[ -n "$device" ] && bluetoothctl connect "$device" && dunstify "Connected to $device"
    ;;
    "Disconnect")
    devices=$(bluetoothctl paired-devices | awk '{print $2 " " substr($0,index($0,$3))}')
    device=$(echo "$devices"|rofi -dmenu -p "$devices" "Select Device To Disconnect" | awk '{print $1}')
    if [ -n "$device" ]; then
    bluetoothctl disconnect "$device"
    dunstify "Disconnect from $device" 
    #[ -n "$device" ] && bluetoothctl disconnect "$device" && dunstify "Disconnected from $device"
    fi
    ;;
esac
