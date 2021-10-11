config_file="https://subcon.dlj.tf/sub?target=clashr&new_name=true&url=https%3A%2F%2Fraw.fastgit.org%2Ffreefq%2Ffree%2Fmaster%2Fv2&insert=false&config=https%3A%2F%2Fraw.githubusercontent.com%2FACL4SSR%2FACL4SSR%2Fmaster%2FClash%2Fconfig%2FACL4SSR_Online.ini"
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
	wget $config_file -O /etc/clash/config.yaml
else
	echo "Config File Already exists"
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
