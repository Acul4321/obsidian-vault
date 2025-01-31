## WSL
``` bash
wsl -d {name} -u {username}  //load machine, optional(log in as user)
wsl --list --v
wsl --terminate {name} || wsl --shutdown  //kernel stop commands
wsl --set-default {name}  //changes default distro
wsl --unregister {name}

wsl --export {name} {name}.tar  //save(second name can be whatever)
wsl --import {MachineName} {storage dir(D:\wsl)} {exported file dir}
```
## Linux
``` bash
cd /mnt/c  //changes dirctory to the windows storage
xxx.exe  //windows commands in linux

//kali-linux
kex  //runs gui, if installed - f8 to minimise
kex --win --stop  //stops gui
```
## Windows
``` bash
wsl xxx  //use linux commands in windows
```