# RaspBian libs

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
