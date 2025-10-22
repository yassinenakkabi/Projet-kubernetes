Vagrant.configure("2") do |config|
  # Image officielle Ubuntu 22.04 LTS
  config.vm.box = "ubuntu/jammy64"

  # Définition de la machine
  config.vm.define "ubuntu-k8s" do |ubuntu|
    ubuntu.vm.hostname = "ubuntu-k8s"
    ubuntu.vm.network "private_network", ip: "192.168.56.20"

    # Configuration VirtualBox
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu-k8s"
      vb.memory = 4096
      vb.cpus = 4
    end

    # Dossier partagé (facultatif)
    ubuntu.vm.synced_folder ".", "/vagrant", disabled: false
  end
end
