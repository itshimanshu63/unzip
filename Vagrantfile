#VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  config.vm.box = 'windows2016'
  config.vm.box_url = '/Users/h0n0032/Documents/himanshu/boxes/windows2016min-virtualbox.box'
  config.vm.guest = :windows

  config.vm.provider "virtualbox" do |v|
    v.gui = false
  end

  config.vm.communicator = "winrm"
  config.winrm.timeout = 24000
  config.winrm.max_tries = 20

  config.winrm.host = '127.0.0.1'
  config.winrm.username = 'vagrant'
  config.winrm.password = 'vagrant'

  config.vm.provision :chef_solo do |chef|
    chef.log_level         = :info
    chef.cookbooks_path    = [".."]
    chef.add_recipe("unzip::default")
  end

end
