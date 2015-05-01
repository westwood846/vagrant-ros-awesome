# Vagrant + Ros + Awesome
This is a Vagrant setup for ros indigo, based on the standart **ubuntu/trusty64** Virtualbox box. The provisioning-script installs **ros** (following the instructions [here](http://wiki.ros.org/indigo/Installation/Ubuntu>)). It also provides a gui with **awesome** as desktop manager. 

Note that ros also provides [some vagrant base-boxes with everything already installed](https://vagrantcloud.com/shadowrobot), but I found myself wanting some more flexibilty. There is also a [repo that uses puppet to set up ros](https://github.com/esteve/ros-puppet), altough it appears to be outdated and did not work for me.


## Dependencies
* Vagrant (<https://www.vagrantup.com>)
* VirtualBox (<https://www.virtualbox.org>)
* *vagrant-cachier* (<https://github.com/fgrehm/vagrant-cachier>, optional)


## Installation
Just use `vagrant up`. If you have the vagrant-cachier plugin, it will be used. You can disable it in the Vagrantfile. You should not login while the provisioning script is running. The VM will be restarted after provisioning.


## Login
`vagrant up` will show the VM in a Virtualbox window that will a lightdm login after booting. Use username **vagrant** and password **vagrant** to log in.

To open a terminal right-click on the desktop and select **open terminal**. Once you are done, `vagrant suspend` or `vagrant halt` the VM from the host and `vagrant up` to start it again. Avoid running the provisioning-script more than once (it won't by default).

You can also just use ssh and disable the gui in the Vagrantfile.


## Customisation
You can change you keyboad-layout in the provisioning-script ([bootstrap.sh](bootstrap.sh)). The default is *de* for german. You should also be able to change the desktop manager with little effort (a good alternative would be <http://www.xfce.org>, for example).


## Useage
This should be obvious for people who know Vagrant already.

This is just a template for you to copy into your projects. Each project should have it's own Vagrantfile and thereby it's own VM to compile/run in. This makes your project's environment reproducible for every member of your team, and saves you from having to set up all the ros stuff manually.

Vagrant VMs are not meant to persist. Thus, you should refrain from doing anything meaningful outside of `/vagrant`. `/vagrant` is your project directory from the host (the one with the Vagrantfile), synchronized to the guest VM. It's recommended that you work on the project from the host and only compile/run the project from the guest.

If you need additional configuration of the VM, you could do them inside the running VM, but they would be lost for your co-workers, or you, once you reinstall the VM. This means that you should add those configurations to the ([bootstrap.sh](bootstrap.sh)) provisioning script and `vagrant destroy`/`vagrant up` your VM.

A more elaborate introduction to vagrant can be found here: <https://docs.vagrantup.com/v2/getting-started/index.html>


## Troubleshooting
If you experience problems with compiling C++ with Windows as host (i.e. symlinks not working), try running `vagrant up` from a terminal started as administrator.