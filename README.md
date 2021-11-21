# RaspBian libs

## Auto Update
`git clone https://github.com/jeefies/smp.git` or `git clone https://gitee.com/jeefy/smp.git`.  
cd into `smp` directory and run `./autoupdate.sh`.  
This will help you to change the mirror of the apt and update it.  

## Clash service
cd into `clash` directory and run `./install-clash.sh`.  
this will help you to download clash from github automatically (do not need proxy).  
also would help you to create a service so that you can use it without manusually run clash.  
> Help you run clash when every reboot.

## Golang Environment Install
**It's not stable**  
After you run the install file, you should edit your environment variables.  
add `export GOROOT="$HOME/.go"` and `export PATH="$PATH:$GOROOT/bin"` to `~/.bashrc`.  

## Wechat and QQ
wechat see the deb file under wechat folder.  
QQ can download `.sh` install file from `https://im.qq.com/linuxqq/download.html`, [link here](https://im.qq.com/linuxqq/download.html)

## Minecraft 1.12.2
By using HMCL laucher, you can play it freely.  
But first, you should do something to make sure it can run.

If you want to download python versions, use  
`git clone https://github.com/pyenv/pyenv.git ~/.pyenv`  
to clone it to your home path.  
`nano ~/.bashrc`  
Add three lines:  
```
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```
After that, you can use `pyenv install -l` to know which version you can install.  
Then use `pyenv install x.x.x` to instal it (it might take a few minutes).  

use `python3 apt.py libs.txt`  
to install the dependences for need for python. Also, you can modify the `libs.txt` into other libs.  
But before using if, you need to copy the source list for your `apt`.
```
sudo cp sources.list /etc/apt/sources.list 
#if your raspberry pi's system is arm64, change first sources.list into sources.list.64
sudo cp raspi.list /etc/apt/sources.list.d/raspi.list
```
