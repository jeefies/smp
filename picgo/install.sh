mkdir -p $HOME/.local/bin

wget https://ghproxy.com/https://github.com/Molunerfinn/PicGo/releases/download/v2.3.1/PicGo-2.3.1.AppImage -O $HOME/.local/bin/picgo-gui

echo -n "Please enter the user you want to run picgo"
read user
sudo loginctl enable-linger $user
mkdir -p $HOME/.config/systemctl/$user
cp picgo.service $HOME/.config/systemctl/$user
systemctl --user enable $HOME/.config/systemctl/$user/picgo.service
systemctl --user start picgo.service
