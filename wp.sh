#!/bin/sh

dir="/home/abd/ben10W"
case $1 in
	1)wp="$dir/b10.jpg";;
	2)wp="$dir/ABD.jpg";;
	3)wp="$dir/10.png";;
	4)wp="$dir/b10.jpg";;
	5)wp="$dir/echo.png";;
	6)wp="$dir/b10.jpg";;
	7)wp="$dir/b10.jpg";;
	8)wp="$dir/Main.jpg";;
	9)wp="$dir/Main.jpg";;
	*)wp="$dir/ABD.jpg";;
esac
feh --bg-scale "$wp"
