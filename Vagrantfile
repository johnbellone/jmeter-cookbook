Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true if Vagrant.has_plugin?('vagrant-berkshelf')
  config.omnibus.chef_version = :latest if Vagrant.has_plugin?('vagrant-omnibus')
  config.cache.auto_detect = true if Vagrant.has_plugin?('vagrant-cachier')

  config.vm.box = 'opscode-ubuntu-14.04'

  config.vm.provision :chef_solo do |chef|
    chef.run_list = %w(recipe[jmeter::default])
  end
end
