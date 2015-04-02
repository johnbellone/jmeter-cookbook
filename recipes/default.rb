#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Recipe:: default
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

chef_gem 'ruby-jmeter' do
  version node['jmeter']['gem_version']
end.run_action(:install)

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
