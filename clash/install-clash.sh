#config_file="https://github.com/skywolf627/VmessActions/raw/main/clash.yml"
#config_file="https://raw.githubusercontent.com/adiwzx/freenode/main/adispeed.yml"
config_file="https://raw.githubusercontent.com/oslook/clash-freenode/main/clash.yaml"
proxy_url="https://ghproxy.com/"
clash_url="https://github.com/Dreamacro/clash/releases/download/v1.7.1/clash-linux-armv"
clash_url_end="-v1.7.1.gz"
armhf="$proxy_url${clash_url}7$clash_url_end"
arm64="$proxy_url${clash_url}8$clash_url_end"

if [ ! -d "/etc/clash" ]; then
	mkdir /etc/clash
fi

if [ ! -f "/etc/clash/config.yaml" ]; then
	echo "Get clash config file to /etc/clash"
	wget $proxy_url$config_file -O /etc/clash/config.yaml
else
	echo "Config File Already exists"
fi

if [ $1 = "update" ]; then
	echo "Update Clash config file"
	wget $proxy_url$config_file -O /etc/clash/config.yaml
fi

if [ ! -f "/usr/bin/clash" ]; then
	if [ `uname -m` = 'arm64' ] || [ `uname -m` = 'aarch64' ]; then
		echo 'arm64'
		wget $arm64 -O /tmp/clash.gz
	else
		echo 'armhf'
		wget $armhf -O /tmp/clash.gz
	fi
	echo 'get clash.gz from github'
	sh -c "gzip -c -d /tmp/clash.gz > /usr/bin/clash"
	chmod +x /usr/bin/clash
	echo "extract to /usr/bin/clash"
fi

sudo chmod +x /usr/bin/clash

echo "Get sources done, start to create clash service"
cp ./clash.service /etc/systemd/system

echo "Enable clash and start it..."
systemctl enable clash
echo "Enabled..."
systemctl start clash
echo "Started..."
systemctl status clash | dd status=none
echo "All done!"
