Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true if Vagrant.has_plugin?('vagrant-berkshelf')

  config.vm.provision :chef_solo do |chef|
    chef.run_list = ['recipe[jmeter::default]']
  end
end
