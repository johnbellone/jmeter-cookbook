Vagrant.configure('2') do |config|
  config.vm.provisioner :chef_solo do |chef|
    chef.run_list = ['recipe[jmeter::default]']
  end
end
