$message = <<SCRIPT
	echo 'Login with vagrant:vagrant and run `startx`'
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision "shell", inline: $message, run: "always"

  config.vm.provider "virtualbox" do |v|
      v.name = "ros-vm"
      v.gui = true # Toggle this if you don't want a VBox window
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"] # For Windows/C++
  end

  if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :box
  end
end
