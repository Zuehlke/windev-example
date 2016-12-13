# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  if Vagrant.has_plugin?("berkshelf")
    config.berkshelf.enabled=false
  end

  config.vm.define "vm" do |cfg|
    cfg.vm.define "example"
    cfg.vm.hostname="example"
    cfg.vm.box = "http://zdevops.ps-zuehlke.com/depot/boxes/win7x64-pro.box"
    cfg.vm.box_check_update = false
    # Port forward WinRM and RDP
    cfg.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct:true
    cfg.vm.communicator = "winrm"
    cfg.vm.guest = :windows
    cfg.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct:true

    config.vm.provider :virtualbox do |v, override|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", 2536]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--vram", "256"]
      v.customize ["setextradata", "global", "GUI/MaxGuestResolution", "any"]
      v.customize ["setextradata", :id, "CustomVideoMode1", "1024x768x32"]
    end
  end
end