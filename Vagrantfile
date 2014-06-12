Vagrant.configure('2') do |config|
  config.vm.box = ENV.fetch('VAGRANT_BOX_NAME', 'opscode-centos-6.5')

  config.berkshelf.enabled = true if Vagrant.has_plugin?('vagrant-berkshelf')

  config.vm.provision :chef_solo do |chef|
    chef.http_proxy = ENV.fetch('http_proxy', nil)
    chef.https_proxy = ENV.fetch('https_proxy', nil)
    chef.no_proxy = ENV.fetch('no_proxy', nil)

    chef.run_list = ['recipe[jmeter::default]']
  end
end
