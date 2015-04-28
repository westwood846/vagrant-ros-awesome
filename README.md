# Vagrant ros-awesome
This is a Vagrant setup for ros, based on the standart **ubuntu/trusty64** Virtualbox box. The provisioning-script installs **ros** (following the instructions [here](http://wiki.ros.org/indigo/Installation/Ubuntu>)). It also provides a gui with **awesome** as desktop manager. 

Note that ros also provides [some vagrant base-boxes with everything already installed](https://vagrantcloud.com/shadowrobot), but I found myself wanting some more flexibilty. There is also a [repo that uses puppet to set up ros](https://github.com/esteve/ros-puppet), altough it appears to be outdated and did not work for me.


## Dependencies
* Vagrant (<https://www.vagrantup.com>)
* VirtualBox (<https://www.virtualbox.org>)
* *vagrant-cachier* (<https://github.com/fgrehm/vagrant-cachier>, optional)


## Installation
Just use `vagrant up`. If you have the vagrant-cachier plugin, it will be used. You can disable it in the Vagrantfile.


## Login
`vagrant up` will open a Virtualbox window with a terminal login. If the provisioning script is running, wait for it to finish. It should tell you when it's done. Log in with username **vagrant** and password **vagrant**. To start the desktop, run `startx`. To open a terminal in awesome, right-click on the desktop and select **open terminal**. Once you are done, `vagrant suspend` or `vagrant halt` the VM from the host and `vagrant up` to start it again. Avoid running the provisioning-script more than once.

You can also just use ssh and disable the gui in the Vagrantfile.


## Customisation
You can change you keyboad-layout in the provisioning-script ([bootstrap.sh](bootstrap.sh)). The default is *de* for german. You should also be able to change the desktop manager with little effort (a good alternative would be <http://www.xfce.org> for example).


## Troubleshooting
If you experience problems with compiling C++ with Windows as host (i.e. symlinks not working), try running `vagrant up` from a terminal started as administrator.