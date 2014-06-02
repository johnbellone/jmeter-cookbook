#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
#
# All rights reserved - Do Not Redistribute
# Cookbook Name:: jmeter
# Recipe:: install_source
#
include_recipe 'ark::default'

ark 'jmeter' do
  has_binaries ['bin/jmeter', 'bin/jmeter-server']
  url node[:jmeter][:source_url]
  checksum node[:jmeter][:source_checksum]
  version node[:jmeter][:version]
  action :install
end
