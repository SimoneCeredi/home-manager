# Cool stuff
Some cool stuff needed to have nix as a package manager that integrates with rofi:\
open /usr/local/bin/rof with your favourite editor
```
sudo vim /usr/local/bin/rof
```
paste inside this stuff
```
#!/bin/bash
source /etc/profile
/usr/bin/rofi -show drun
```
and chmod it 
```
sudo chmod +x /usr/local/bin/rof
```
then edit /etc/profile
```
sudo vim /etc/profile
```
and on the bottom paste this
```
if [ -f $HOME/.nix-profile/etc/profile.d/nix.sh ];
then
     source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

export XDG_DATA_DIRS=$HOME/.nix-profile/share:/usr/local/share:/usr/share:$HOME/.local/share:$XDG_DATA_DIRS
```
and in the end instead of running rofi inside your sway conf run
```
/usr/local/bin/rof
```
