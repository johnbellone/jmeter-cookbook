#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Recipe:: default
#
include_recipe 'chef-sugar::default'
include_recipe 'java::default'

node.set['apt']['compile_time_update'] = true
node.set['build-essential']['compile_time'] = true

include_recipe 'apt' if platform_family?('debian')
include_recipe 'build-essential::default'

directory node['jmeter']['plan_dir'] do
  recursive true
  not_if { ::Dir.exists? node['jmeter']['plan_dir'] }
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

compile_time do
  chef_gem 'ruby-jmeter' do
    version "~> #{node['jmeter']['version']}"
  end

  # HACK: Object#test is defined for RubyJmeter::ExtendedDSL.
  require_chef_gem 'ruby-jmeter'
  class Object; undef test; end
end

jmeter_plan 'google-search' do
  block do
    test do
      threads count: 10 do
        visit name: 'Google Search', url: 'http://google.com'
      end
    end
  end
end
