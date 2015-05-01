#!/bin/bash

keyboardlayout=de

echo "Starting provisioning"
sudo su

### For ros
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu trusty main universe restricted multiverse"
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

apt-get update

### VBox, X and awesome
apt-get install -y xorg awesome virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
VBoxClient --display
VBoxClient --draganddrop
VBoxClient --seamless
VBoxClient --clipboard

cp /etc/X11/xinit/xinitrc /home/vagrant/.xinitrc
chown vagrant:vagrant /home/vagrant/.xinitrc
echo "exec awesome" >> /home/vagrant/.xinitrc
echo "setxkbmap $keyboardlayout" >> /home/vagrant/.bashrc
apt-get install -y lightdm lightdm-gtk-greeter

### For g++
apt-get install -y build-essential

### ros itself
apt-get install -y ros-indigo-desktop-full
rosdep init
su vagrant -l -c 'rosdep update'
echo "source /opt/ros/indigo/setup.bash" >> /home/vagrant/.bashrc

sudo apt-get install -y python-rosinstall

### For setting the keyboard layout
apt-get install -y x11-xkb-utils

echo "Done provisioning, keyboardlayout has been set to $keyboardlayout"

echo "Reloading the VM for you"
sleep 10 && shutdown -r now &