COMPUTER_MAKER=$(sudo dmidecode -t system | grep 'Manufacturer:' | awk '{print $2}')
# SCREEN_RESOLUTION=$(xrandr | grep '*+' | awk '{print $1}')

# install system76 driver
if [ "$COMPUTER_MAKER" == "System76" ]; then
	sudo apt-add-repository -y ppa:system76-dev/stable
	sudo apt-get -y update
	sudo apt install -y system76-driver
fi
