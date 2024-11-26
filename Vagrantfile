Vagrant.configure("2") do |config|
    
    config.vm.box = "ubuntu/bionic64"
    config.vm.boot_timeout = 600

    config.vm.provision "shell", path: "./provisionning/script_ansible.sh"
    #config.vm.synced_folder ".", "/vagrant"
    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "provisionning/playbook.yml"
    end

    # Configs 
    config.vm.define :local do |local|
        # Configs for virtual machine entry in Oracle VM VirtualBox
          local.vm.provider :virtualbox do |vb_config|
              vb_config.name = "local"
              vb_config.memory = "4096"
          end
          # Terminal name
          local.vm.hostname = "local"
          # IP address to access from host machine
          local.vm.network "private_network", ip: "192.168.50.3"
    end
end