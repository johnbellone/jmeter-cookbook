require 'spec_helper'

describe_recipe 'jmeter::default' do
  it { expect(chef_run).to include_recipe('build-essential::default') }
  it { expect(chef_run).to include_recipe('chef-sugar::default') }
  it { expect(chef_run).to include_recipe('java::default') }

  it { expect(chef_run).to install_chef_gem('ruby-jmeter').with(version: '~> 2.11') }
  it { expect(chef_run).to run_jmeter_plan('google-search').with(path: nil) }

  context 'with default attributes' do
    it do
      expect(chef_run).to create_directory('/etc/jmeter/plans.d')
        .with(recursive: true)
    end

    it do
      expect(chef_run).to install_ark('jmeter')
        .with(has_binaries: ['bin/jmeter', 'bin/jmeter-server', 'bin/ApacheJMeter.jar'])
        .with(version: '2.11')
        .with(url: 'http://www.us.apache.org/dist/jmeter/binaries/apache-jmeter-2.11.tgz')
        .with(checksum: '84a4edefea3a829aa54ac3dd17570b9ba8daa75d5438f6bc378b596c00d723bb')
    end
  end

  context %Q(node['jmeter']['install_type'] = 'package') do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04') do |node|
        node.set['jmeter']['install_type'] = 'package'
      end.converge(described_recipe)
    end

    it { expect(chef_run).to install_package('jmeter').with(version: '2.11') }
  end
end
