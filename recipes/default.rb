#
# Cookbook: jmeter
# License: Apache 2.0
#
# Copyright (C) 2014, 2015 Bloomberg Finance L.P.
#
include_recipe 'java::default'

directory node['jmeter']['plan_dir'] do
  recursive true
  not_if { Dir.exists?(path) }
end

package node['jmeter']['package_name'] do
  version node['jmeter']['version']
  only_if { node['jmeter']['install_type'] == 'package' }
end

ark 'jmeter' do
  action :install
  has_binaries ['bin/jmeter', 'bin/jmeter-server', 'bin/ApacheJMeter.jar']
  url node['jmeter']['source_url']
  checksum node['jmeter']['source_checksum']
  version node['jmeter']['version']
  only_if { node['jmeter']['install_type'] == 'source' }
end

if Chef::Resource::ChefGem.instance_methods(false).include(:compile_time)
  chef_gem 'ruby-jmeter' do
    version node['jmeter']['gem_version']
    compile_time true
  end
else
  chef_gem 'ruby-jmeter' do
    version node['jmeter']['gem_version']
  end.run_action(:install)
end

# HACK: Object#test is defined for RubyJmeter::ExtendedDSL.
require 'ruby-jmeter'
class Object; undef test; end

jmeter_plan 'google-search' do
  block do
    test do
      threads count: 10 do
        visit name: 'Google Search', url: 'http://google.com'
      end
    end
  end
end
