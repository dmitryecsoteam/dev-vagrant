#Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure("2") do |config|

  config.vm.boot_timeout = 600

  config.vm.define "ans" do |ans|
    ans.vm.box = "ubuntu/trusty64"
	ans.vm.hostname = "dev-ansible"
    ans.vm.network :private_network, ip: "192.168.0.41", netmask: "255.255.255.0"
	
	ans.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--cpus", 1, "--memory", "512"]
    end
	
	ans.vm.provision "shell", privileged: true, path: "./vagrant-scripts/bootstrap-ansible.sh"
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.hostname = "dev-db"
    db.vm.network :private_network, ip: "192.168.0.42", netmask: "255.255.255.0"
    db.vm.network :forwarded_port, guest: 27017, host: 27017
    db.vm.network :forwarded_port, guest: 27018, host: 27018
    db.vm.network :forwarded_port, guest: 27019, host: 27019
  
    db.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--cpus", 1, "--memory", "1024"]
    end
	
	db.vm.provision "shell", privileged: true, path: "./vagrant-scripts/bootstrap-server.sh"
  end
end