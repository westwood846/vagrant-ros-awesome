#!/bin/bash

keyboardlayout=de

echo "Starting provisioning"
sudo su

### For ros
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu trusty main universe restricted multiverse"
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

apt-get update

### VBox and desktop
apt-get install -y xorg awesome virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
VBoxClient --display
VBoxClient --draganddrop
VBoxClient --seamless
VBoxClient --clipboard

cp /etc/X11/xinit/xinitrc /home/vagrant/.xinitrc
chown vagrant:vagrant /home/vagrant/.xinitrc
echo "exec awesome" >> /home/vagrant/.xinitrc
echo "setxkbmap $keyboardlayout" >> /home/vagrant/.bashrc

### ros itself
apt-get install -y ros-indigo-desktop-full
rosdep init
su vagrant -l -c 'rosdep update'
echo "source /opt/ros/indigo/setup.bash" >> /home/vagrant/.bashrc

sudo apt-get install -y python-rosinstall

### Usability
apt-get install -y x11-xkb-utils


echo "Done provisioning"
echo "Keyboardlayout has been set to $keyboardlayout"