Vagrant.configure("2") do |k8s_lab|
   k8s_lab.vm.define "eks" do |eks|
      eks.vm.provider "vmware_desktop" do |v|
         v.cpus = 2
         v.memory = 4096
         v.allowlist_verified = true
      end
      eks.vm.box = "generic/rocky8"
      eks.vm.hostname = "eks.9prints.internal"
      eks.vm.network "private_network", ip: "10.10.1.101"
      eks.vm.synced_folder ".", "/vagrant"
      eks.vm.provision "shell", path: "basic.sh"
      end
end

